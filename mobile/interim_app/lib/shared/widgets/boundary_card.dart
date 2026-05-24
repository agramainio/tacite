import 'package:flutter/material.dart';

class BoundaryCard extends StatelessWidget {
  const BoundaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTextStyle(
          style: textTheme.bodyMedium!.copyWith(height: 1.35),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No medical advice',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'interim helps you record and organize your own notes. '
                'It does not diagnose, recommend treatment, or replace a doctor, '
                'psychiatrist, psychologist, therapist, or emergency service.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
