import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authRepository = AuthRepository.defaultRepository();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();

  bool _isLoading = false;
  String? _devCode;
  String? _message;

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _requestCode() async {
    setState(() {
      _isLoading = true;
      _message = null;
      _devCode = null;
    });

    try {
      final code = await _authRepository.requestLoginCode(
        _emailController.text.trim(),
      );

      setState(() {
        _devCode = code;
        _message = code == null
            ? 'A login code was created.'
            : 'Local dev code: $code';
      });
    } on DioException catch (error) {
      setState(() {
        _message = 'Could not request a login code: ${error.message}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _verifyCode() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      final profile = await _authRepository.verifyLoginCode(
        email: _emailController.text.trim(),
        code: _codeController.text.trim(),
      );

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged in as ${profile.emailIdentifier}')),
      );

      context.go('/');
    } on DioException catch (error) {
      setState(() {
        _message = 'Could not verify the code: ${error.message}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'No real name required.',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Use an email you control so interim can keep your records linked to your account.',
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _isLoading ? null : _requestCode,
              child: const Text('Request login code'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Login code',
                helperText: _devCode == null
                    ? null
                    : 'Local dev code: $_devCode',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _isLoading ? null : _verifyCode,
              child: const Text('Verify code'),
            ),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(_message!),
            ],
          ],
        ),
      ),
    );
  }
}
