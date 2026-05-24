import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    final title = _titleController.text.trim();

    if (title.isEmpty) {
      setState(() {
        _message = 'Add a short title first.';
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
          _message =
              'Log in from the home screen first, then create the thread.';
        } else {
          _message = 'Could not create the thread: ${error.message}';
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Start a thread'),
        actions: [
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text('Home'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'What do you want to remember clearly later?',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a private thread for one treatment change or one appointment-preparation topic.',
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              initialValue: _kind,
              decoration: const InputDecoration(
                labelText: 'Thread type',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'treatment_episode',
                  child: Text('Treatment change'),
                ),
                DropdownMenuItem(
                  value: 'appointment_preparation',
                  child: Text('Appointment preparation'),
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
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Short title',
                hintText: 'Example: before psychiatrist appointment',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _goalController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'What should this help you remember?',
                hintText: 'Optional. Use fake test data while developing.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _isSaving ? null : _createThread,
              child: Text(_isSaving ? 'Creating…' : 'Create thread'),
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
