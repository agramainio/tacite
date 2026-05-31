import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/locale/locale_scope.dart';
import '../../shared/onboarding/onboarding_state_repository.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../../shared/widgets/tacite_secondary_button.dart';
import '../auth/auth_models.dart';
import '../auth/auth_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.loadSessionOnStart = true, super.key});

  final bool loadSessionOnStart;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authRepository = AuthRepository.defaultRepository();
  final _onboardingRepository = OnboardingStateRepository();

  AuthProfile? _profile;
  bool _isCheckingSession = true;
  bool _isCheckingSetup = true;
  bool _isSetupComplete = false;

  @override
  void initState() {
    super.initState();

    _loadSetupState();

    if (widget.loadSessionOnStart) {
      _loadSession();
    } else {
      _isCheckingSession = false;
    }
  }

  Future<void> _loadSetupState() async {
    final isComplete = await _onboardingRepository.isSetupComplete();

    if (!mounted) {
      return;
    }

    setState(() {
      _isSetupComplete = isComplete;
      _isCheckingSetup = false;
    });
  }

  Future<void> _loadSession() async {
    try {
      final profile = await _authRepository.me();

      if (!mounted) {
        return;
      }

      setState(() {
        _profile = profile;
        _isCheckingSession = false;
      });
    } on DioException catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _profile = null;
        _isCheckingSession = false;
      });
    }
  }

  Future<void> _logout() async {
    await _authRepository.logout();

    if (!mounted) {
      return;
    }

    setState(() {
      _profile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final profile = _profile;
    final isReady = !_isCheckingSetup;
    final body = _isSetupComplete
        ? l10n.setupCompleteHomeBody
        : l10n.setupIncompleteHomeBody;

    return TaciteScaffold(
      title: l10n.appTitle,
      actions: [
        if (_isCheckingSession)
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          )
        else if (profile == null)
          TextButton(
            onPressed: () => context.go('/login'),
            child: Text(l10n.login),
          )
        else
          TextButton(onPressed: _logout, child: Text(l10n.logout)),
      ],
      children: [
        Text(l10n.homeHero, style: TaciteTextStyles.title),
        const SizedBox(height: TaciteSpacing.sm),
        Text(body, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        const _LanguagePicker(),
        const SizedBox(height: TaciteSpacing.md),
        _SessionPanel(profile: profile, isCheckingSession: _isCheckingSession),
        const SizedBox(height: TaciteSpacing.xl),
        if (!isReady)
          const Center(child: CircularProgressIndicator())
        else if (_isSetupComplete)
          _DailyHomeActions()
        else
          _SetupHomeActions(),
      ],
    );
  }
}

class _DailyHomeActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        TacitePrimaryButton(
          onPressed: () => context.go('/threads/new'),
          label: l10n.recordSomething,
        ),
        const SizedBox(height: TaciteSpacing.sm),
        TaciteSecondaryButton(
          onPressed: () => context.go('/threads/placeholder'),
          label: l10n.timelinePreview,
        ),
        const SizedBox(height: TaciteSpacing.sm),
        TaciteSecondaryButton(
          onPressed: () => context.go('/summary'),
          label: l10n.summarySoFar,
        ),
      ],
    );
  }
}

class _SetupHomeActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        TacitePrimaryButton(
          onPressed: () => context.go('/onboarding'),
          label: l10n.startSetup,
        ),
        const SizedBox(height: TaciteSpacing.sm),
        TaciteSecondaryButton(
          onPressed: () => context.go('/threads/new'),
          label: l10n.justRecordSomething,
        ),
        const SizedBox(height: TaciteSpacing.sm),
        TaciteSecondaryButton(
          onPressed: () => context.go('/summary'),
          label: l10n.summarySoFar,
        ),
      ],
    );
  }
}

class _LanguagePicker extends StatelessWidget {
  const _LanguagePicker();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final controller = LocaleScope.maybeOf(context);

    if (controller == null) {
      return const SizedBox.shrink();
    }

    final selectedCode =
        controller.locale?.languageCode ??
        Localizations.localeOf(context).languageCode;

    return TacitePanel(
      child: DropdownButtonFormField<String>(
        initialValue: selectedCode,
        decoration: InputDecoration(labelText: l10n.language),
        items: [
          DropdownMenuItem(value: 'en', child: Text(l10n.languageEnglish)),
          DropdownMenuItem(value: 'fr', child: Text(l10n.languageFrench)),
          DropdownMenuItem(value: 'it', child: Text(l10n.languageItalian)),
          DropdownMenuItem(value: 'ru', child: Text(l10n.languageRussian)),
        ],
        onChanged: (value) {
          if (value == null) {
            return;
          }

          controller.setLocale(Locale(value));
        },
      ),
    );
  }
}

class _SessionPanel extends StatelessWidget {
  const _SessionPanel({required this.profile, required this.isCheckingSession});

  final AuthProfile? profile;
  final bool isCheckingSession;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    String title;
    String body;

    if (isCheckingSession) {
      title = l10n.checkingSession;
      body = l10n.checkingSessionBody;
    } else if (profile == null) {
      title = l10n.privateAccountInactive;
      body = l10n.privateAccountInactiveBody;
    } else {
      title = l10n.privateAccountActive;
      body = l10n.privateAccountActiveBody;
    }

    return TacitePanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TaciteTextStyles.sectionTitle),
          const SizedBox(height: TaciteSpacing.xs),
          Text(body, style: TaciteTextStyles.bodyMuted),
        ],
      ),
    );
  }
}
