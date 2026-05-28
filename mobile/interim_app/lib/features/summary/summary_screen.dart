import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_message.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final _summaryController = TextEditingController();

  String _selectedRange = 'since_last_appointment';
  bool _hasInitializedText = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_hasInitializedText) {
      return;
    }

    _summaryController.text = AppLocalizations.of(context).summaryTemplate;
    _hasInitializedText = true;
  }

  @override
  void dispose() {
    _summaryController.dispose();
    super.dispose();
  }

  Future<void> _copySummary() async {
    final l10n = AppLocalizations.of(context);

    await Clipboard.setData(ClipboardData(text: _summaryController.text));

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.summaryCopied)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TaciteScaffold(
      title: l10n.summaryScreenTitle,
      actions: [
        TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
      ],
      children: [
        Text(l10n.summaryScreenTitle, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.summaryScreenBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        TacitePanel(
          child: DropdownButtonFormField<String>(
            initialValue: _selectedRange,
            decoration: InputDecoration(labelText: l10n.summaryRange),
            items: [
              DropdownMenuItem(
                value: 'since_last_appointment',
                child: Text(l10n.summaryRangeSinceLastAppointment),
              ),
              DropdownMenuItem(
                value: 'since_treatment_change',
                child: Text(l10n.summaryRangeSinceTreatmentChange),
              ),
              DropdownMenuItem(
                value: 'since_dose_change',
                child: Text(l10n.summaryRangeSinceDoseChange),
              ),
              DropdownMenuItem(
                value: 'last_2_weeks',
                child: Text(l10n.summaryRangeLastTwoWeeks),
              ),
              DropdownMenuItem(
                value: 'last_month',
                child: Text(l10n.summaryRangeLastMonth),
              ),
              DropdownMenuItem(
                value: 'custom',
                child: Text(l10n.summaryRangeCustom),
              ),
            ],
            onChanged: (value) {
              if (value == null) {
                return;
              }

              setState(() {
                _selectedRange = value;
              });
            },
          ),
        ),
        const SizedBox(height: TaciteSpacing.md),
        TacitePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.summaryDraftLabel, style: TaciteTextStyles.label),
              const SizedBox(height: TaciteSpacing.sm),
              TextField(
                controller: _summaryController,
                minLines: 14,
                maxLines: 22,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: TaciteSpacing.md),
              TacitePrimaryButton(
                label: l10n.copySummary,
                onPressed: _copySummary,
              ),
            ],
          ),
        ),
        const SizedBox(height: TaciteSpacing.md),
        TaciteMessage(message: l10n.summaryNotMedicalAdvice),
      ],
    );
  }
}
