import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';

class TaciteScaffold extends StatelessWidget {
  const TaciteScaffold({
    required this.children,
    this.title,
    this.actions = const [],
    this.bottom,
    super.key,
  });

  final String? title;
  final List<Widget> children;
  final Widget? bottom;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaciteColors.paper,
      appBar: title == null && actions.isEmpty
          ? null
          : AppBar(
              title: title == null ? null : Text(title!),
              actions: actions,
            ),
      bottomNavigationBar: bottom,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(TaciteSpacing.page),
          children: children,
        ),
      ),
    );
  }
}
