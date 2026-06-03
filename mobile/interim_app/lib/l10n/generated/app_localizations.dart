import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('it'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Tacite'**
  String get appTitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// No description provided for @languageItalian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get languageItalian;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRussian;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @loggedIn.
  ///
  /// In en, this message translates to:
  /// **'Logged in'**
  String get loggedIn;

  /// No description provided for @notLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Not logged in'**
  String get notLoggedIn;

  /// No description provided for @checkingSession.
  ///
  /// In en, this message translates to:
  /// **'Checking session'**
  String get checkingSession;

  /// No description provided for @checkingSessionBody.
  ///
  /// In en, this message translates to:
  /// **'Looking for a saved login token.'**
  String get checkingSessionBody;

  /// No description provided for @loginBeforePrivateRecords.
  ///
  /// In en, this message translates to:
  /// **'Log in before creating private records.'**
  String get loginBeforePrivateRecords;

  /// No description provided for @homeHero.
  ///
  /// In en, this message translates to:
  /// **'A private memory for what you may need to explain later.'**
  String get homeHero;

  /// No description provided for @homeBody.
  ///
  /// In en, this message translates to:
  /// **'Capture messy notes, keep the original wording, and prepare an editable summary.'**
  String get homeBody;

  /// No description provided for @startThread.
  ///
  /// In en, this message translates to:
  /// **'Start a thread'**
  String get startThread;

  /// No description provided for @viewSampleTimeline.
  ///
  /// In en, this message translates to:
  /// **'View sample timeline'**
  String get viewSampleTimeline;

  /// No description provided for @productBoundaries.
  ///
  /// In en, this message translates to:
  /// **'Product boundaries'**
  String get productBoundaries;

  /// No description provided for @boundaryNoRealName.
  ///
  /// In en, this message translates to:
  /// **'No real name required.'**
  String get boundaryNoRealName;

  /// No description provided for @boundaryAiOptional.
  ///
  /// In en, this message translates to:
  /// **'AI is optional and off by default.'**
  String get boundaryAiOptional;

  /// No description provided for @boundaryOriginalNotes.
  ///
  /// In en, this message translates to:
  /// **'Original notes are preserved.'**
  String get boundaryOriginalNotes;

  /// No description provided for @boundaryNoShame.
  ///
  /// In en, this message translates to:
  /// **'Skip is normal. No streaks, no shame.'**
  String get boundaryNoShame;

  /// No description provided for @noMedicalAdviceTitle.
  ///
  /// In en, this message translates to:
  /// **'No medical advice'**
  String get noMedicalAdviceTitle;

  /// No description provided for @noMedicalAdviceBody.
  ///
  /// In en, this message translates to:
  /// **'Tacite helps you record and organize your own notes. It does not diagnose, recommend treatment, or replace a doctor, psychiatrist, psychologist, therapist, or emergency service.'**
  String get noMedicalAdviceBody;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'No real name required.'**
  String get loginTitle;

  /// No description provided for @loginBody.
  ///
  /// In en, this message translates to:
  /// **'Use an email you control so Tacite can keep your records linked to your account.'**
  String get loginBody;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @requestLoginCode.
  ///
  /// In en, this message translates to:
  /// **'Request login code'**
  String get requestLoginCode;

  /// No description provided for @loginCode.
  ///
  /// In en, this message translates to:
  /// **'Login code'**
  String get loginCode;

  /// No description provided for @verifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify code'**
  String get verifyCode;

  /// No description provided for @loginCodeCreated.
  ///
  /// In en, this message translates to:
  /// **'A login code was created.'**
  String get loginCodeCreated;

  /// No description provided for @localDevCode.
  ///
  /// In en, this message translates to:
  /// **'Local dev code: {code}'**
  String localDevCode(Object code);

  /// No description provided for @couldNotRequestCode.
  ///
  /// In en, this message translates to:
  /// **'Could not request a login code: {message}'**
  String couldNotRequestCode(Object message);

  /// No description provided for @couldNotVerifyCode.
  ///
  /// In en, this message translates to:
  /// **'Could not verify the code: {message}'**
  String couldNotVerifyCode(Object message);

  /// No description provided for @loggedInAs.
  ///
  /// In en, this message translates to:
  /// **'Logged in as {email}'**
  String loggedInAs(Object email);

  /// No description provided for @startThreadTitle.
  ///
  /// In en, this message translates to:
  /// **'What do you want to remember clearly later?'**
  String get startThreadTitle;

  /// No description provided for @startThreadBody.
  ///
  /// In en, this message translates to:
  /// **'Create a private thread for one treatment change or one appointment-preparation topic.'**
  String get startThreadBody;

  /// No description provided for @threadType.
  ///
  /// In en, this message translates to:
  /// **'Thread type'**
  String get threadType;

  /// No description provided for @treatmentChange.
  ///
  /// In en, this message translates to:
  /// **'Treatment change'**
  String get treatmentChange;

  /// No description provided for @appointmentPreparation.
  ///
  /// In en, this message translates to:
  /// **'Appointment preparation'**
  String get appointmentPreparation;

  /// No description provided for @shortTitle.
  ///
  /// In en, this message translates to:
  /// **'Short title'**
  String get shortTitle;

  /// No description provided for @shortTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Example: before psychiatrist appointment'**
  String get shortTitleHint;

  /// No description provided for @threadGoal.
  ///
  /// In en, this message translates to:
  /// **'What should this help you remember?'**
  String get threadGoal;

  /// No description provided for @threadGoalHint.
  ///
  /// In en, this message translates to:
  /// **'Optional. Use fake test data while developing.'**
  String get threadGoalHint;

  /// No description provided for @createThread.
  ///
  /// In en, this message translates to:
  /// **'Create thread'**
  String get createThread;

  /// No description provided for @creating.
  ///
  /// In en, this message translates to:
  /// **'Creating…'**
  String get creating;

  /// No description provided for @addShortTitleFirst.
  ///
  /// In en, this message translates to:
  /// **'Add a short title first.'**
  String get addShortTitleFirst;

  /// No description provided for @loginFromHomeFirst.
  ///
  /// In en, this message translates to:
  /// **'Log in from the home screen first.'**
  String get loginFromHomeFirst;

  /// No description provided for @loginFromHomeBeforeCreating.
  ///
  /// In en, this message translates to:
  /// **'Log in from the home screen first, then create the thread.'**
  String get loginFromHomeBeforeCreating;

  /// No description provided for @couldNotCreateThread.
  ///
  /// In en, this message translates to:
  /// **'Could not create the thread: {message}'**
  String couldNotCreateThread(Object message);

  /// No description provided for @thread.
  ///
  /// In en, this message translates to:
  /// **'Thread'**
  String get thread;

  /// No description provided for @addMessyNote.
  ///
  /// In en, this message translates to:
  /// **'Add a messy note'**
  String get addMessyNote;

  /// No description provided for @rawNoteBoundary.
  ///
  /// In en, this message translates to:
  /// **'Write it as it comes. The original wording is preserved. AI formatting is not used here.'**
  String get rawNoteBoundary;

  /// No description provided for @messyNote.
  ///
  /// In en, this message translates to:
  /// **'Messy note'**
  String get messyNote;

  /// No description provided for @fakeDataHint.
  ///
  /// In en, this message translates to:
  /// **'Use fake test data while developing.'**
  String get fakeDataHint;

  /// No description provided for @saveOriginalNote.
  ///
  /// In en, this message translates to:
  /// **'Save original note'**
  String get saveOriginalNote;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get saving;

  /// No description provided for @writeNoteFirst.
  ///
  /// In en, this message translates to:
  /// **'Write a note first.'**
  String get writeNoteFirst;

  /// No description provided for @savedOriginalNote.
  ///
  /// In en, this message translates to:
  /// **'Saved original note.'**
  String get savedOriginalNote;

  /// No description provided for @savedOriginalNoteNext.
  ///
  /// In en, this message translates to:
  /// **'Saved original note. Now create a user-approved timeline event.'**
  String get savedOriginalNoteNext;

  /// No description provided for @couldNotSaveNote.
  ///
  /// In en, this message translates to:
  /// **'Could not save the note: {message}'**
  String couldNotSaveNote(Object message);

  /// No description provided for @timelineEvents.
  ///
  /// In en, this message translates to:
  /// **'Timeline events'**
  String get timelineEvents;

  /// No description provided for @timeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timeline;

  /// No description provided for @originalNotes.
  ///
  /// In en, this message translates to:
  /// **'Original notes'**
  String get originalNotes;

  /// No description provided for @noTimelineEventsYet.
  ///
  /// In en, this message translates to:
  /// **'No timeline events yet.'**
  String get noTimelineEventsYet;

  /// No description provided for @noOriginalNotesYet.
  ///
  /// In en, this message translates to:
  /// **'No original notes yet.'**
  String get noOriginalNotesYet;

  /// No description provided for @loadingSavedRecords.
  ///
  /// In en, this message translates to:
  /// **'Loading saved records…'**
  String get loadingSavedRecords;

  /// No description provided for @couldNotLoadSavedRecords.
  ///
  /// In en, this message translates to:
  /// **'Could not load saved records: {message}'**
  String couldNotLoadSavedRecords(Object message);

  /// No description provided for @threadNotFound.
  ///
  /// In en, this message translates to:
  /// **'Thread not found.'**
  String get threadNotFound;

  /// No description provided for @threadOrRawNoteNotFound.
  ///
  /// In en, this message translates to:
  /// **'Thread or raw note not found.'**
  String get threadOrRawNoteNotFound;

  /// No description provided for @originalNote.
  ///
  /// In en, this message translates to:
  /// **'Original note'**
  String get originalNote;

  /// No description provided for @savedDate.
  ///
  /// In en, this message translates to:
  /// **'Saved date: {date}'**
  String savedDate(Object date);

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'unknown'**
  String get unknown;

  /// No description provided for @createUserApprovedTimelineEvent.
  ///
  /// In en, this message translates to:
  /// **'Create user-approved timeline event'**
  String get createUserApprovedTimelineEvent;

  /// No description provided for @manualNoAi.
  ///
  /// In en, this message translates to:
  /// **'This is manual. No AI is interpreting the note.'**
  String get manualNoAi;

  /// No description provided for @eventType.
  ///
  /// In en, this message translates to:
  /// **'Event type'**
  String get eventType;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @baselineSnapshot.
  ///
  /// In en, this message translates to:
  /// **'Baseline snapshot'**
  String get baselineSnapshot;

  /// No description provided for @startedTreatmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Started treatment label'**
  String get startedTreatmentLabel;

  /// No description provided for @sideEffectNote.
  ///
  /// In en, this message translates to:
  /// **'Side-effect note'**
  String get sideEffectNote;

  /// No description provided for @appointmentQuestion.
  ///
  /// In en, this message translates to:
  /// **'Appointment question'**
  String get appointmentQuestion;

  /// No description provided for @timelineTitle.
  ///
  /// In en, this message translates to:
  /// **'Timeline title'**
  String get timelineTitle;

  /// No description provided for @userApprovedSummary.
  ///
  /// In en, this message translates to:
  /// **'User-approved summary'**
  String get userApprovedSummary;

  /// No description provided for @saveTimelineEvent.
  ///
  /// In en, this message translates to:
  /// **'Save timeline event'**
  String get saveTimelineEvent;

  /// No description provided for @savingEvent.
  ///
  /// In en, this message translates to:
  /// **'Saving event…'**
  String get savingEvent;

  /// No description provided for @saveOriginalNoteFirst.
  ///
  /// In en, this message translates to:
  /// **'Save an original note first.'**
  String get saveOriginalNoteFirst;

  /// No description provided for @addTitleAndSummaryFirst.
  ///
  /// In en, this message translates to:
  /// **'Add a title and approved summary first.'**
  String get addTitleAndSummaryFirst;

  /// No description provided for @savedUserApprovedTimelineEvent.
  ///
  /// In en, this message translates to:
  /// **'Saved user-approved timeline event.'**
  String get savedUserApprovedTimelineEvent;

  /// No description provided for @couldNotCreateTimelineEvent.
  ///
  /// In en, this message translates to:
  /// **'Could not create the timeline event: {message}'**
  String couldNotCreateTimelineEvent(Object message);

  /// No description provided for @timelineEvent.
  ///
  /// In en, this message translates to:
  /// **'Timeline event'**
  String get timelineEvent;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'Source: {source}'**
  String source(Object source);

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @summarySoFar.
  ///
  /// In en, this message translates to:
  /// **'Summary so far'**
  String get summarySoFar;

  /// No description provided for @summaryToBring.
  ///
  /// In en, this message translates to:
  /// **'Summary to bring to an appointment'**
  String get summaryToBring;

  /// No description provided for @recordTimelineNote.
  ///
  /// In en, this message translates to:
  /// **'Record a timeline note'**
  String get recordTimelineNote;

  /// No description provided for @recordTimelineNoteBody.
  ///
  /// In en, this message translates to:
  /// **'Write it as it comes. One tap records it to the timeline and preserves the original wording.'**
  String get recordTimelineNoteBody;

  /// No description provided for @kindOfNote.
  ///
  /// In en, this message translates to:
  /// **'Kind of note'**
  String get kindOfNote;

  /// No description provided for @recordToTimeline.
  ///
  /// In en, this message translates to:
  /// **'Record to timeline'**
  String get recordToTimeline;

  /// No description provided for @recording.
  ///
  /// In en, this message translates to:
  /// **'Recording…'**
  String get recording;

  /// No description provided for @recordedToTimeline.
  ///
  /// In en, this message translates to:
  /// **'Recorded to timeline. Original note preserved.'**
  String get recordedToTimeline;

  /// No description provided for @couldNotRecordNote.
  ///
  /// In en, this message translates to:
  /// **'Could not record the note: {message}'**
  String couldNotRecordNote(Object message);

  /// No description provided for @startSetup.
  ///
  /// In en, this message translates to:
  /// **'Start setup'**
  String get startSetup;

  /// No description provided for @justRecordSomething.
  ///
  /// In en, this message translates to:
  /// **'Just record something'**
  String get justRecordSomething;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'What are you here to do?'**
  String get onboardingTitle;

  /// No description provided for @onboardingBody.
  ///
  /// In en, this message translates to:
  /// **'Choose the closest starting point. You can change direction later.'**
  String get onboardingBody;

  /// No description provided for @alreadyInCareTitle.
  ///
  /// In en, this message translates to:
  /// **'I’m already in care'**
  String get alreadyInCareTitle;

  /// No description provided for @alreadyInCareBody.
  ///
  /// In en, this message translates to:
  /// **'Track treatment changes, symptoms, side effects, appointments, and questions.'**
  String get alreadyInCareBody;

  /// No description provided for @preparingForCareTitle.
  ///
  /// In en, this message translates to:
  /// **'I’m preparing for care'**
  String get preparingForCareTitle;

  /// No description provided for @preparingForCareBody.
  ///
  /// In en, this message translates to:
  /// **'Put what is happening into words and prepare what to say.'**
  String get preparingForCareBody;

  /// No description provided for @justRecordTitle.
  ///
  /// In en, this message translates to:
  /// **'Just record something'**
  String get justRecordTitle;

  /// No description provided for @justRecordBody.
  ///
  /// In en, this message translates to:
  /// **'Skip setup for now and capture something quickly.'**
  String get justRecordBody;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @setupLaterNote.
  ///
  /// In en, this message translates to:
  /// **'This choice is not stored yet. The next phase adds timeline beginning and starting snapshot.'**
  String get setupLaterNote;

  /// No description provided for @timelineBeginningTitle.
  ///
  /// In en, this message translates to:
  /// **'Where should this timeline begin?'**
  String get timelineBeginningTitle;

  /// No description provided for @timelineBeginningBody.
  ///
  /// In en, this message translates to:
  /// **'Signup date is not always the real beginning. Choose the closest starting point. You can correct this later.'**
  String get timelineBeginningBody;

  /// No description provided for @timelineBeginToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get timelineBeginToday;

  /// No description provided for @timelineBeginWhenStarted.
  ///
  /// In en, this message translates to:
  /// **'When this started'**
  String get timelineBeginWhenStarted;

  /// No description provided for @timelineBeginTreatmentChanged.
  ///
  /// In en, this message translates to:
  /// **'When treatment changed'**
  String get timelineBeginTreatmentChanged;

  /// No description provided for @timelineBeginLastAppointment.
  ///
  /// In en, this message translates to:
  /// **'Last appointment'**
  String get timelineBeginLastAppointment;

  /// No description provided for @timelineBeginNotSure.
  ///
  /// In en, this message translates to:
  /// **'I’m not sure'**
  String get timelineBeginNotSure;

  /// No description provided for @startingSnapshotTitle.
  ///
  /// In en, this message translates to:
  /// **'Save a quick picture of how things feel now?'**
  String get startingSnapshotTitle;

  /// No description provided for @startingSnapshotBody.
  ///
  /// In en, this message translates to:
  /// **'This helps compare later changes. It is not a diagnosis or clinical score.'**
  String get startingSnapshotBody;

  /// No description provided for @quickSnapshot.
  ///
  /// In en, this message translates to:
  /// **'Quick snapshot'**
  String get quickSnapshot;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @snapshotMood.
  ///
  /// In en, this message translates to:
  /// **'Mood'**
  String get snapshotMood;

  /// No description provided for @snapshotAnxiety.
  ///
  /// In en, this message translates to:
  /// **'Anxiety'**
  String get snapshotAnxiety;

  /// No description provided for @snapshotSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get snapshotSleep;

  /// No description provided for @snapshotEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get snapshotEnergy;

  /// No description provided for @snapshotFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get snapshotFocus;

  /// No description provided for @snapshotStartingTasks.
  ///
  /// In en, this message translates to:
  /// **'Starting tasks'**
  String get snapshotStartingTasks;

  /// No description provided for @snapshotLow.
  ///
  /// In en, this message translates to:
  /// **'low'**
  String get snapshotLow;

  /// No description provided for @snapshotMixed.
  ///
  /// In en, this message translates to:
  /// **'mixed'**
  String get snapshotMixed;

  /// No description provided for @snapshotOkay.
  ///
  /// In en, this message translates to:
  /// **'okay'**
  String get snapshotOkay;

  /// No description provided for @snapshotHigh.
  ///
  /// In en, this message translates to:
  /// **'high'**
  String get snapshotHigh;

  /// No description provided for @snapshotHard.
  ///
  /// In en, this message translates to:
  /// **'hard'**
  String get snapshotHard;

  /// No description provided for @snapshotPossible.
  ///
  /// In en, this message translates to:
  /// **'possible'**
  String get snapshotPossible;

  /// No description provided for @continueToFirstThread.
  ///
  /// In en, this message translates to:
  /// **'Continue to first thread'**
  String get continueToFirstThread;

  /// No description provided for @captureSomething.
  ///
  /// In en, this message translates to:
  /// **'Record something'**
  String get captureSomething;

  /// No description provided for @captureSomethingBody.
  ///
  /// In en, this message translates to:
  /// **'Choose a quick card or write freely. AI is not needed for this.'**
  String get captureSomethingBody;

  /// No description provided for @captureTreatment.
  ///
  /// In en, this message translates to:
  /// **'Treatment'**
  String get captureTreatment;

  /// No description provided for @captureExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get captureExperience;

  /// No description provided for @captureAppointment.
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get captureAppointment;

  /// No description provided for @captureOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get captureOther;

  /// No description provided for @captureStartTreatment.
  ///
  /// In en, this message translates to:
  /// **'Start treatment label'**
  String get captureStartTreatment;

  /// No description provided for @captureChangeDose.
  ///
  /// In en, this message translates to:
  /// **'Change dose'**
  String get captureChangeDose;

  /// No description provided for @captureStopTreatment.
  ///
  /// In en, this message translates to:
  /// **'Stop treatment label'**
  String get captureStopTreatment;

  /// No description provided for @captureMissedLateDose.
  ///
  /// In en, this message translates to:
  /// **'Missed/late dose'**
  String get captureMissedLateDose;

  /// No description provided for @captureMoodAnxiety.
  ///
  /// In en, this message translates to:
  /// **'Mood/anxiety'**
  String get captureMoodAnxiety;

  /// No description provided for @captureSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get captureSleep;

  /// No description provided for @captureFocusTasks.
  ///
  /// In en, this message translates to:
  /// **'Focus/tasks'**
  String get captureFocusTasks;

  /// No description provided for @captureSideEffect.
  ///
  /// In en, this message translates to:
  /// **'Side effect'**
  String get captureSideEffect;

  /// No description provided for @captureFunctioning.
  ///
  /// In en, this message translates to:
  /// **'Functioning'**
  String get captureFunctioning;

  /// No description provided for @captureQuestion.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get captureQuestion;

  /// No description provided for @captureThingToMention.
  ///
  /// In en, this message translates to:
  /// **'Thing to mention'**
  String get captureThingToMention;

  /// No description provided for @captureSummaryNote.
  ///
  /// In en, this message translates to:
  /// **'Summary note'**
  String get captureSummaryNote;

  /// No description provided for @captureFreeNote.
  ///
  /// In en, this message translates to:
  /// **'Free note'**
  String get captureFreeNote;

  /// No description provided for @selectedCaptureKind.
  ///
  /// In en, this message translates to:
  /// **'Selected: {kind}'**
  String selectedCaptureKind(Object kind);

  /// No description provided for @addToSummary.
  ///
  /// In en, this message translates to:
  /// **'Add to summary'**
  String get addToSummary;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get moreOptions;

  /// No description provided for @showOriginalNote.
  ///
  /// In en, this message translates to:
  /// **'Show original note'**
  String get showOriginalNote;

  /// No description provided for @swipeAddToSummary.
  ///
  /// In en, this message translates to:
  /// **'Add to summary'**
  String get swipeAddToSummary;

  /// No description provided for @swipeMoreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get swipeMoreOptions;

  /// No description provided for @timelineActionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'{action} will be wired in the next product pass.'**
  String timelineActionPlaceholder(Object action);

  /// No description provided for @summaryScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Summary so far'**
  String get summaryScreenTitle;

  /// No description provided for @summaryScreenBody.
  ///
  /// In en, this message translates to:
  /// **'Create an editable summary from a selected range. This is a draft you can change before bringing it to care.'**
  String get summaryScreenBody;

  /// No description provided for @summaryRange.
  ///
  /// In en, this message translates to:
  /// **'Range'**
  String get summaryRange;

  /// No description provided for @summaryRangeSinceLastAppointment.
  ///
  /// In en, this message translates to:
  /// **'Since last appointment'**
  String get summaryRangeSinceLastAppointment;

  /// No description provided for @summaryRangeSinceTreatmentChange.
  ///
  /// In en, this message translates to:
  /// **'Since treatment change'**
  String get summaryRangeSinceTreatmentChange;

  /// No description provided for @summaryRangeSinceDoseChange.
  ///
  /// In en, this message translates to:
  /// **'Since dose change'**
  String get summaryRangeSinceDoseChange;

  /// No description provided for @summaryRangeLastTwoWeeks.
  ///
  /// In en, this message translates to:
  /// **'Last 2 weeks'**
  String get summaryRangeLastTwoWeeks;

  /// No description provided for @summaryRangeLastMonth.
  ///
  /// In en, this message translates to:
  /// **'Last month'**
  String get summaryRangeLastMonth;

  /// No description provided for @summaryRangeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom range'**
  String get summaryRangeCustom;

  /// No description provided for @summaryDraftLabel.
  ///
  /// In en, this message translates to:
  /// **'Editable summary'**
  String get summaryDraftLabel;

  /// No description provided for @summaryTemplate.
  ///
  /// In en, this message translates to:
  /// **'Summary so far\\n\\nRange: selected range\\n\\nWhat I want help with:\\n- \\n\\nWhat changed:\\n- \\n\\nWhat I noticed after:\\n- \\n\\nSide effects or body changes:\\n- \\n\\nFunctioning:\\n- \\n\\nContext that may matter:\\n- \\n\\nQuestions to bring up:\\n- '**
  String get summaryTemplate;

  /// No description provided for @copySummary.
  ///
  /// In en, this message translates to:
  /// **'Copy summary'**
  String get copySummary;

  /// No description provided for @summaryCopied.
  ///
  /// In en, this message translates to:
  /// **'Summary copied.'**
  String get summaryCopied;

  /// No description provided for @summaryNotMedicalAdvice.
  ///
  /// In en, this message translates to:
  /// **'This summary is based on what you recorded. It is not medical advice or a diagnosis.'**
  String get summaryNotMedicalAdvice;

  /// No description provided for @recordSomething.
  ///
  /// In en, this message translates to:
  /// **'Record something'**
  String get recordSomething;

  /// No description provided for @privateAccountActive.
  ///
  /// In en, this message translates to:
  /// **'Private account active'**
  String get privateAccountActive;

  /// No description provided for @privateAccountActiveBody.
  ///
  /// In en, this message translates to:
  /// **'Your records are linked to this private account.'**
  String get privateAccountActiveBody;

  /// No description provided for @privateAccountInactive.
  ///
  /// In en, this message translates to:
  /// **'Private account not active'**
  String get privateAccountInactive;

  /// No description provided for @privateAccountInactiveBody.
  ///
  /// In en, this message translates to:
  /// **'Log in before saving private records across sessions.'**
  String get privateAccountInactiveBody;

  /// No description provided for @setupCompleteHomeBody.
  ///
  /// In en, this message translates to:
  /// **'Record something quickly, review the timeline, or prepare a summary.'**
  String get setupCompleteHomeBody;

  /// No description provided for @setupIncompleteHomeBody.
  ///
  /// In en, this message translates to:
  /// **'Set up the timeline once, or skip and record something now.'**
  String get setupIncompleteHomeBody;

  /// No description provided for @timelinePreview.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timelinePreview;

  /// No description provided for @captureType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get captureType;

  /// No description provided for @changeType.
  ///
  /// In en, this message translates to:
  /// **'Change type'**
  String get changeType;

  /// No description provided for @chooseCaptureType.
  ///
  /// In en, this message translates to:
  /// **'Choose type'**
  String get chooseCaptureType;

  /// No description provided for @selectedTypeHelper.
  ///
  /// In en, this message translates to:
  /// **'This only helps organize the timeline. You can change it later.'**
  String get selectedTypeHelper;

  /// No description provided for @summaryLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading saved timeline…'**
  String get summaryLoading;

  /// No description provided for @summaryLoadedFromTimeline.
  ///
  /// In en, this message translates to:
  /// **'Summary draft updated from saved timeline records.'**
  String get summaryLoadedFromTimeline;

  /// No description provided for @summaryCouldNotLoadTimeline.
  ///
  /// In en, this message translates to:
  /// **'Could not load saved timeline records: {message}'**
  String summaryCouldNotLoadTimeline(Object message);

  /// No description provided for @summaryNoSavedTimeline.
  ///
  /// In en, this message translates to:
  /// **'No saved timeline entries yet. Record something first, then come back to Summary so far.'**
  String get summaryNoSavedTimeline;

  /// No description provided for @summaryGeneratedFromSavedData.
  ///
  /// In en, this message translates to:
  /// **'This draft uses saved timeline events and original notes from this thread.'**
  String get summaryGeneratedFromSavedData;

  /// No description provided for @timelineEntriesSection.
  ///
  /// In en, this message translates to:
  /// **'Timeline entries'**
  String get timelineEntriesSection;

  /// No description provided for @originalNotesSection.
  ///
  /// In en, this message translates to:
  /// **'Original notes'**
  String get originalNotesSection;

  /// No description provided for @noDate.
  ///
  /// In en, this message translates to:
  /// **'no date'**
  String get noDate;

  /// No description provided for @timelineHomeBody.
  ///
  /// In en, this message translates to:
  /// **'A private timeline of what changed, what you noticed, and what to mention later.'**
  String get timelineHomeBody;

  /// No description provided for @whatChangedPrompt.
  ///
  /// In en, this message translates to:
  /// **'What changed?'**
  String get whatChangedPrompt;

  /// No description provided for @whatChangedHint.
  ///
  /// In en, this message translates to:
  /// **'Write messily. You can organize it with tags.'**
  String get whatChangedHint;

  /// No description provided for @timelineHomeEmpty.
  ///
  /// In en, this message translates to:
  /// **'No timeline entries yet. Record something above.'**
  String get timelineHomeEmpty;

  /// No description provided for @timelineHomeLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading timeline…'**
  String get timelineHomeLoading;

  /// No description provided for @timelineHomeCouldNotLoad.
  ///
  /// In en, this message translates to:
  /// **'Could not load timeline: {message}'**
  String timelineHomeCouldNotLoad(Object message);

  /// No description provided for @timelineHomeCouldNotRecord.
  ///
  /// In en, this message translates to:
  /// **'Could not record entry: {message}'**
  String timelineHomeCouldNotRecord(Object message);

  /// No description provided for @hiddenTimelineText.
  ///
  /// In en, this message translates to:
  /// **'Private text hidden. Tap to reveal.'**
  String get hiddenTimelineText;

  /// No description provided for @hideTimelineText.
  ///
  /// In en, this message translates to:
  /// **'Hide note text by default'**
  String get hideTimelineText;

  /// No description provided for @showTimelineText.
  ///
  /// In en, this message translates to:
  /// **'Show note text'**
  String get showTimelineText;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @flags.
  ///
  /// In en, this message translates to:
  /// **'Flags'**
  String get flags;

  /// No description provided for @moreTags.
  ///
  /// In en, this message translates to:
  /// **'More tags'**
  String get moreTags;

  /// No description provided for @chooseTags.
  ///
  /// In en, this message translates to:
  /// **'Choose tags'**
  String get chooseTags;

  /// No description provided for @tagMedication.
  ///
  /// In en, this message translates to:
  /// **'#medication'**
  String get tagMedication;

  /// No description provided for @tagDoseChange.
  ///
  /// In en, this message translates to:
  /// **'#dose-change'**
  String get tagDoseChange;

  /// No description provided for @tagMissedDose.
  ///
  /// In en, this message translates to:
  /// **'#missed-dose'**
  String get tagMissedDose;

  /// No description provided for @tagAnxiety.
  ///
  /// In en, this message translates to:
  /// **'#anxiety'**
  String get tagAnxiety;

  /// No description provided for @tagSleep.
  ///
  /// In en, this message translates to:
  /// **'#sleep'**
  String get tagSleep;

  /// No description provided for @tagMood.
  ///
  /// In en, this message translates to:
  /// **'#mood'**
  String get tagMood;

  /// No description provided for @tagSideEffect.
  ///
  /// In en, this message translates to:
  /// **'#side-effect'**
  String get tagSideEffect;

  /// No description provided for @tagFocus.
  ///
  /// In en, this message translates to:
  /// **'#focus'**
  String get tagFocus;

  /// No description provided for @tagTasks.
  ///
  /// In en, this message translates to:
  /// **'#tasks'**
  String get tagTasks;

  /// No description provided for @tagWork.
  ///
  /// In en, this message translates to:
  /// **'#work'**
  String get tagWork;

  /// No description provided for @tagSelfCare.
  ///
  /// In en, this message translates to:
  /// **'#self-care'**
  String get tagSelfCare;

  /// No description provided for @tagQuestion.
  ///
  /// In en, this message translates to:
  /// **'#question'**
  String get tagQuestion;

  /// No description provided for @tagAppointment.
  ///
  /// In en, this message translates to:
  /// **'#appointment'**
  String get tagAppointment;

  /// No description provided for @tagHardToSay.
  ///
  /// In en, this message translates to:
  /// **'#hard-to-say'**
  String get tagHardToSay;

  /// No description provided for @tagSafety.
  ///
  /// In en, this message translates to:
  /// **'#safety'**
  String get tagSafety;

  /// No description provided for @flagMentionThis.
  ///
  /// In en, this message translates to:
  /// **'Mention this'**
  String get flagMentionThis;

  /// No description provided for @flagHardToSay.
  ///
  /// In en, this message translates to:
  /// **'Hard to say'**
  String get flagHardToSay;

  /// No description provided for @flagAddToSummary.
  ///
  /// In en, this message translates to:
  /// **'Add to summary'**
  String get flagAddToSummary;

  /// No description provided for @personalTimelineTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal timeline'**
  String get personalTimelineTitle;

  /// No description provided for @personalTimelineGoal.
  ///
  /// In en, this message translates to:
  /// **'Default private timeline'**
  String get personalTimelineGoal;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr', 'it', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
