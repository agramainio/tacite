import 'package:flutter/material.dart';

class ThreadDetailScreen extends StatelessWidget {
  const ThreadDetailScreen({required this.threadId, super.key});

  final String threadId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thread')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Thread created',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text(
              'This thread now exists in the backend. The next step is adding a messy note while preserving the original wording.',
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableText('Thread ID:\n$threadId'),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: null,
              child: Text('Add messy note — next checkpoint'),
            ),
          ],
        ),
      ),
    );
  }
}
