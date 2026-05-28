import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../shared/theme/tacite_spacing.dart';
import '../../shared/theme/tacite_text_styles.dart';
import '../../shared/widgets/tacite_message.dart';
import '../../shared/widgets/tacite_panel.dart';
import '../../shared/widgets/tacite_primary_button.dart';
import '../../shared/widgets/tacite_scaffold.dart';
import '../../shared/widgets/tacite_secondary_button.dart';
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
    final l10n = AppLocalizations.of(context);

    setState(() {
      _isLoading = true;
      _message = null;
      _devCode = null;
    });

    try {
      final code = await _authRepository.requestLoginCode(
        _emailController.text.trim(),
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _devCode = code;
        _message = code == null
            ? l10n.loginCodeCreated
            : l10n.localDevCode(code);
      });
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _message = l10n.couldNotRequestCode(error.message ?? l10n.unknown);
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _verifyCode() async {
    final l10n = AppLocalizations.of(context);

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
        SnackBar(content: Text(l10n.loggedInAs(profile.emailIdentifier))),
      );

      context.go('/');
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _message = l10n.couldNotVerifyCode(error.message ?? l10n.unknown);
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TaciteScaffold(
      title: l10n.login,
      actions: [
        TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
      ],
      children: [
        Text(l10n.loginTitle, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.loginBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        TacitePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.email, style: TaciteTextStyles.label),
              const SizedBox(height: TaciteSpacing.sm),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(hintText: l10n.email),
              ),
              const SizedBox(height: TaciteSpacing.md),
              TaciteSecondaryButton(
                onPressed: _isLoading ? null : _requestCode,
                label: l10n.requestLoginCode,
              ),
              const SizedBox(height: TaciteSpacing.xl),
              Text(l10n.loginCode, style: TaciteTextStyles.label),
              const SizedBox(height: TaciteSpacing.sm),
              TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: l10n.loginCode,
                  helperText: _devCode == null
                      ? null
                      : l10n.localDevCode(_devCode!),
                ),
              ),
              const SizedBox(height: TaciteSpacing.md),
              TacitePrimaryButton(
                onPressed: _isLoading ? null : _verifyCode,
                isBusy: _isLoading,
                label: l10n.verifyCode,
              ),
            ],
          ),
        ),
        if (_message != null) ...[
          const SizedBox(height: TaciteSpacing.md),
          TaciteMessage(message: _message!),
        ],
      ],
    );
  }
}
