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
import '../../shared/widgets/tacite_text_area.dart';
import 'data/thread_repository.dart';

class NewThreadScreen extends StatefulWidget {
  const NewThreadScreen({super.key});

  @override
  State<NewThreadScreen> createState() => _NewThreadScreenState();
}

class _NewThreadScreenState extends State<NewThreadScreen> {
  final _repository = ThreadRepository.defaultRepository();
  final _titleController = TextEditingController();
  final _goalController = TextEditingController();

  String _kind = 'treatment_episode';
  bool _isSaving = false;
  String? _message;

  @override
  void dispose() {
    _titleController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  Future<void> _createThread() async {
    final l10n = AppLocalizations.of(context);
    final title = _titleController.text.trim();

    if (title.isEmpty) {
      setState(() {
        _message = l10n.addShortTitleFirst;
      });
      return;
    }

    setState(() {
      _isSaving = true;
      _message = null;
    });

    try {
      final thread = await _repository.createThread(
        kind: _kind,
        title: title,
        userGoal: _goalController.text.trim(),
      );

      if (!mounted) {
        return;
      }

      context.go('/threads/${thread.id}');
    } on DioException catch (error) {
      setState(() {
        if (error.response?.statusCode == 401) {
          _message = l10n.loginFromHomeBeforeCreating;
        } else {
          _message = l10n.couldNotCreateThread(error.message ?? l10n.unknown);
        }
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TaciteScaffold(
      title: l10n.startThread,
      actions: [
        TextButton(onPressed: () => context.go('/'), child: Text(l10n.home)),
      ],
      children: [
        Text(l10n.startThreadTitle, style: TaciteTextStyles.screenTitle),
        const SizedBox(height: TaciteSpacing.sm),
        Text(l10n.startThreadBody, style: TaciteTextStyles.bodyMuted),
        const SizedBox(height: TaciteSpacing.xl),
        TacitePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                initialValue: _kind,
                decoration: InputDecoration(labelText: l10n.threadType),
                items: [
                  DropdownMenuItem(
                    value: 'treatment_episode',
                    child: Text(l10n.treatmentChange),
                  ),
                  DropdownMenuItem(
                    value: 'appointment_preparation',
                    child: Text(l10n.appointmentPreparation),
                  ),
                ],
                onChanged: _isSaving
                    ? null
                    : (value) {
                        if (value == null) {
                          return;
                        }

                        setState(() {
                          _kind = value;
                        });
                      },
              ),
              const SizedBox(height: TaciteSpacing.md),
              TextField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: l10n.shortTitle,
                  hintText: l10n.shortTitleHint,
                ),
              ),
              const SizedBox(height: TaciteSpacing.md),
              TaciteTextArea(
                controller: _goalController,
                label: l10n.threadGoal,
                hint: l10n.threadGoalHint,
                minLines: 3,
                maxLines: 5,
              ),
              const SizedBox(height: TaciteSpacing.lg),
              TacitePrimaryButton(
                onPressed: _isSaving ? null : _createThread,
                isBusy: _isSaving,
                label: _isSaving ? l10n.creating : l10n.createThread,
              ),
            ],
          ),
        ),
        if (_message != null) ...[
          const SizedBox(height: TaciteSpacing.md),
          TaciteMessage(message: _message!, isWarning: true),
        ],
      ],
    );
  }
}
