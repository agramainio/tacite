import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interim_app/features/home/home_screen.dart';
import 'package:interim_app/features/thread/new_thread_screen.dart';
import 'package:interim_app/features/thread/thread_detail_screen.dart';
import 'package:interim_app/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('home screen shows core product boundary without network calls', (
    tester,
  ) async {
    await tester.pumpWidget(
      const InterimAppWrapper(child: HomeScreen(loadSessionOnStart: false)),
    );

    expect(find.text('interim'), findsOneWidget);
    expect(find.text('No medical advice'), findsOneWidget);
    expect(find.text('Not logged in'), findsOneWidget);
    expect(find.text('Start a thread'), findsOneWidget);
  });

  testWidgets('new thread screen shows thread creation form', (tester) async {
    await tester.pumpWidget(const InterimAppWrapper(child: NewThreadScreen()));

    expect(find.text('Treatment change'), findsOneWidget);
    expect(find.text('Short title'), findsOneWidget);
    expect(find.text('What should this help you remember?'), findsOneWidget);
    expect(find.text('Create thread'), findsOneWidget);
  });

  testWidgets(
    'thread detail screen has one-tap timeline capture without network calls',
    (tester) async {
      await tester.pumpWidget(
        const InterimAppWrapper(
          child: ThreadDetailScreen(
            threadId: 'test-thread-id',
            loadExistingRecords: false,
          ),
        ),
      );

      expect(find.text('Record a timeline note'), findsOneWidget);
      expect(find.text('Kind of note'), findsOneWidget);
      expect(find.text('Messy note'), findsOneWidget);
      expect(find.text('Record to timeline'), findsOneWidget);
      expect(find.text('Timeline'), findsOneWidget);
    },
  );
}

class InterimAppWrapper extends StatelessWidget {
  const InterimAppWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: child,
    );
  }
}
