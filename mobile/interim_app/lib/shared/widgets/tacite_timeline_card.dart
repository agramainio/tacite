import 'package:flutter/material.dart';

import '../theme/tacite_spacing.dart';
import '../theme/tacite_text_styles.dart';
import 'tacite_panel.dart';

class TaciteTimelineCard extends StatelessWidget {
  const TaciteTimelineCard({
    required this.title,
    required this.body,
    required this.meta,
    this.onTap,
    super.key,
  });

  final String title;
  final String body;
  final String meta;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TacitePanel(
      child: InkWell(
        borderRadius: BorderRadius.circular(TaciteSpacing.radius),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(meta, style: TaciteTextStyles.small),
            const SizedBox(height: TaciteSpacing.xs),
            Text(title, style: TaciteTextStyles.sectionTitle),
            const SizedBox(height: TaciteSpacing.xs),
            Text(body, style: TaciteTextStyles.body),
          ],
        ),
      ),
    );
  }
}
