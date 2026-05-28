import 'package:flutter/material.dart';

import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../../shared/widgets/tacite_timeline_card.dart';

class ThreadPlaceholderScreen extends StatelessWidget {
  const ThreadPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const entries = [
      ('1 May', 'Started treatment label ABC. Baseline note preserved.'),
      (
        '5 May',
        'Sleep felt worse. Dread felt lower. Emoji meaning unconfirmed.',
      ),
      ('8 May', 'Question to discuss at next appointment.'),
    ];

    return TaciteScaffold(
      title: 'Timeline',
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
              meta: entry.$1,
              title: 'Preview entry',
              body: entry.$2,
            ),
          ),
      ],
    );
  }
}
