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
  /// **'interim'**
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
  /// **'interim helps you record and organize your own notes. It does not diagnose, recommend treatment, or replace a doctor, psychiatrist, psychologist, therapist, or emergency service.'**
  String get noMedicalAdviceBody;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'No real name required.'**
  String get loginTitle;

  /// No description provided for @loginBody.
  ///
  /// In en, this message translates to:
  /// **'Use an email you control so interim can keep your records linked to your account.'**
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
