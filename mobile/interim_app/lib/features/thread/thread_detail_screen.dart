import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_message.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../../shared/widgets/tacite_section_header.dart';
import '../../shared/widgets/tacite_text_area.dart';
import '../../shared/widgets/tacite_timeline_card.dart';
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

    return TaciteScaffold(
      title: l10n.thread,
      actions: [
        TextButton(onPressed: _loadExistingRecords, child: Text(l10n.refresh)),
        TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
      ],
      children: [
        Text(l10n.recordTimelineNote, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.recordTimelineNoteBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        TacitePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                initialValue: _eventType,
                decoration: InputDecoration(labelText: l10n.kindOfNote),
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
              const SizedBox(height: TaciteSpacing.md),
              TaciteTextArea(
                controller: _noteController,
                label: l10n.messyNote,
                hint: l10n.fakeDataHint,
                minLines: 5,
                maxLines: 10,
              ),
              const SizedBox(height: TaciteSpacing.md),
              TacitePrimaryButton(
                onPressed: _isRecording ? null : _recordToTimeline,
                isBusy: _isRecording,
                label: _isRecording ? l10n.recording : l10n.recordToTimeline,
              ),
            ],
          ),
        ),
        if (_message != null) ...[
          const SizedBox(height: TaciteSpacing.md),
          TaciteMessage(message: _message!),
        ],
        const SizedBox(height: TaciteSpacing.xl),
        _RecordsSection(
          title: l10n.timeline,
          isLoading: _isLoadingExisting,
          emptyText: l10n.noTimelineEventsYet,
          children: [
            for (final event in _timelineEvents)
              TaciteTimelineCard(
                title: event.title,
                body: event.userApprovedSummary,
                meta: l10n.source(event.source),
              ),
          ],
        ),
        const SizedBox(height: TaciteSpacing.lg),
        _RecordsSection(
          title: l10n.originalNotes,
          isLoading: _isLoadingExisting,
          emptyText: l10n.noOriginalNotesYet,
          children: [
            for (final note in _rawNotes) _OriginalNotePanel(note: note),
          ],
        ),
      ],
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaciteSectionHeader(title: title),
        if (isLoading)
          TacitePanel(
            child: Text(
              l10n.loadingSavedRecords,
              style: TaciteTextStyles.bodyMuted,
            ),
          )
        else if (children.isEmpty)
          TacitePanel(child: Text(emptyText, style: TaciteTextStyles.bodyMuted))
        else
          for (final child in children)
            Padding(
              padding: const EdgeInsets.only(bottom: TaciteSpacing.sm),
              child: child,
            ),
      ],
    );
  }
}

class _OriginalNotePanel extends StatelessWidget {
  const _OriginalNotePanel({required this.note});

  final RawNote note;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TacitePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.originalNote, style: TaciteTextStyles.sectionTitle),
          const SizedBox(height: TaciteSpacing.xs),
          SelectableText(note.originalText, style: TaciteTextStyles.body),
          const SizedBox(height: TaciteSpacing.sm),
          Text(
            l10n.savedDate(note.userLocalDate ?? l10n.unknown),
            style: TaciteTextStyles.small,
          ),
        ],
      ),
    );
  }
}
