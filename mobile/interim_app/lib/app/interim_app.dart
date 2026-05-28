import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/login_screen.dart';
import '../features/home/home_screen.dart';
import '../features/onboarding/purpose_onboarding_screen.dart';
import '../features/onboarding/starting_point_screen.dart';
import '../features/summary/summary_screen.dart';
import '../features/thread/new_thread_screen.dart';
import '../features/thread/thread_detail_screen.dart';
import '../features/thread/thread_placeholder_screen.dart';
import '../l10n/generated/app_localizations.dart';
import '../shared/locale/locale_controller.dart';
import '../shared/locale/locale_scope.dart';
import '../shared/theme/interim_theme.dart';

class InterimApp extends StatefulWidget {
  const InterimApp({super.key});

  @override
  State<InterimApp> createState() => _InterimAppState();
}

class _InterimAppState extends State<InterimApp> {
  late final LocaleController _localeController;

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/summary',
        builder: (context, state) => const SummaryScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const PurposeOnboardingScreen(),
      ),
      GoRoute(
        path: '/onboarding/start',
        builder: (context, state) => const StartingPointScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/threads/new',
        builder: (context, state) => const NewThreadScreen(),
      ),
      GoRoute(
        path: '/threads/placeholder',
        builder: (context, state) => const ThreadPlaceholderScreen(),
      ),
      GoRoute(
        path: '/threads/:threadId',
        builder: (context, state) {
          final threadId = state.pathParameters['threadId']!;

          return ThreadDetailScreen(threadId: threadId);
        },
      ),
    ],
  );

  @override
  void initState() {
    super.initState();

    _localeController = LocaleController()..load();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleScope(
      controller: _localeController,
      child: AnimatedBuilder(
        animation: _localeController,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Tacite',
            debugShowCheckedModeBanner: false,
            theme: InterimTheme.light,
            locale: _localeController.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
