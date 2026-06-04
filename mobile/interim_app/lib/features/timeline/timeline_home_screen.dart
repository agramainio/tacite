import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_chip.dart';
import '../../shared/widgets/tacite_message.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../../shared/widgets/tacite_timeline_card.dart';
import '../thread/data/thread_models.dart';
import '../thread/data/thread_repository.dart';

class TimelineHomeScreen extends StatefulWidget {
  const TimelineHomeScreen({this.loadRecordsOnStart = true, super.key});

  final bool loadRecordsOnStart;

  @override
  State<TimelineHomeScreen> createState() => _TimelineHomeScreenState();
}

class _TimelineHomeScreenState extends State<TimelineHomeScreen> {
  static const _recentTopicIdsKey = 'tacite_recent_topic_ids';
  static const _excludeFromSummaryMarker = '[tacite:exclude-from-summary]';

  final _repository = ThreadRepository.defaultRepository();
  final _noteController = TextEditingController();

  bool _isLoading = false;
  bool _isRecording = false;
  bool _hideTextByDefault = true;
  String _summaryStatus = 'include';
  String? _defaultThreadId;
  String? _message;

  final Set<String> _selectedTopicIds = {};
  final Set<String> _revealedEventIds = {};
  final List<TimelineEvent> _timelineEvents = [];
  List<String> _recentTopicIds = [];

  @override
  void initState() {
    super.initState();

    _loadRecentTopics();

    if (widget.loadRecordsOnStart) {
      _loadTimeline();
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _loadRecentTopics() async {
    final preferences = await SharedPreferences.getInstance();
    final recentTopicIds = preferences.getStringList(_recentTopicIdsKey) ?? [];

    if (!mounted) {
      return;
    }

    setState(() {
      _recentTopicIds = recentTopicIds;
    });
  }

  Future<void> _rememberRecentTopics(List<String> topicIds) async {
    if (topicIds.isEmpty) {
      return;
    }

    final preferences = await SharedPreferences.getInstance();
    final updated = <String>[
      ...topicIds,
      ..._recentTopicIds.where((id) => !topicIds.contains(id)),
    ].take(5).toList();

    await preferences.setStringList(_recentTopicIdsKey, updated);

    if (!mounted) {
      return;
    }

    setState(() {
      _recentTopicIds = updated;
    });
  }

  Future<void> _loadTimeline() async {
    final l10n = AppLocalizations.of(context);

    setState(() {
      _isLoading = true;
      _message = l10n.timelineHomeLoading;
    });

    try {
      final thread = await _repository.getDefaultTimeline();
      final events = await _repository.listTimelineEvents(thread.id);

      if (!mounted) {
        return;
      }

      setState(() {
        _defaultThreadId = thread.id;
        _timelineEvents
          ..clear()
          ..addAll(events.reversed);
        _message = null;
        _isLoading = false;
      });
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _message = l10n.timelineHomeCouldNotLoad(error.message ?? l10n.unknown);
        _isLoading = false;
      });
    }
  }

  Future<String> _getDefaultThreadId() async {
    if (_defaultThreadId != null) {
      return _defaultThreadId!;
    }

    final thread = await _repository.getDefaultTimeline();
    _defaultThreadId = thread.id;

    return thread.id;
  }

