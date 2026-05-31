import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_message.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../thread/data/thread_models.dart';
import '../thread/data/thread_repository.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({this.threadId, this.loadRecords = true, super.key});

  final String? threadId;
  final bool loadRecords;

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final _repository = ThreadRepository.defaultRepository();
  final _summaryController = TextEditingController();

  String _selectedRange = 'since_last_appointment';
  bool _hasInitializedText = false;
  bool _hasLoadedRecords = false;
  bool _isLoading = false;
  String? _message;

  List<TimelineEvent> _timelineEvents = [];
  List<RawNote> _rawNotes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_hasInitializedText) {
      _summaryController.text = AppLocalizations.of(context).summaryTemplate;
      _hasInitializedText = true;
    }

    if (widget.threadId != null && widget.loadRecords && !_hasLoadedRecords) {
      _hasLoadedRecords = true;
      _loadThreadRecords();
    }
  }

  @override
  void dispose() {
    _summaryController.dispose();
    super.dispose();
  }

  Future<void> _loadThreadRecords() async {
    final threadId = widget.threadId;

    if (threadId == null) {
      return;
    }

    final l10n = AppLocalizations.of(context);

    setState(() {
      _isLoading = true;
      _message = l10n.summaryLoading;
    });

    try {
      final notes = await _repository.listRawNotes(threadId);
      final events = await _repository.listTimelineEvents(threadId);

      if (!mounted) {
        return;
      }

      setState(() {
        _rawNotes = notes;
        _timelineEvents = events;
        _summaryController.text = _buildSummaryDraft(l10n);
        _message = l10n.summaryLoadedFromTimeline;
        _isLoading = false;
      });
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _message = l10n.summaryCouldNotLoadTimeline(
          error.message ?? l10n.unknown,
        );
        _isLoading = false;
      });
    }
  }

  Future<void> _copySummary() async {
    final l10n = AppLocalizations.of(context);

    await Clipboard.setData(ClipboardData(text: _summaryController.text));

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.summaryCopied)));
  }

  void _updateRange(String value) {
    final l10n = AppLocalizations.of(context);

    setState(() {
      _selectedRange = value;

      if (widget.threadId != null) {
        _summaryController.text = _buildSummaryDraft(l10n);
      }
    });
  }

  String _buildSummaryDraft(AppLocalizations l10n) {
    final events = _filteredEvents();
    final notes = _filteredNotes();

    if (events.isEmpty && notes.isEmpty) {
      return l10n.summaryNoSavedTimeline;
    }

    final buffer = StringBuffer()
      ..writeln(l10n.summaryScreenTitle)
      ..writeln()
      ..writeln('${l10n.summaryRange}: ${_selectedRangeLabel(l10n)}')
      ..writeln()
      ..writeln(l10n.summaryGeneratedFromSavedData)
      ..writeln()
      ..writeln(l10n.timelineEntriesSection);

    if (events.isEmpty) {
      buffer.writeln('- ${l10n.summaryNoSavedTimeline}');
    } else {
      for (final event in events) {
        final date =
            event.eventDate ?? _datePart(event.createdAt) ?? l10n.noDate;
        buffer.writeln(
          '- $date — ${event.title}: ${event.userApprovedSummary}',
        );
      }
    }

    if (notes.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln(l10n.originalNotesSection);

      for (final note in notes) {
        final date =
            note.userLocalDate ?? _datePart(note.createdAt) ?? l10n.noDate;
        buffer.writeln('- $date — ${note.originalText}');
      }
    }

    buffer
      ..writeln()
      ..writeln(l10n.summaryNotMedicalAdvice);

    return buffer.toString();
  }

  List<TimelineEvent> _filteredEvents() {
    final start = _rangeStart();

    if (start == null) {
      return _timelineEvents;
    }

    return _timelineEvents.where((event) {
      final date = _parseDate(event.eventDate) ?? _parseDate(event.createdAt);

      if (date == null) {
        return true;
      }

      return !date.isBefore(start);
    }).toList();
  }

  List<RawNote> _filteredNotes() {
    final start = _rangeStart();

    if (start == null) {
      return _rawNotes;
    }

    return _rawNotes.where((note) {
      final date = _parseDate(note.userLocalDate) ?? _parseDate(note.createdAt);

      if (date == null) {
        return true;
      }

      return !date.isBefore(start);
    }).toList();
  }

  DateTime? _rangeStart() {
    final now = DateTime.now();

    return switch (_selectedRange) {
      'last_2_weeks' => now.subtract(const Duration(days: 14)),
      'last_month' => now.subtract(const Duration(days: 30)),
      _ => null,
    };
  }

  DateTime? _parseDate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }

  String? _datePart(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return value.split('T').first;
  }

  String _selectedRangeLabel(AppLocalizations l10n) {
    return switch (_selectedRange) {
      'since_treatment_change' => l10n.summaryRangeSinceTreatmentChange,
      'since_dose_change' => l10n.summaryRangeSinceDoseChange,
      'last_2_weeks' => l10n.summaryRangeLastTwoWeeks,
      'last_month' => l10n.summaryRangeLastMonth,
      'custom' => l10n.summaryRangeCustom,
      _ => l10n.summaryRangeSinceLastAppointment,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TaciteScaffold(
      title: l10n.summaryScreenTitle,
      actions: [
        TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
      ],
      children: [
        Text(l10n.summaryScreenTitle, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.summaryScreenBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        TacitePanel(
          child: DropdownButtonFormField<String>(
            initialValue: _selectedRange,
            decoration: InputDecoration(labelText: l10n.summaryRange),
            items: [
              DropdownMenuItem(
                value: 'since_last_appointment',
                child: Text(l10n.summaryRangeSinceLastAppointment),
              ),
              DropdownMenuItem(
                value: 'since_treatment_change',
                child: Text(l10n.summaryRangeSinceTreatmentChange),
              ),
              DropdownMenuItem(
                value: 'since_dose_change',
                child: Text(l10n.summaryRangeSinceDoseChange),
              ),
              DropdownMenuItem(
                value: 'last_2_weeks',
                child: Text(l10n.summaryRangeLastTwoWeeks),
              ),
              DropdownMenuItem(
                value: 'last_month',
                child: Text(l10n.summaryRangeLastMonth),
              ),
              DropdownMenuItem(
                value: 'custom',
                child: Text(l10n.summaryRangeCustom),
              ),
            ],
            onChanged: (value) {
              if (value == null) {
                return;
              }

              _updateRange(value);
            },
          ),
        ),
        if (_message != null) ...[
          const SizedBox(height: TaciteSpacing.md),
          TaciteMessage(message: _message!),
        ],
        const SizedBox(height: TaciteSpacing.md),
        TacitePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.summaryDraftLabel, style: TaciteTextStyles.label),
              const SizedBox(height: TaciteSpacing.sm),
              TextField(
                controller: _summaryController,
                minLines: 14,
                maxLines: 22,
                enabled: !_isLoading,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: TaciteSpacing.md),
              TacitePrimaryButton(
                label: l10n.copySummary,
                onPressed: _isLoading ? null : _copySummary,
              ),
            ],
          ),
        ),
        const SizedBox(height: TaciteSpacing.md),
        TaciteMessage(message: l10n.summaryNotMedicalAdvice),
      ],
    );
  }
}
