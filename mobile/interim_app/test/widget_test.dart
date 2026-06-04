import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interim_app/features/onboarding/purpose_onboarding_screen.dart';
import 'package:interim_app/features/onboarding/starting_point_screen.dart';
import 'package:interim_app/features/summary/summary_screen.dart';
import 'package:interim_app/features/thread/new_thread_screen.dart';
import 'package:interim_app/features/thread/thread_detail_screen.dart';
import 'package:interim_app/features/thread/thread_placeholder_screen.dart';
import 'package:interim_app/features/timeline/timeline_home_screen.dart';
import 'package:interim_app/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('timeline home is the default product surface', (tester) async {
    await tester.pumpWidget(
      const InterimAppWrapper(
        child: TimelineHomeScreen(loadRecordsOnStart: false),
      ),
    );

    expect(find.text('Tacite'), findsWidgets);
    expect(find.text('What changed?'), findsOneWidget);
    expect(find.text('Topics'), findsOneWidget);
    expect(find.text('#sleep'), findsOneWidget);
    expect(find.text('#anxiety'), findsOneWidget);
    expect(find.text('#medication'), findsOneWidget);
    expect(find.text('#side-effect'), findsOneWidget);
    expect(find.text('#question'), findsOneWidget);
    expect(find.text('Summary'), findsOneWidget);
    expect(find.text('Included in summary'), findsOneWidget);
    expect(find.text('Keep out of summary'), findsOneWidget);
    expect(find.text('Record to timeline'), findsOneWidget);
    expect(find.text('No medical advice'), findsNothing);
    expect(find.text('Private account active'), findsNothing);
  });

  testWidgets('timeline home exposes controlled more topics', (tester) async {
    await tester.pumpWidget(
      const InterimAppWrapper(
        child: TimelineHomeScreen(loadRecordsOnStart: false),
      ),
    );

    await tester.tap(find.text('More topics'));
    await tester.pumpAndSettle();

    expect(find.text('Choose topics'), findsOneWidget);
    expect(find.text('#dose-change'), findsOneWidget);
    expect(find.text('#tasks'), findsOneWidget);
    expect(find.text('#hard-to-say'), findsOneWidget);
    expect(find.text('#safety'), findsOneWidget);
  });

  testWidgets('summary screen is read-only before editing', (tester) async {
    await tester.pumpWidget(
      const InterimAppWrapper(child: SummaryScreen(loadRecords: false)),
    );

    expect(find.text('Summary so far'), findsWidgets);
    expect(find.text('Range'), findsOneWidget);
    expect(find.text('Since last appointment'), findsOneWidget);
    expect(find.text('Edit summary'), findsOneWidget);
    expect(find.text('Copy summary'), findsOneWidget);
    expect(find.byType(TextField), findsNothing);

    await tester.tap(find.text('Edit summary'));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Save changes'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });

  testWidgets(
    'thread summary screen can render without loading records in widget tests',
    (tester) async {
      await tester.pumpWidget(
        const InterimAppWrapper(
          child: SummaryScreen(threadId: 'test-thread-id', loadRecords: false),
        ),
      );

      expect(find.text('Summary so far'), findsWidgets);
      expect(find.text('Edit summary'), findsOneWidget);
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

  testWidgets('new thread screen shows thread creation form for legacy flow', (
    tester,
  ) async {
    await tester.pumpWidget(const InterimAppWrapper(child: NewThreadScreen()));

    expect(find.text('Treatment change'), findsOneWidget);
    expect(find.text('Short title'), findsOneWidget);
    expect(find.text('What should this help you remember?'), findsOneWidget);
    expect(find.text('Create thread'), findsOneWidget);
  });

  testWidgets(
    'thread detail screen still renders legacy direct thread capture',
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
