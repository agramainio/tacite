import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';

class TaciteSecondaryButton extends StatelessWidget {
  const TaciteSecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: TaciteColors.ink,
          side: const BorderSide(color: TaciteColors.line),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TaciteSpacing.radiusSmall),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
