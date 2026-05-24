import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data/thread_models.dart';
import 'data/thread_repository.dart';

class ThreadDetailScreen extends StatefulWidget {
  const ThreadDetailScreen({required this.threadId, super.key});

  final String threadId;

  @override
  State<ThreadDetailScreen> createState() => _ThreadDetailScreenState();
}

class _ThreadDetailScreenState extends State<ThreadDetailScreen> {
  final _repository = ThreadRepository.defaultRepository();
  final _noteController = TextEditingController();
  final _eventTitleController = TextEditingController();
  final _eventSummaryController = TextEditingController();

  bool _isSavingNote = false;
  bool _isSavingEvent = false;
  String _eventType = 'note';
  String? _message;
  RawNote? _savedNote;
  TimelineEvent? _savedEvent;

  @override
  void dispose() {
    _noteController.dispose();
    _eventTitleController.dispose();
    _eventSummaryController.dispose();
    super.dispose();
  }

  Future<void> _saveRawNote() async {
    final text = _noteController.text.trim();

    if (text.isEmpty) {
      setState(() {
        _message = 'Write a note first.';
      });
      return;
    }

    setState(() {
      _isSavingNote = true;
      _message = null;
      _savedEvent = null;
    });

    try {
      final note = await _repository.createRawNote(
        threadId: widget.threadId,
        originalText: text,
      );

      setState(() {
        _savedNote = note;
        _noteController.clear();
        _eventTitleController.text = 'Manual note';
        _eventSummaryController.text = note.originalText;
        _message =
            'Saved original note. Now create a user-approved timeline event.';
      });
    } on DioException catch (error) {
      setState(() {
        if (error.response?.statusCode == 401) {
          _message = 'Log in first, then save the note.';
        } else if (error.response?.statusCode == 404) {
          _message = 'Thread not found.';
        } else {
          _message = 'Could not save the note: ${error.message}';
        }
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSavingNote = false;
        });
      }
    }
  }

  Future<void> _createTimelineEvent() async {
    final note = _savedNote;
    final title = _eventTitleController.text.trim();
    final summary = _eventSummaryController.text.trim();

    if (note == null) {
      setState(() {
        _message = 'Save an original note first.';
      });
      return;
    }

    if (title.isEmpty || summary.isEmpty) {
      setState(() {
        _message = 'Add a title and approved summary first.';
      });
      return;
    }

    setState(() {
      _isSavingEvent = true;
      _message = null;
    });

    try {
      final event = await _repository.createTimelineEvent(
        threadId: widget.threadId,
        rawNoteId: note.id,
        eventType: _eventType,
        title: title,
        userApprovedSummary: summary,
      );

      setState(() {
        _savedEvent = event;
        _message = 'Saved user-approved timeline event.';
      });
    } on DioException catch (error) {
      setState(() {
        if (error.response?.statusCode == 401) {
          _message = 'Log in first, then create the timeline event.';
        } else if (error.response?.statusCode == 404) {
          _message = 'Thread or raw note not found.';
        } else {
          _message = 'Could not create the timeline event: ${error.message}';
        }
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSavingEvent = false;
        });
      }
    }
  }

  bool get _canCreateTimelineEvent => _savedNote != null && !_isSavingEvent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thread'),
        actions: [
          TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('Log in'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Add a messy note',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Write it as it comes. The original wording is preserved. AI formatting is not used here.',
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _noteController,
              minLines: 5,
              maxLines: 10,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                labelText: 'Messy note',
                hintText: 'Use fake test data while developing.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _isSavingNote ? null : _saveRawNote,
              child: Text(_isSavingNote ? 'Saving…' : 'Save original note'),
            ),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(_message!),
            ],
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableText('Thread ID:\n${widget.threadId}'),
              ),
            ),
            if (_savedNote != null) ...[
              const SizedBox(height: 16),
              _SavedRawNoteCard(note: _savedNote!),
              const SizedBox(height: 16),
              _TimelineEventEditor(
                eventType: _eventType,
                eventTitleController: _eventTitleController,
                eventSummaryController: _eventSummaryController,
                onEventTypeChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _eventType = value;
                  });
                },
                onSave: _canCreateTimelineEvent ? _createTimelineEvent : null,
                isSaving: _isSavingEvent,
              ),
            ],
            if (_savedEvent != null) ...[
              const SizedBox(height: 16),
              _SavedTimelineEventCard(event: _savedEvent!),
            ],
          ],
        ),
      ),
    );
  }
}

class _SavedRawNoteCard extends StatelessWidget {
  const _SavedRawNoteCard({required this.note});

  final RawNote note;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved original note', style: textTheme.titleMedium),
            const SizedBox(height: 8),
            SelectableText(note.originalText),
            const SizedBox(height: 12),
            Text(
              'Saved date: ${note.userLocalDate ?? 'unknown'}',
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineEventEditor extends StatelessWidget {
  const _TimelineEventEditor({
    required this.eventType,
    required this.eventTitleController,
    required this.eventSummaryController,
    required this.onEventTypeChanged,
    required this.onSave,
    required this.isSaving,
  });

  final String eventType;
  final TextEditingController eventTitleController;
  final TextEditingController eventSummaryController;
  final ValueChanged<String?> onEventTypeChanged;
  final VoidCallback? onSave;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create user-approved timeline event',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            const Text('This is manual. No AI is interpreting the note.'),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: eventType,
              decoration: const InputDecoration(
                labelText: 'Event type',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'note', child: Text('Note')),
                DropdownMenuItem(
                  value: 'baseline_snapshot',
                  child: Text('Baseline snapshot'),
                ),
                DropdownMenuItem(
                  value: 'started_medication',
                  child: Text('Started treatment label'),
                ),
                DropdownMenuItem(
                  value: 'side_effect_note',
                  child: Text('Side-effect note'),
                ),
                DropdownMenuItem(
                  value: 'appointment_question',
                  child: Text('Appointment question'),
                ),
              ],
              onChanged: isSaving ? null : onEventTypeChanged,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: eventTitleController,
              decoration: const InputDecoration(
                labelText: 'Timeline title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: eventSummaryController,
              minLines: 4,
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: 'User-approved summary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onSave,
              child: Text(isSaving ? 'Saving event…' : 'Save timeline event'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SavedTimelineEventCard extends StatelessWidget {
  const _SavedTimelineEventCard({required this.event});

  final TimelineEvent event;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved timeline event', style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              event.title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            SelectableText(event.userApprovedSummary),
            const SizedBox(height: 12),
            Text('Source: ${event.source}', style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
