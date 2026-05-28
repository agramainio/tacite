import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../theme/tacite_spacing.dart';
import '../theme/tacite_text_styles.dart';
import 'tacite_panel.dart';

class BoundaryCard extends StatelessWidget {
  const BoundaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TacitePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.noMedicalAdviceTitle, style: TaciteTextStyles.sectionTitle),
          const SizedBox(height: TaciteSpacing.xs),
          Text(l10n.noMedicalAdviceBody, style: TaciteTextStyles.bodyMuted),
        ],
      ),
    );
  }
}
