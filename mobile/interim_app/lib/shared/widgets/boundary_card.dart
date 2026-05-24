import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';

class BoundaryCard extends StatelessWidget {
  const BoundaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTextStyle(
          style: textTheme.bodyMedium!.copyWith(height: 1.35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.noMedicalAdviceTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(l10n.noMedicalAdviceBody),
            ],
          ),
        ),
      ),
    );
  }
}
