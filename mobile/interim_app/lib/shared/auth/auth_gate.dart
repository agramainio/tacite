import 'package:flutter/material.dart';

import '../../features/auth/login_screen.dart';
import '../../features/timeline/timeline_home_screen.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import 'session_store.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final _sessionStore = const SessionStore();

  late final Future<bool> _hasSession = _sessionStore
      .readAccessToken()
      .then((token) => token != null && token.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _hasSession,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const TaciteScaffold(
            title: 'Tacite',
            children: [
              SizedBox(height: TaciteSpacing.xl),
              Text(
                'Checking session…',
                style: TaciteTextStyles.bodyMuted,
              ),
            ],
          );
        }

        if (snapshot.data == true) {
          return const TimelineHomeScreen();
        }

        return const LoginScreen();
      },
    );
  }
}
