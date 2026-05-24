import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import 'data/thread_models.dart';
import 'data/thread_repository.dart';

class ThreadDetailScreen extends StatefulWidget {
  const ThreadDetailScreen({
    required this.threadId,
    this.loadExistingRecords = true,
    super.key,
  });

  final String threadId;
  final bool loadExistingRecords;

  @override
  State<ThreadDetailScreen> createState() => _ThreadDetailScreenState();
}

class _ThreadDetailScreenState extends State<ThreadDetailScreen> {
  final _repository = ThreadRepository.defaultRepository();
  final _noteController = TextEditingController();

  bool _isLoadingExisting = true;
  bool _isRecording = false;
  String _eventType = 'note';
  String? _message;

  final List<RawNote> _rawNotes = [];
  final List<TimelineEvent> _timelineEvents = [];

  @override
  void initState() {
    super.initState();

    if (widget.loadExistingRecords) {
      _loadExistingRecords();
    } else {
      _isLoadingExisting = false;
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _loadExistingRecords() async {
    setState(() {
      _isLoadingExisting = true;
      _message = null;
    });

    try {
      final notes = await _repository.listRawNotes(widget.threadId);
      final events = await _repository.listTimelineEvents(widget.threadId);

      if (!mounted) {
        return;
      }

      setState(() {
        _rawNotes
          ..clear()
          ..addAll(notes.reversed);
        _timelineEvents
          ..clear()
          ..addAll(events.reversed);
        _isLoadingExisting = false;
      });
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }

      final l10n = AppLocalizations.of(context);

      setState(() {
        if (error.response?.statusCode == 401) {
          _message = l10n.loginFromHomeFirst;
        } else if (error.response?.statusCode == 404) {
          _message = l10n.threadNotFound;
        } else {
          _message = l10n.couldNotLoadSavedRecords(error.message ?? 'unknown');
        }
        _isLoadingExisting = false;
      });
    }
  }

  Future<void> _recordToTimeline() async {
    final l10n = AppLocalizations.of(context);
    final text = _noteController.text.trim();

    if (text.isEmpty) {
      setState(() {
        _message = l10n.writeNoteFirst;
      });
      return;
    }

    setState(() {
      _isRecording = true;
      _message = null;
    });

    try {
      final note = await _repository.createRawNote(
        threadId: widget.threadId,
        originalText: text,
      );

      final event = await _repository.createTimelineEvent(
        threadId: widget.threadId,
        rawNoteId: note.id,
        eventType: _eventType,
        title: _defaultTitleFor(_eventType, l10n),
        userApprovedSummary: note.originalText,
      );

      setState(() {
        _noteController.clear();
        _rawNotes.insert(0, note);
        _timelineEvents.insert(0, event);
        _message = l10n.recordedToTimeline;
      });
    } on DioException catch (error) {
      setState(() {
        if (error.response?.statusCode == 401) {
          _message = l10n.loginFromHomeFirst;
        } else if (error.response?.statusCode == 404) {
          _message = l10n.threadOrRawNoteNotFound;
        } else {
          _message = l10n.couldNotRecordNote(error.message ?? 'unknown');
        }
      });
    } finally {
      if (mounted) {
        setState(() {
          _isRecording = false;
        });
      }
    }
  }

  String _defaultTitleFor(String eventType, AppLocalizations l10n) {
    return switch (eventType) {
      'baseline_snapshot' => l10n.baselineSnapshot,
      'started_medication' => l10n.startedTreatmentLabel,
      'side_effect_note' => l10n.sideEffectNote,
      'appointment_question' => l10n.appointmentQuestion,
      _ => l10n.note,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.thread),
        actions: [
          TextButton(
            onPressed: _loadExistingRecords,
            child: Text(l10n.refresh),
          ),
          TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              l10n.recordTimelineNote,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(l10n.recordTimelineNoteBody),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              initialValue: _eventType,
              decoration: InputDecoration(
                labelText: l10n.kindOfNote,
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: 'note', child: Text(l10n.note)),
                DropdownMenuItem(
                  value: 'baseline_snapshot',
                  child: Text(l10n.baselineSnapshot),
                ),
                DropdownMenuItem(
                  value: 'started_medication',
                  child: Text(l10n.startedTreatmentLabel),
                ),
                DropdownMenuItem(
                  value: 'side_effect_note',
                  child: Text(l10n.sideEffectNote),
                ),
                DropdownMenuItem(
                  value: 'appointment_question',
                  child: Text(l10n.appointmentQuestion),
                ),
              ],
              onChanged: _isRecording
                  ? null
                  : (value) {
                      if (value == null) {
                        return;
                      }

                      setState(() {
                        _eventType = value;
                      });
                    },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _noteController,
              minLines: 5,
              maxLines: 10,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                labelText: l10n.messyNote,
                hintText: l10n.fakeDataHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _isRecording ? null : _recordToTimeline,
              child: Text(
                _isRecording ? l10n.recording : l10n.recordToTimeline,
              ),
            ),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(_message!),
            ],
            const SizedBox(height: 24),
            _RecordsSection(
              title: l10n.timeline,
              isLoading: _isLoadingExisting,
              emptyText: l10n.noTimelineEventsYet,
              children: [
                for (final event in _timelineEvents)
                  _SavedTimelineEventCard(event: event),
              ],
            ),
            const SizedBox(height: 16),
            _RecordsSection(
              title: l10n.originalNotes,
              isLoading: _isLoadingExisting,
              emptyText: l10n.noOriginalNotesYet,
              children: [
                for (final note in _rawNotes) _SavedRawNoteCard(note: note),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordsSection extends StatelessWidget {
  const _RecordsSection({
    required this.title,
    required this.isLoading,
    required this.emptyText,
    required this.children,
  });

  final String title;
  final bool isLoading;
  final String emptyText;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleLarge),
        const SizedBox(height: 12),
        if (isLoading)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(l10n.loadingSavedRecords),
            ),
          )
        else if (children.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(emptyText),
            ),
          )
        else
          for (final child in children)
            Padding(padding: const EdgeInsets.only(bottom: 12), child: child),
      ],
    );
  }
}

class _SavedRawNoteCard extends StatelessWidget {
  const _SavedRawNoteCard({required this.note});

  final RawNote note;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.originalNote, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            SelectableText(note.originalText),
            const SizedBox(height: 12),
            Text(
              l10n.savedDate(note.userLocalDate ?? l10n.unknown),
              style: textTheme.bodySmall,
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
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.timelineEvent, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              event.title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            SelectableText(event.userApprovedSummary),
            const SizedBox(height: 12),
            Text(l10n.source(event.source), style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
