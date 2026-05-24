import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/locale/locale_scope.dart';
import '../../shared/widgets/boundary_card.dart';
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

  AuthProfile? _profile;
  bool _isCheckingSession = true;

  @override
  void initState() {
    super.initState();

    if (widget.loadSessionOnStart) {
      _loadSession();
    } else {
      _isCheckingSession = false;
    }
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
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }

      if (error.response?.statusCode == 401) {
        setState(() {
          _profile = null;
          _isCheckingSession = false;
        });
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
    final textTheme = Theme.of(context).textTheme;
    final profile = _profile;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
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
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              l10n.homeHero,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.homeBody,
              style: textTheme.bodyLarge?.copyWith(height: 1.35),
            ),
            const SizedBox(height: 20),
            const _LanguagePicker(),
            const SizedBox(height: 20),
            _SessionCard(
              profile: profile,
              isCheckingSession: _isCheckingSession,
            ),
            const SizedBox(height: 20),
            const BoundaryCard(),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => context.go('/threads/new'),
              child: Text(l10n.startThread),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => context.go('/threads/placeholder'),
              child: Text(l10n.viewSampleTimeline),
            ),
            const SizedBox(height: 28),
            const _PrinciplesList(),
          ],
        ),
      ),
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<String>(
          initialValue: selectedCode,
          decoration: InputDecoration(
            labelText: l10n.language,
            border: const OutlineInputBorder(),
          ),
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
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.profile, required this.isCheckingSession});

  final AuthProfile? profile;
  final bool isCheckingSession;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    String title;
    String body;

    if (isCheckingSession) {
      title = l10n.checkingSession;
      body = l10n.checkingSessionBody;
    } else if (profile == null) {
      title = l10n.notLoggedIn;
      body = l10n.loginBeforePrivateRecords;
    } else {
      title = l10n.loggedIn;
      body = profile!.emailIdentifier;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(body),
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
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    final items = [
      l10n.boundaryNoRealName,
      l10n.boundaryAiOptional,
      l10n.boundaryOriginalNotes,
      l10n.boundaryNoShame,
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.productBoundaries, style: textTheme.titleMedium),
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
