import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/onboarding/onboarding_state_repository.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_chip.dart';
import '../../shared/widgets/tacite_message.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../../shared/widgets/tacite_secondary_button.dart';

class StartingPointScreen extends StatefulWidget {
  const StartingPointScreen({super.key});

  @override
  State<StartingPointScreen> createState() => _StartingPointScreenState();
}

class _StartingPointScreenState extends State<StartingPointScreen> {
  final _onboardingRepository = OnboardingStateRepository();

  String _timelineBeginning = 'today';
  bool _showSnapshot = false;

  final Map<String, String> _snapshotValues = {
    'mood': 'mixed',
    'anxiety': 'mixed',
    'sleep': 'mixed',
    'energy': 'mixed',
    'focus': 'mixed',
    'starting_tasks': 'mixed',
  };

  Future<void> _continue() async {
    await _onboardingRepository.markSetupComplete();

    if (!mounted) {
      return;
    }

    context.go('/threads/new');
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
        Text(l10n.timelineBeginningTitle, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.timelineBeginningBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        _TimelineBeginningChoices(
          selectedValue: _timelineBeginning,
          onChanged: (value) {
            setState(() {
              _timelineBeginning = value;
            });
          },
        ),
        const SizedBox(height: TaciteSpacing.xl),
        TacitePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.startingSnapshotTitle,
                style: TaciteTextStyles.sectionTitle,
              ),
              const SizedBox(height: TaciteSpacing.xs),
              Text(
                l10n.startingSnapshotBody,
                style: TaciteTextStyles.bodyMuted,
              ),
              const SizedBox(height: TaciteSpacing.md),
              if (!_showSnapshot) ...[
                TacitePrimaryButton(
                  label: l10n.quickSnapshot,
                  onPressed: () {
                    setState(() {
                      _showSnapshot = true;
                    });
                  },
                ),
                const SizedBox(height: TaciteSpacing.sm),
                TaciteSecondaryButton(
                  label: l10n.skipForNow,
                  onPressed: _continue,
                ),
              ] else ...[
                _SnapshotRow(
                  label: l10n.snapshotMood,
                  value: _snapshotValues['mood']!,
                  options: [
                    _SnapshotOption('low', l10n.snapshotLow),
                    _SnapshotOption('mixed', l10n.snapshotMixed),
                    _SnapshotOption('okay', l10n.snapshotOkay),
                  ],
                  onChanged: (value) => _setSnapshotValue('mood', value),
                ),
                _SnapshotRow(
                  label: l10n.snapshotAnxiety,
                  value: _snapshotValues['anxiety']!,
                  options: [
                    _SnapshotOption('low', l10n.snapshotLow),
                    _SnapshotOption('mixed', l10n.snapshotMixed),
                    _SnapshotOption('high', l10n.snapshotHigh),
                  ],
                  onChanged: (value) => _setSnapshotValue('anxiety', value),
                ),
                _SnapshotRow(
                  label: l10n.snapshotSleep,
                  value: _snapshotValues['sleep']!,
                  options: [
                    _SnapshotOption('hard', l10n.snapshotHard),
                    _SnapshotOption('mixed', l10n.snapshotMixed),
                    _SnapshotOption('okay', l10n.snapshotOkay),
                  ],
                  onChanged: (value) => _setSnapshotValue('sleep', value),
                ),
                _SnapshotRow(
                  label: l10n.snapshotEnergy,
                  value: _snapshotValues['energy']!,
                  options: [
                    _SnapshotOption('low', l10n.snapshotLow),
                    _SnapshotOption('mixed', l10n.snapshotMixed),
                    _SnapshotOption('okay', l10n.snapshotOkay),
                  ],
                  onChanged: (value) => _setSnapshotValue('energy', value),
                ),
                _SnapshotRow(
                  label: l10n.snapshotFocus,
                  value: _snapshotValues['focus']!,
                  options: [
                    _SnapshotOption('hard', l10n.snapshotHard),
                    _SnapshotOption('mixed', l10n.snapshotMixed),
                    _SnapshotOption('okay', l10n.snapshotOkay),
                  ],
                  onChanged: (value) => _setSnapshotValue('focus', value),
                ),
                _SnapshotRow(
                  label: l10n.snapshotStartingTasks,
                  value: _snapshotValues['starting_tasks']!,
                  options: [
                    _SnapshotOption('hard', l10n.snapshotHard),
                    _SnapshotOption('mixed', l10n.snapshotMixed),
                    _SnapshotOption('possible', l10n.snapshotPossible),
                  ],
                  onChanged: (value) =>
                      _setSnapshotValue('starting_tasks', value),
                ),
                const SizedBox(height: TaciteSpacing.md),
                TacitePrimaryButton(
                  label: l10n.continueToFirstThread,
                  onPressed: _continue,
                ),
                const SizedBox(height: TaciteSpacing.sm),
                TaciteSecondaryButton(
                  label: l10n.skipForNow,
                  onPressed: _continue,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: TaciteSpacing.lg),
        TaciteMessage(message: l10n.setupLaterNote),
      ],
    );
  }

  void _setSnapshotValue(String key, String value) {
    setState(() {
      _snapshotValues[key] = value;
    });
  }
}

class _TimelineBeginningChoices extends StatelessWidget {
  const _TimelineBeginningChoices({
    required this.selectedValue,
    required this.onChanged,
  });

  final String selectedValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final options = [
      _SnapshotOption('today', l10n.timelineBeginToday),
      _SnapshotOption('when_started', l10n.timelineBeginWhenStarted),
      _SnapshotOption('treatment_changed', l10n.timelineBeginTreatmentChanged),
      _SnapshotOption('last_appointment', l10n.timelineBeginLastAppointment),
      _SnapshotOption('not_sure', l10n.timelineBeginNotSure),
    ];

    return TacitePanel(
      child: Wrap(
        spacing: TaciteSpacing.sm,
        runSpacing: TaciteSpacing.sm,
        children: [
          for (final option in options)
            TaciteChip(
              label: option.label,
              isSelected: selectedValue == option.value,
              onTap: () => onChanged(option.value),
            ),
        ],
      ),
    );
  }
}

class _SnapshotRow extends StatelessWidget {
  const _SnapshotRow({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String label;
  final String value;
  final List<_SnapshotOption> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TaciteSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TaciteTextStyles.label),
          const SizedBox(height: TaciteSpacing.xs),
          Wrap(
            spacing: TaciteSpacing.xs,
            runSpacing: TaciteSpacing.xs,
            children: [
              for (final option in options)
                TaciteChip(
                  label: option.label,
                  isSelected: value == option.value,
                  onTap: () => onChanged(option.value),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SnapshotOption {
  const _SnapshotOption(this.value, this.label);

  final String value;
  final String label;
}
