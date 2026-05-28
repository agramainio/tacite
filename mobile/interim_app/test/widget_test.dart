import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interim_app/features/home/home_screen.dart';
import 'package:interim_app/features/onboarding/purpose_onboarding_screen.dart';
import 'package:interim_app/features/onboarding/starting_point_screen.dart';
import 'package:interim_app/features/summary/summary_screen.dart';
import 'package:interim_app/features/thread/new_thread_screen.dart';
import 'package:interim_app/features/thread/thread_detail_screen.dart';
import 'package:interim_app/features/thread/thread_placeholder_screen.dart';
import 'package:interim_app/l10n/generated/app_localizations.dart';

void main() {
  testWidgets(
    'home screen shows setup, quick record, and summary actions without network calls',
    (tester) async {
      await tester.pumpWidget(
        const InterimAppWrapper(child: HomeScreen(loadSessionOnStart: false)),
      );

      expect(find.text('Tacite'), findsOneWidget);
      expect(find.text('No medical advice'), findsOneWidget);
      expect(find.text('Not logged in'), findsOneWidget);
      expect(find.text('Start setup'), findsOneWidget);
      expect(find.text('Just record something'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Summary so far'),
        400,
        scrollable: find.byType(Scrollable),
      );

      expect(find.text('Summary so far'), findsOneWidget);
    },
  );

  testWidgets('summary screen shows range selector and editable summary', (
    tester,
  ) async {
    await tester.pumpWidget(const InterimAppWrapper(child: SummaryScreen()));

    expect(find.text('Summary so far'), findsWidgets);
    expect(find.text('Range'), findsOneWidget);
    expect(find.text('Since last appointment'), findsOneWidget);
    expect(find.text('Editable summary'), findsOneWidget);
    expect(find.text('Copy summary'), findsOneWidget);
    expect(find.textContaining('What I want help with'), findsOneWidget);
  });

  testWidgets('purpose onboarding shows three starting choices', (
    tester,
  ) async {
    await tester.pumpWidget(
      const InterimAppWrapper(child: PurposeOnboardingScreen()),
    );

    expect(find.text('What are you here to do?'), findsOneWidget);
    expect(find.text('I’m already in care'), findsOneWidget);
    expect(find.text('I’m preparing for care'), findsOneWidget);
    expect(find.text('Just record something'), findsOneWidget);
  });

  testWidgets(
    'starting point screen shows timeline beginning and skippable snapshot',
    (tester) async {
      await tester.pumpWidget(
        const InterimAppWrapper(child: StartingPointScreen()),
      );

      expect(find.text('Where should this timeline begin?'), findsOneWidget);
      expect(find.text('Today'), findsOneWidget);
      expect(find.text('When this started'), findsOneWidget);
      expect(find.text('Last appointment'), findsOneWidget);
      expect(
        find.text('Save a quick picture of how things feel now?'),
        findsOneWidget,
      );
      expect(find.text('Quick snapshot'), findsOneWidget);
      expect(find.text('Skip for now'), findsOneWidget);
    },
  );

  testWidgets('new thread screen shows thread creation form', (tester) async {
    await tester.pumpWidget(const InterimAppWrapper(child: NewThreadScreen()));

    expect(find.text('Treatment change'), findsOneWidget);
    expect(find.text('Short title'), findsOneWidget);
    expect(find.text('What should this help you remember?'), findsOneWidget);
    expect(find.text('Create thread'), findsOneWidget);
  });

  testWidgets(
    'thread detail screen has AI-off structured capture cards without network calls',
    (tester) async {
      await tester.pumpWidget(
        const InterimAppWrapper(
          child: ThreadDetailScreen(
            threadId: 'test-thread-id',
            loadExistingRecords: false,
          ),
        ),
      );

      expect(find.text('Record something'), findsOneWidget);
      expect(find.text('Treatment'), findsOneWidget);
      expect(find.text('Experience'), findsOneWidget);
      expect(find.text('Appointment'), findsOneWidget);
      expect(find.text('Start treatment label'), findsOneWidget);
      expect(find.text('Mood/anxiety'), findsOneWidget);
      expect(find.text('Question'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Record to timeline'),
        500,
        scrollable: find.byType(Scrollable),
      );

      expect(find.text('Messy note'), findsOneWidget);
      expect(find.text('Record to timeline'), findsOneWidget);
    },
  );

  testWidgets('timeline preview cards expose visible fallback options', (
    tester,
  ) async {
    await tester.pumpWidget(
      const InterimAppWrapper(child: ThreadPlaceholderScreen()),
    );

    expect(find.text('Timeline preview'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.more_horiz).first);
    await tester.pumpAndSettle();

    expect(find.text('Add to summary'), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Show original note'), findsOneWidget);
  });
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
