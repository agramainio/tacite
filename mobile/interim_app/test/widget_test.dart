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
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('home screen before setup shows setup and quick record actions', (
    tester,
  ) async {
    await tester.pumpWidget(
      const InterimAppWrapper(child: HomeScreen(loadSessionOnStart: false)),
    );

    await tester.pumpAndSettle();

    expect(find.text('Tacite'), findsOneWidget);
    expect(find.text('No medical advice'), findsNothing);
    expect(find.text('Private account not active'), findsOneWidget);
    expect(find.text('Start setup'), findsOneWidget);
    expect(find.text('Just record something'), findsOneWidget);
  });

  testWidgets('home screen after setup prioritizes daily actions', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({'tacite_setup_complete': true});

    await tester.pumpWidget(
      const InterimAppWrapper(child: HomeScreen(loadSessionOnStart: false)),
    );

    await tester.pumpAndSettle();

    expect(find.text('Record something'), findsOneWidget);
    expect(find.text('Timeline'), findsOneWidget);
    expect(find.text('Summary so far'), findsOneWidget);
    expect(find.text('Start setup'), findsNothing);
  });

  testWidgets(
    'summary screen shows range selector and editable summary without network calls',
    (tester) async {
      await tester.pumpWidget(
        const InterimAppWrapper(child: SummaryScreen(loadRecords: false)),
      );

      expect(find.text('Summary so far'), findsWidgets);
      expect(find.text('Range'), findsOneWidget);
      expect(find.text('Since last appointment'), findsOneWidget);
      expect(find.text('Editable summary'), findsOneWidget);
      expect(find.text('Copy summary'), findsOneWidget);
      expect(find.textContaining('What I want help with'), findsOneWidget);
    },
  );

  testWidgets(
    'thread summary screen can render without loading records in widget tests',
    (tester) async {
      await tester.pumpWidget(
        const InterimAppWrapper(
          child: SummaryScreen(threadId: 'test-thread-id', loadRecords: false),
        ),
      );

      expect(find.text('Summary so far'), findsWidgets);
      expect(find.text('Editable summary'), findsOneWidget);
      expect(find.text('Copy summary'), findsOneWidget);
    },
  );

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
    'thread detail screen lets the user write before choosing a type',
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
      expect(find.text('Messy note'), findsOneWidget);
      expect(find.text('Type: Free note'), findsOneWidget);
      expect(find.text('Change type'), findsOneWidget);
      expect(find.text('Record to timeline'), findsOneWidget);
      expect(find.text('Treatment'), findsNothing);

      await tester.tap(find.text('Change type'));
      await tester.pumpAndSettle();

      expect(find.text('Choose type'), findsOneWidget);
      expect(find.text('Treatment'), findsOneWidget);
      expect(find.text('Experience'), findsOneWidget);
      expect(find.text('Appointment'), findsOneWidget);
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
