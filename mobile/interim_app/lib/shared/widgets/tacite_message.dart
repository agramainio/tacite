import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';
import '../theme/tacite_text_styles.dart';

class TaciteMessage extends StatelessWidget {
  const TaciteMessage({
    required this.message,
    this.isWarning = false,
    super.key,
  });

  final String message;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isWarning ? TaciteColors.warningSoft : TaciteColors.panelSoft,
        borderRadius: BorderRadius.circular(TaciteSpacing.radiusSmall),
        border: Border.all(
          color: isWarning ? TaciteColors.warning : TaciteColors.lineSoft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(TaciteSpacing.md),
        child: Text(message, style: TaciteTextStyles.body),
      ),
    );
  }
}
