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
  static const _excludeFromSummaryMarker = '[tacite:exclude-from-summary]';

  final _repository = ThreadRepository.defaultRepository();
  final _summaryController = TextEditingController();

  String _selectedRange = 'since_last_appointment';
  String _savedSummaryText = '';
  String _draftBeforeEdit = '';
  bool _hasInitializedText = false;
  bool _hasLoadedRecords = false;
  bool _isLoading = false;
  bool _isEditing = false;
  String? _message;

  List<TimelineEvent> _timelineEvents = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_hasInitializedText) {
      final l10n = AppLocalizations.of(context);
      _savedSummaryText = widget.threadId == null
          ? l10n.summaryNoSavedTimeline
          : l10n.summaryTemplate;
      _summaryController.text = _savedSummaryText;
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
      final events = await _repository.listTimelineEvents(threadId);

      if (!mounted) {
        return;
      }

      setState(() {
        _timelineEvents = events;
        _savedSummaryText = _buildSummaryDraft(context, l10n);
        _summaryController.text = _savedSummaryText;
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

    await Clipboard.setData(ClipboardData(text: _savedSummaryText));

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.summaryCopied)));
  }

  void _startEditing() {
    setState(() {
      _draftBeforeEdit = _summaryController.text;
      _isEditing = true;
    });
  }

  void _saveEditing() {
    final l10n = AppLocalizations.of(context);

    setState(() {
      _savedSummaryText = _summaryController.text;
      _isEditing = false;
      _message = l10n.summarySaved;
    });
  }

  void _cancelEditing() {
    setState(() {
      _summaryController.text = _draftBeforeEdit;
      _isEditing = false;
    });
  }

  void _updateRange(String value) {
    final l10n = AppLocalizations.of(context);

    setState(() {
      _selectedRange = value;

      if (widget.threadId != null && !_isEditing) {
        _savedSummaryText = _buildSummaryDraft(context, l10n);
        _summaryController.text = _savedSummaryText;
      }
    });
  }

  String _buildSummaryDraft(BuildContext context, AppLocalizations l10n) {
    final events = _filteredEvents();

    if (events.isEmpty) {
      return l10n.summaryNoSavedTimeline;
    }

    final buffer = StringBuffer()
      ..writeln(l10n.summaryScreenTitle)
      ..writeln()
      ..writeln('${l10n.summaryRange}: ${_selectedRangeLabel(l10n)}')
      ..writeln()
      ..writeln(l10n.timelineEntriesSection);

    for (final event in events) {
      final date = _formatEventDateTime(context, event);
      final text = _cleanSummaryText(event.userApprovedSummary);

      if (text.isEmpty) {
        continue;
      }

      buffer.writeln('- $date — ${event.title}: $text');
    }

    return buffer.toString().trim();
  }

  List<TimelineEvent> _filteredEvents() {
    final start = _rangeStart();

    final events = _timelineEvents.where((event) {
      if (_isExcludedFromSummary(event)) {
        return false;
      }

      if (start == null) {
        return true;
      }

      final date = _parseDate(event.eventDate) ?? _parseDate(event.createdAt);

      if (date == null) {
        return true;
      }

      return !date.isBefore(start);
    }).toList();

    return events;
  }

  bool _isExcludedFromSummary(TimelineEvent event) {
    return event.userApprovedSummary.contains(_excludeFromSummaryMarker);
  }

  String _cleanSummaryText(String value) {
    return value
        .replaceAll(_excludeFromSummaryMarker, '')
        .replaceAll('#', '')
        .trim();
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

  String _formatEventDateTime(BuildContext context, TimelineEvent event) {
    final material = MaterialLocalizations.of(context);
    final createdAt = DateTime.tryParse(event.createdAt)?.toLocal();
    final eventDate = DateTime.tryParse(event.eventDate ?? '');

    final displayDate = eventDate ?? createdAt;

    if (displayDate == null) {
      return AppLocalizations.of(context).noDate;
    }

    final date = material.formatMediumDate(displayDate);

    if (createdAt == null) {
      return date;
    }

    final time = material.formatTimeOfDay(
      TimeOfDay.fromDateTime(createdAt),
      alwaysUse24HourFormat: true,
    );

    return '$date · $time';
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
        TextButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
          child: Text(l10n.home),
        ),
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
            onChanged: _isEditing
                ? null
                : (value) {
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
        Text(l10n.summaryReadOnlyHint, style: TaciteTextStyles.small),
        const SizedBox(height: TaciteSpacing.md),
        if (_isEditing) ...[
          Row(
            children: [
              Expanded(
                child: TacitePrimaryButton(
                  label: l10n.saveSummaryChanges,
                  onPressed: _isLoading ? null : _saveEditing,
                ),
              ),
              const SizedBox(width: TaciteSpacing.sm),
              TextButton(
                onPressed: _isLoading ? null : _cancelEditing,
                child: Text(l10n.cancelSummaryEdit),
              ),
            ],
          ),
          const SizedBox(height: TaciteSpacing.md),
          TextField(
            controller: _summaryController,
            minLines: 14,
            maxLines: 22,
            enabled: !_isLoading,
            textInputAction: TextInputAction.newline,
            decoration: const InputDecoration(),
          ),
        ] else ...[
          SelectableText(_savedSummaryText, style: TaciteTextStyles.body),
          const SizedBox(height: TaciteSpacing.md),
          Column(
            children: [
              TacitePrimaryButton(
                label: l10n.editSummary,
                onPressed: _isLoading ? null : _startEditing,
              ),
              const SizedBox(height: TaciteSpacing.sm),
              TextButton(
                onPressed: _isLoading ? null : _copySummary,
                child: Text(l10n.copySummary),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