  Future<void> _recordEntry() async {
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

    final selectedTopics = _selectedTopicIds.toList();

    try {
      final threadId = await _getDefaultThreadId();

      final note = await _repository.createRawNote(
        threadId: threadId,
        originalText: text,
      );

      final event = await _repository.createTimelineEvent(
        threadId: threadId,
        rawNoteId: note.id,
        eventType: _eventTypeForSelectedTopics(),
        title: _entryTitle(l10n),
        userApprovedSummary: _entrySummary(l10n, text),
      );

      await _rememberRecentTopics(selectedTopics);

      if (!mounted) {
        return;
      }

      setState(() {
        _defaultThreadId = threadId;
        _noteController.clear();
        _selectedTopicIds.clear();
        _summaryStatus = 'include';
        _timelineEvents.insert(0, event);
        _message = l10n.recordedToTimeline;
      });
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _message = l10n.timelineHomeCouldNotRecord(
          error.message ?? l10n.unknown,
        );
      });
    } finally {
      if (mounted) {
        setState(() {
          _isRecording = false;
        });
      }
    }
  }

  String _eventTypeForSelectedTopics() {
    if (_selectedTopicIds.contains('question')) {
      return 'appointment_question';
    }

    if (_selectedTopicIds.contains('side_effect')) {
      return 'side_effect_note';
    }

    if (_selectedTopicIds.contains('medication') ||
        _selectedTopicIds.contains('dose_change') ||
        _selectedTopicIds.contains('missed_dose')) {
      return 'started_medication';
    }

    return 'note';
  }

  String _entryTitle(AppLocalizations l10n) {
    final topics = _allTopicOptions(l10n)
        .where((topic) => _selectedTopicIds.contains(topic.id))
        .map((topic) => topic.label)
        .toList();

    if (topics.isEmpty) {
      return l10n.captureFreeNote;
    }

    return topics.join(' · ');
  }

  String _entrySummary(AppLocalizations l10n, String text) {
    final topics = _allTopicOptions(l10n)
        .where((topic) => _selectedTopicIds.contains(topic.id))
        .map((topic) => topic.label)
        .join(' · ');

    final parts = <String>[];

    if (_summaryStatus == 'exclude') {
      parts.add(_excludeFromSummaryMarker);
    }

    if (topics.isNotEmpty) {
      parts.add(topics);
    }

    parts.add(text);

    return parts.join('\n');
  }

  String _displaySummary(String value) {
    return value
        .replaceAll(_excludeFromSummaryMarker, '')
        .replaceAll('#', '')
        .trim();
  }

  String _displayTitle(String value) {
    return value.replaceAll('#', '').replaceAll(' ·  · ', ' · ').trim();
  }

  void _toggleTopic(String id) {
    setState(() {
      if (_selectedTopicIds.contains(id)) {
        _selectedTopicIds.remove(id);
      } else {
        _selectedTopicIds.add(id);
      }
    });
  }

  Future<void> _openMoreTopicsSheet() async {
    final l10n = AppLocalizations.of(context);

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final topics = _secondaryTopicOptions(l10n);

            return SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(TaciteSpacing.page),
                children: [
                  Text(l10n.chooseTopics, style: TaciteTextStyles.screenTitle),
                  const SizedBox(height: TaciteSpacing.xl),
                  Wrap(
                    spacing: TaciteSpacing.xs,
                    runSpacing: TaciteSpacing.xs,
                    children: [
                      for (final topic in topics)
                        TaciteChip(
                          label: topic.label,
                          isSelected: _selectedTopicIds.contains(topic.id),
                          onTap: () {
                            _toggleTopic(topic.id);
                            setSheetState(() {});
                          },
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _toggleReveal(String eventId) {
    setState(() {
      if (_revealedEventIds.contains(eventId)) {
        _revealedEventIds.remove(eventId);
      } else {
        _revealedEventIds.add(eventId);
      }
    });
  }

  void _showTimelineActionPlaceholder(String action) {
    final l10n = AppLocalizations.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.timelineActionPlaceholder(action))),
    );
  }

  void _openSummary() {
    final threadId = _defaultThreadId;

    if (threadId == null) {
      context.push('/summary');
      return;
    }

    context.push('/threads/$threadId/summary');
  }

  List<_ControlledOption> _defaultPrimaryTopicOptions(AppLocalizations l10n) {
    return [
      _ControlledOption('sleep', l10n.tagSleep),
      _ControlledOption('anxiety', l10n.tagAnxiety),
      _ControlledOption('medication', l10n.tagMedication),
      _ControlledOption('side_effect', l10n.tagSideEffect),
      _ControlledOption('question', l10n.tagQuestion),
    ];
  }

  List<_ControlledOption> _primaryTopicOptions(AppLocalizations l10n) {
    final allTopicsById = {
      for (final topic in _allTopicOptions(l10n)) topic.id: topic,
    };

    final ordered = <_ControlledOption>[];

    for (final id in _recentTopicIds) {
      final topic = allTopicsById[id];

      if (topic != null && !ordered.any((item) => item.id == topic.id)) {
        ordered.add(topic);
      }
    }

    for (final topic in _defaultPrimaryTopicOptions(l10n)) {
      if (!ordered.any((item) => item.id == topic.id)) {
        ordered.add(topic);
      }
    }

    return ordered.take(5).toList();
  }

  List<_ControlledOption> _secondaryTopicOptions(AppLocalizations l10n) {
    final primaryIds = _primaryTopicOptions(
      l10n,
    ).map((topic) => topic.id).toSet();

    return _allTopicOptions(
      l10n,
    ).where((topic) => !primaryIds.contains(topic.id)).toList();
  }

  List<_ControlledOption> _allTopicOptions(AppLocalizations l10n) {
    return [
      _ControlledOption('sleep', l10n.tagSleep),
      _ControlledOption('anxiety', l10n.tagAnxiety),
      _ControlledOption('medication', l10n.tagMedication),
      _ControlledOption('side_effect', l10n.tagSideEffect),
      _ControlledOption('question', l10n.tagQuestion),
      _ControlledOption('dose_change', l10n.tagDoseChange),
      _ControlledOption('missed_dose', l10n.tagMissedDose),
      _ControlledOption('mood', l10n.tagMood),
      _ControlledOption('focus', l10n.tagFocus),
      _ControlledOption('tasks', l10n.tagTasks),
      _ControlledOption('work', l10n.tagWork),
      _ControlledOption('self_care', l10n.tagSelfCare),
      _ControlledOption('appointment', l10n.tagAppointment),
      _ControlledOption('hard_to_say', l10n.tagHardToSay),
      _ControlledOption('safety', l10n.tagSafety),
    ];
  }

  String _formatTimelineDate(BuildContext context, TimelineEvent event) {
    final material = MaterialLocalizations.of(context);
    final createdAt = DateTime.tryParse(event.createdAt)?.toLocal();
    final eventDate = DateTime.tryParse(event.eventDate ?? '');

    final displayDate = eventDate ?? createdAt;

    if (displayDate == null) {
      return '';
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final primaryTopics = _primaryTopicOptions(l10n);

    return TaciteScaffold(
      title: l10n.appTitle,
      actions: [
        TextButton(onPressed: _openSummary, child: Text(l10n.summarySoFar)),
      ],
      children: [
        Text(l10n.appTitle, style: TaciteTextStyles.title),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.timelineHomeBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        TacitePanel(
          isEmphasized: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.whatChangedPrompt,
                style: TaciteTextStyles.sectionTitle,
              ),
              const SizedBox(height: TaciteSpacing.sm),
              TextField(
                controller: _noteController,
                minLines: 5,
                maxLines: 10,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(hintText: l10n.whatChangedHint),
              ),
              const SizedBox(height: TaciteSpacing.md),
              Text(l10n.topics, style: TaciteTextStyles.label),
              const SizedBox(height: TaciteSpacing.xs),
              Wrap(
                spacing: TaciteSpacing.xs,
                runSpacing: TaciteSpacing.xs,
                children: [
                  for (final topic in primaryTopics)
                    TaciteChip(
                      label: topic.label,
                      isSelected: _selectedTopicIds.contains(topic.id),
                      onTap: () => _toggleTopic(topic.id),
                    ),
                  TaciteChip(
                    label: l10n.moreTopics,
                    onTap: _openMoreTopicsSheet,
                  ),
                ],
              ),
              const SizedBox(height: TaciteSpacing.md),
              Text(l10n.summaryStatus, style: TaciteTextStyles.label),
              const SizedBox(height: TaciteSpacing.xs),
              Wrap(
                spacing: TaciteSpacing.xs,
                runSpacing: TaciteSpacing.xs,
                children: [
                  TaciteChip(
                    label: l10n.includedInSummary,
                    isSelected: _summaryStatus == 'include',
                    onTap: () {
                      setState(() {
                        _summaryStatus = 'include';
                      });
                    },
                  ),
                  TaciteChip(
                    label: l10n.keepOutOfSummary,
                    isSelected: _summaryStatus == 'exclude',
                    onTap: () {
                      setState(() {
                        _summaryStatus = 'exclude';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: TaciteSpacing.md),
              TacitePrimaryButton(
                onPressed: _isRecording ? null : _recordEntry,
                isBusy: _isRecording,
                label: _isRecording ? l10n.recording : l10n.recordToTimeline,
              ),
            ],
          ),
        ),
        const SizedBox(height: TaciteSpacing.sm),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                _hideTextByDefault = !_hideTextByDefault;
              });
            },
            icon: Icon(
              _hideTextByDefault
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 18,
            ),
            label: Text(
              _hideTextByDefault
                  ? l10n.hideTimelineText
                  : l10n.showTimelineText,
            ),
          ),
        ),
        if (_message != null) ...[
          const SizedBox(height: TaciteSpacing.sm),
          TaciteMessage(message: _message!),
        ],
        const SizedBox(height: TaciteSpacing.xl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(l10n.timeline, style: TaciteTextStyles.screenTitle),
            ),
            TextButton.icon(
              onPressed: _openSummary,
              icon: const Icon(Icons.description_outlined, size: 18),
              label: Text(l10n.summarySoFar),
            ),
            TextButton(onPressed: _loadTimeline, child: Text(l10n.refresh)),
          ],
        ),
        const SizedBox(height: TaciteSpacing.sm),
        if (_isLoading)
          TacitePanel(
            child: Text(
              l10n.timelineHomeLoading,
              style: TaciteTextStyles.bodyMuted,
            ),
          )
        else if (_timelineEvents.isEmpty)
          TacitePanel(
            child: Text(
              l10n.timelineHomeEmpty,
              style: TaciteTextStyles.bodyMuted,
            ),
          )
        else
          for (final event in _timelineEvents)
            Padding(
              padding: const EdgeInsets.only(bottom: TaciteSpacing.sm),
              child: TaciteTimelineCard(
                cardKey: ValueKey('timeline-home-${event.id}'),
                title: _displayTitle(event.title),
                body:
                    _hideTextByDefault && !_revealedEventIds.contains(event.id)
                    ? l10n.hiddenTimelineText
                    : _displaySummary(event.userApprovedSummary),
                meta: _formatTimelineDate(context, event),
                addToSummaryLabel: l10n.addToSummary,
                editLabel: l10n.edit,
                moreOptionsLabel: l10n.moreOptions,
                showOriginalNoteLabel: l10n.showOriginalNote,
                swipeAddToSummaryLabel: l10n.swipeAddToSummary,
                swipeMoreOptionsLabel: l10n.swipeMoreOptions,
                onTap: () => _toggleReveal(event.id),
                onAddToSummary: () =>
                    _showTimelineActionPlaceholder(l10n.addToSummary),
                onEdit: () => _showTimelineActionPlaceholder(l10n.edit),
                onShowOriginalNote: () =>
                    _showTimelineActionPlaceholder(l10n.showOriginalNote),
              ),
            ),
      ],
    );
  }
}

class _ControlledOption {
  const _ControlledOption(this.id, this.label);

  final String id;
  final String label;
}
