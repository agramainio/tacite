import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewThreadScreen extends StatelessWidget {
  const NewThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start a thread')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _ThreadTypeCard(
              title: 'Treatment change',
              description:
                  'For remembering what changed, why it changed, how you felt before and after, and what to mention later.',
              onTap: () => context.go('/threads/placeholder'),
            ),
            const SizedBox(height: 12),
            _ThreadTypeCard(
              title: 'Appointment preparation',
              description:
                  'For putting into words what feels wrong, what it affects, and what you want help with.',
              onTap: () => context.go('/threads/placeholder'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThreadTypeCard extends StatelessWidget {
  const _ThreadTypeCard({
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                description,
                style: textTheme.bodyMedium?.copyWith(height: 1.35),
              ),
              const SizedBox(height: 12),
              const Text('Continue →'),
            ],
          ),
        ),
      ),
    );
  }
}
