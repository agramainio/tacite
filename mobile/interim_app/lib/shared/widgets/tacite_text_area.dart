import 'package:flutter/material.dart';

class TaciteTextArea extends StatelessWidget {
  const TaciteTextArea({
    required this.controller,
    required this.label,
    this.hint,
    this.minLines = 4,
    this.maxLines = 8,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}
