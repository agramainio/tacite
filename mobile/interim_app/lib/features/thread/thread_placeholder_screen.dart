import 'package:flutter/material.dart';

class ThreadPlaceholderScreen extends StatelessWidget {
  const ThreadPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const entries = [
      ('1 May', 'Started treatment label ABC. Baseline note preserved.'),
      (
        '5 May',
        'Sleep felt worse. Dread felt lower. Emoji meaning unconfirmed.',
      ),
      ('8 May', 'Question to discuss at next appointment.'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Timeline')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Timeline preview',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text(
              'Confirmed entries will appear here. AI drafts will never become final without review.',
            ),
            const SizedBox(height: 20),
            for (final entry in entries)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 64,
                          child: Text(
                            entry.$1,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(child: Text(entry.$2)),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
