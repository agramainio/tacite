import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';

class TacitePanel extends StatelessWidget {
  const TacitePanel({
    required this.child,
    this.padding = const EdgeInsets.all(TaciteSpacing.panel),
    this.backgroundColor = TaciteColors.panel,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(TaciteSpacing.radius),
        border: Border.all(color: TaciteColors.line),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
