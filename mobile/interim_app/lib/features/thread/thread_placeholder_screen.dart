import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../../shared/widgets/tacite_timeline_card.dart';

class ThreadPlaceholderScreen extends StatelessWidget {
  const ThreadPlaceholderScreen({super.key});

  void _showPlaceholder(BuildContext context, String action) {
    final l10n = AppLocalizations.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.timelineActionPlaceholder(action))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final entries = [
      (
        '1 May',
        'Preview entry',
        'Started treatment label ABC. Baseline note preserved.',
      ),
      (
        '5 May',
        'Preview entry',
        'Sleep felt worse. Dread felt lower. Emoji meaning unconfirmed.',
      ),
      ('8 May', 'Preview entry', 'Question to discuss at next appointment.'),
    ];

    return TaciteScaffold(
      title: l10n.timeline,
      children: [
        Text('Timeline preview', style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        const Text(
          'Confirmed entries will appear here. AI drafts will never become final without review.',
          style: TaciteTextStyles.bodyMuted,
        ),
        const SizedBox(height: TaciteSpacing.xl),
        for (final entry in entries)
          Padding(
            padding: const EdgeInsets.only(bottom: TaciteSpacing.sm),
            child: TaciteTimelineCard(
              cardKey: ValueKey('preview-${entry.$1}'),
              meta: entry.$1,
              title: entry.$2,
              body: entry.$3,
              addToSummaryLabel: l10n.addToSummary,
              editLabel: l10n.edit,
              moreOptionsLabel: l10n.moreOptions,
              showOriginalNoteLabel: l10n.showOriginalNote,
              swipeAddToSummaryLabel: l10n.swipeAddToSummary,
              swipeMoreOptionsLabel: l10n.swipeMoreOptions,
              onAddToSummary: () =>
                  _showPlaceholder(context, l10n.addToSummary),
              onEdit: () => _showPlaceholder(context, l10n.edit),
              onShowOriginalNote: () =>
                  _showPlaceholder(context, l10n.showOriginalNote),
            ),
          ),
      ],
    );
  }
}
