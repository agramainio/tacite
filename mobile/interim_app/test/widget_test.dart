import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interim_app/app/interim_app.dart';
import 'package:interim_app/features/thread/thread_detail_screen.dart';

void main() {
  testWidgets('home screen shows product boundary', (tester) async {
    await tester.pumpWidget(const InterimApp());

    expect(find.text('interim'), findsOneWidget);
    expect(find.text('No medical advice'), findsOneWidget);
    expect(find.text('No real name required.'), findsOneWidget);
    expect(find.text('AI is optional and off by default.'), findsOneWidget);
  });

  testWidgets('new thread screen shows thread creation form', (tester) async {
    await tester.pumpWidget(const InterimApp());

    await tester.tap(find.text('Start a thread'));
    await tester.pumpAndSettle();

    expect(find.text('Treatment change'), findsOneWidget);
    expect(find.text('Short title'), findsOneWidget);
    expect(find.text('What should this help you remember?'), findsOneWidget);
    expect(find.text('Create thread'), findsOneWidget);
  });

  testWidgets('thread detail screen preserves raw-note boundary', (
    tester,
  ) async {
    await tester.pumpWidget(
      const InterimAppWrapper(
        child: ThreadDetailScreen(threadId: 'test-thread-id'),
      ),
    );

    expect(find.text('Add a messy note'), findsOneWidget);
    expect(find.text('Messy note'), findsOneWidget);
    expect(find.text('Save original note'), findsOneWidget);
    expect(
      find.text('Turn note into timeline event — next checkpoint'),
      findsOneWidget,
    );
  });
}

class InterimAppWrapper extends StatelessWidget {
  const InterimAppWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: child);
  }
}
