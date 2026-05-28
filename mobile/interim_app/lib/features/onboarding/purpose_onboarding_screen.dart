import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_message.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';

class PurposeOnboardingScreen extends StatelessWidget {
  const PurposeOnboardingScreen({super.key});

  void _continue(BuildContext context) {
    context.go('/onboarding/start');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TaciteScaffold(
      title: l10n.appTitle,
      actions: [
        TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
      ],
      children: [
        Text(l10n.onboardingTitle, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.onboardingBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        _PurposeChoicePanel(
          title: l10n.alreadyInCareTitle,
          body: l10n.alreadyInCareBody,
          onPressed: () => _continue(context),
        ),
        const SizedBox(height: TaciteSpacing.md),
        _PurposeChoicePanel(
          title: l10n.preparingForCareTitle,
          body: l10n.preparingForCareBody,
          onPressed: () => _continue(context),
        ),
        const SizedBox(height: TaciteSpacing.md),
        _PurposeChoicePanel(
          title: l10n.justRecordTitle,
          body: l10n.justRecordBody,
          onPressed: () => _continue(context),
        ),
        const SizedBox(height: TaciteSpacing.lg),
        TaciteMessage(message: l10n.setupLaterNote),
      ],
    );
  }
}

class _PurposeChoicePanel extends StatelessWidget {
  const _PurposeChoicePanel({
    required this.title,
    required this.body,
    required this.onPressed,
  });

  final String title;
  final String body;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TacitePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TaciteTextStyles.sectionTitle),
          const SizedBox(height: TaciteSpacing.xs),
          Text(body, style: TaciteTextStyles.bodyMuted),
          const SizedBox(height: TaciteSpacing.md),
          TacitePrimaryButton(label: l10n.continueAction, onPressed: onPressed),
        ],
      ),
    );
  }
}
