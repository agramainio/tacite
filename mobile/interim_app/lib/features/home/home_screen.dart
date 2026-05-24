import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final profile = _profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('interim'),
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
              child: const Text('Log in'),
            )
          else
            TextButton(onPressed: _logout, child: const Text('Log out')),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'A private memory for what you may need to explain later.',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Capture messy notes, keep the original wording, and prepare an editable summary for an appointment.',
              style: textTheme.bodyLarge?.copyWith(height: 1.35),
            ),
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
              child: const Text('Start a thread'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => context.go('/threads/placeholder'),
              child: const Text('View sample timeline'),
            ),
            const SizedBox(height: 28),
            const _PrinciplesList(),
          ],
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
    final textTheme = Theme.of(context).textTheme;

    String title;
    String body;

    if (isCheckingSession) {
      title = 'Checking session';
      body = 'Looking for a saved login token.';
    } else if (profile == null) {
      title = 'Not logged in';
      body = 'Log in before creating private records.';
    } else {
      title = 'Logged in';
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
    final textTheme = Theme.of(context).textTheme;

    const items = [
      'No real name required.',
      'AI is optional and off by default.',
      'Original notes are preserved.',
      'Skip is normal. No streaks, no shame.',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product boundaries', style: textTheme.titleMedium),
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
