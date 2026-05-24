import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data/thread_models.dart';
import 'data/thread_repository.dart';

class ThreadDetailScreen extends StatefulWidget {
  const ThreadDetailScreen({required this.threadId, super.key});

  final String threadId;

  @override
  State<ThreadDetailScreen> createState() => _ThreadDetailScreenState();
}

class _ThreadDetailScreenState extends State<ThreadDetailScreen> {
  final _repository = ThreadRepository.defaultRepository();
  final _noteController = TextEditingController();

  bool _isSaving = false;
  String? _message;
  RawNote? _savedNote;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _saveRawNote() async {
    final text = _noteController.text.trim();

    if (text.isEmpty) {
      setState(() {
        _message = 'Write a note first.';
      });
      return;
    }

    setState(() {
      _isSaving = true;
      _message = null;
    });

    try {
      final note = await _repository.createRawNote(
        threadId: widget.threadId,
        originalText: text,
      );

      setState(() {
        _savedNote = note;
        _noteController.clear();
        _message = 'Saved original note.';
      });
    } on DioException catch (error) {
      setState(() {
        if (error.response?.statusCode == 401) {
          _message = 'Log in first, then save the note.';
        } else if (error.response?.statusCode == 404) {
          _message = 'Thread not found.';
        } else {
          _message = 'Could not save the note: ${error.message}';
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
        title: const Text('Thread'),
        actions: [
          TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('Log in'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Add a messy note',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Write it as it comes. The original wording is preserved. AI formatting is not used here.',
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _noteController,
              minLines: 5,
              maxLines: 10,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                labelText: 'Messy note',
                hintText: 'Use fake test data while developing.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _isSaving ? null : _saveRawNote,
              child: Text(_isSaving ? 'Saving…' : 'Save original note'),
            ),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(_message!),
            ],
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableText('Thread ID:\n${widget.threadId}'),
              ),
            ),
            if (_savedNote != null) ...[
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Saved original note', style: textTheme.titleMedium),
                      const SizedBox(height: 8),
                      SelectableText(_savedNote!.originalText),
                      const SizedBox(height: 12),
                      Text(
                        'Saved date: ${_savedNote!.userLocalDate ?? 'unknown'}',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            FilledButton(
              onPressed: null,
              child: Text('Turn note into timeline event — next checkpoint'),
            ),
          ],
        ),
      ),
    );
  }
}
