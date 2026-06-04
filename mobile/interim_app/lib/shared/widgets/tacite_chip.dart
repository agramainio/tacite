import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';
import '../theme/tacite_text_styles.dart';

class TaciteChip extends StatelessWidget {
  const TaciteChip({
    required this.label,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final background = isSelected
        ? TaciteColors.accentSoft
        : TaciteColors.paper;
    final border = isSelected ? TaciteColors.accent : TaciteColors.line;
    final textColor = isSelected
        ? TaciteColors.accentInk
        : TaciteColors.inkMuted;

    return Semantics(
      button: true,
      selected: isSelected,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: TaciteSpacing.md,
            vertical: TaciteSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: border),
          ),
          child: Text(
            label,
            style: TaciteTextStyles.small.copyWith(
              color: textColor,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
