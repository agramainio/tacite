import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/thread/new_thread_screen.dart';
import '../features/thread/thread_placeholder_screen.dart';
import '../shared/theme/interim_theme.dart';

class InterimApp extends StatelessWidget {
  const InterimApp({super.key});

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/threads/new',
        builder: (context, state) => const NewThreadScreen(),
      ),
      GoRoute(
        path: '/threads/placeholder',
        builder: (context, state) => const ThreadPlaceholderScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'interim',
      debugShowCheckedModeBanner: false,
      theme: InterimTheme.light,
      routerConfig: _router,
    );
  }
}
