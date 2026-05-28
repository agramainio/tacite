import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_chip.dart';
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
  String _selectedCaptureId = 'free_note';
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
        title: _selectedCaptureLabel(l10n),
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

  void _selectCaptureOption(_CaptureOption option) {
    setState(() {
      _selectedCaptureId = option.id;
      _eventType = option.eventType;
    });
  }

  String _selectedCaptureLabel(AppLocalizations l10n) {
    final options = _captureSections(l10n).expand((section) => section.options);

    return options
        .firstWhere(
          (option) => option.id == _selectedCaptureId,
          orElse: () => _CaptureOption(
            id: 'free_note',
            label: l10n.captureFreeNote,
            eventType: 'note',
          ),
        )
        .label;
  }

  List<_CaptureSection> _captureSections(AppLocalizations l10n) {
    return [
      _CaptureSection(
        title: l10n.captureTreatment,
        options: [
          _CaptureOption(
            id: 'start_treatment',
            label: l10n.captureStartTreatment,
            eventType: 'started_medication',
          ),
          _CaptureOption(
            id: 'change_dose',
            label: l10n.captureChangeDose,
            eventType: 'note',
          ),
          _CaptureOption(
            id: 'stop_treatment',
            label: l10n.captureStopTreatment,
            eventType: 'note',
          ),
          _CaptureOption(
            id: 'missed_late_dose',
            label: l10n.captureMissedLateDose,
            eventType: 'note',
          ),
        ],
      ),
      _CaptureSection(
        title: l10n.captureExperience,
        options: [
          _CaptureOption(
            id: 'mood_anxiety',
            label: l10n.captureMoodAnxiety,
            eventType: 'note',
          ),
          _CaptureOption(
            id: 'sleep',
            label: l10n.captureSleep,
            eventType: 'note',
          ),
          _CaptureOption(
            id: 'focus_tasks',
            label: l10n.captureFocusTasks,
            eventType: 'note',
          ),
          _CaptureOption(
            id: 'side_effect',
            label: l10n.captureSideEffect,
            eventType: 'side_effect_note',
          ),
          _CaptureOption(
            id: 'functioning',
            label: l10n.captureFunctioning,
            eventType: 'note',
          ),
        ],
      ),
      _CaptureSection(
        title: l10n.captureAppointment,
        options: [
          _CaptureOption(
            id: 'question',
            label: l10n.captureQuestion,
            eventType: 'appointment_question',
          ),
          _CaptureOption(
            id: 'thing_to_mention',
            label: l10n.captureThingToMention,
            eventType: 'note',
          ),
          _CaptureOption(
            id: 'summary_note',
            label: l10n.captureSummaryNote,
            eventType: 'note',
          ),
        ],
      ),
      _CaptureSection(
        title: l10n.captureOther,
        options: [
          _CaptureOption(
            id: 'free_note',
            label: l10n.captureFreeNote,
            eventType: 'note',
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final sections = _captureSections(l10n);

    return TaciteScaffold(
      title: l10n.thread,
      actions: [
        TextButton(onPressed: _loadExistingRecords, child: Text(l10n.refresh)),
        TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
      ],
      children: [
        Text(l10n.captureSomething, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.captureSomethingBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        _CaptureCardPanel(
          sections: sections,
          selectedCaptureId: _selectedCaptureId,
          onSelected: _selectCaptureOption,
        ),
        const SizedBox(height: TaciteSpacing.md),
        Text(
          l10n.selectedCaptureKind(_selectedCaptureLabel(l10n)),
          style: TaciteTextStyles.small,
        ),
        const SizedBox(height: TaciteSpacing.md),
        TacitePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

class _CaptureCardPanel extends StatelessWidget {
  const _CaptureCardPanel({
    required this.sections,
    required this.selectedCaptureId,
    required this.onSelected,
  });

  final List<_CaptureSection> sections;
  final String selectedCaptureId;
  final ValueChanged<_CaptureOption> onSelected;

  @override
  Widget build(BuildContext context) {
    return TacitePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final section in sections) ...[
            Text(section.title, style: TaciteTextStyles.label),
            const SizedBox(height: TaciteSpacing.sm),
            Wrap(
              spacing: TaciteSpacing.xs,
              runSpacing: TaciteSpacing.xs,
              children: [
                for (final option in section.options)
                  TaciteChip(
                    label: option.label,
                    isSelected: option.id == selectedCaptureId,
                    onTap: () => onSelected(option),
                  ),
              ],
            ),
            if (section != sections.last)
              const SizedBox(height: TaciteSpacing.lg),
          ],
        ],
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

class _CaptureSection {
  const _CaptureSection({required this.title, required this.options});

  final String title;
  final List<_CaptureOption> options;
}

class _CaptureOption {
  const _CaptureOption({
    required this.id,
    required this.label,
    required this.eventType,
  });

  final String id;
  final String label;
  final String eventType;
}
