import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';

class TaciteChip extends StatelessWidget {
  const TaciteChip({
    required this.label,
    required this.onTap,
    this.isSelected = false,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final background = isSelected
        ? TaciteColors.accentSoft
        : TaciteColors.panel;
    final border = isSelected ? TaciteColors.accent : TaciteColors.line;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: border),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TaciteSpacing.md,
            vertical: TaciteSpacing.sm,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? TaciteColors.accentInk : TaciteColors.ink,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
