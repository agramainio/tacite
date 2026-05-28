import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';

class TacitePrimaryButton extends StatelessWidget {
  const TacitePrimaryButton({
    required this.label,
    required this.onPressed,
    this.isBusy = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: FilledButton(
        onPressed: isBusy ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: TaciteColors.accent,
          disabledBackgroundColor: TaciteColors.line,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TaciteSpacing.radiusSmall),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
