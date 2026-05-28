import 'package:flutter/material.dart';

import '../theme/tacite_spacing.dart';
import '../theme/tacite_text_styles.dart';

class TaciteSectionHeader extends StatelessWidget {
  const TaciteSectionHeader({required this.title, this.subtitle, super.key});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TaciteSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TaciteTextStyles.sectionTitle),
          if (subtitle != null) ...[
            const SizedBox(height: TaciteSpacing.xs),
            Text(subtitle!, style: TaciteTextStyles.bodyMuted),
          ],
        ],
      ),
    );
  }
}
