import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/widgets/boundary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('interim'),
        actions: [
          TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('Log in'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'A private memory for what you may need to explain later.',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Capture messy notes, keep the original wording, and prepare an editable summary for an appointment.',
              style: textTheme.bodyLarge?.copyWith(height: 1.35),
            ),
            const SizedBox(height: 20),
            const BoundaryCard(),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => context.go('/threads/new'),
              child: const Text('Start a thread'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => context.go('/threads/placeholder'),
              child: const Text('View sample timeline'),
            ),
            const SizedBox(height: 28),
            const _PrinciplesList(),
          ],
        ),
      ),
    );
  }
}

class _PrinciplesList extends StatelessWidget {
  const _PrinciplesList();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    const items = [
      'No real name required.',
      'AI is optional and off by default.',
      'Original notes are preserved.',
      'Skip is normal. No streaks, no shame.',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product boundaries', style: textTheme.titleMedium),
            const SizedBox(height: 12),
            for (final item in items)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('— '),
                    Expanded(child: Text(item)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
