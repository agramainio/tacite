import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';

class TacitePanel extends StatelessWidget {
  const TacitePanel({
    required this.child,
    this.padding = const EdgeInsets.all(TaciteSpacing.lg),
    this.isEmphasized = false,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool isEmphasized;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isEmphasized ? TaciteColors.panel : TaciteColors.panelSoft,
        borderRadius: BorderRadius.circular(TaciteSpacing.radius),
        border: Border.all(
          color: isEmphasized ? TaciteColors.line : TaciteColors.lineSoft,
        ),
        boxShadow: isEmphasized
            ? const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
