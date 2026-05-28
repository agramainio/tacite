// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tacite';

  @override
  String get language => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'French';

  @override
  String get languageItalian => 'Italian';

  @override
  String get languageRussian => 'Russian';

  @override
  String get login => 'Log in';

  @override
  String get logout => 'Log out';

  @override
  String get home => 'Home';

  @override
  String get refresh => 'Refresh';

  @override
  String get loggedIn => 'Logged in';

  @override
  String get notLoggedIn => 'Not logged in';

  @override
  String get checkingSession => 'Checking session';

  @override
  String get checkingSessionBody => 'Looking for a saved login token.';

  @override
  String get loginBeforePrivateRecords =>
      'Log in before creating private records.';

  @override
  String get homeHero =>
      'A private memory for what you may need to explain later.';

  @override
  String get homeBody =>
      'Capture messy notes, keep the original wording, and prepare an editable summary.';

  @override
  String get startThread => 'Start a thread';

  @override
  String get viewSampleTimeline => 'View sample timeline';

  @override
  String get productBoundaries => 'Product boundaries';

  @override
  String get boundaryNoRealName => 'No real name required.';

  @override
  String get boundaryAiOptional => 'AI is optional and off by default.';

  @override
  String get boundaryOriginalNotes => 'Original notes are preserved.';

  @override
  String get boundaryNoShame => 'Skip is normal. No streaks, no shame.';

  @override
  String get noMedicalAdviceTitle => 'No medical advice';

  @override
  String get noMedicalAdviceBody =>
      'Tacite helps you record and organize your own notes. It does not diagnose, recommend treatment, or replace a doctor, psychiatrist, psychologist, therapist, or emergency service.';

  @override
  String get loginTitle => 'No real name required.';

  @override
  String get loginBody =>
      'Use an email you control so Tacite can keep your records linked to your account.';

  @override
  String get email => 'Email';

  @override
  String get requestLoginCode => 'Request login code';

  @override
  String get loginCode => 'Login code';

  @override
  String get verifyCode => 'Verify code';

  @override
  String get loginCodeCreated => 'A login code was created.';

  @override
  String localDevCode(Object code) {
    return 'Local dev code: $code';
  }

  @override
  String couldNotRequestCode(Object message) {
    return 'Could not request a login code: $message';
  }

  @override
  String couldNotVerifyCode(Object message) {
    return 'Could not verify the code: $message';
  }

  @override
  String loggedInAs(Object email) {
    return 'Logged in as $email';
  }

  @override
  String get startThreadTitle => 'What do you want to remember clearly later?';

  @override
  String get startThreadBody =>
      'Create a private thread for one treatment change or one appointment-preparation topic.';

  @override
  String get threadType => 'Thread type';

  @override
  String get treatmentChange => 'Treatment change';

  @override
  String get appointmentPreparation => 'Appointment preparation';

  @override
  String get shortTitle => 'Short title';

  @override
  String get shortTitleHint => 'Example: before psychiatrist appointment';

  @override
  String get threadGoal => 'What should this help you remember?';

  @override
  String get threadGoalHint => 'Optional. Use fake test data while developing.';

  @override
  String get createThread => 'Create thread';

  @override
  String get creating => 'Creating…';

  @override
  String get addShortTitleFirst => 'Add a short title first.';

  @override
  String get loginFromHomeFirst => 'Log in from the home screen first.';

  @override
  String get loginFromHomeBeforeCreating =>
      'Log in from the home screen first, then create the thread.';

  @override
  String couldNotCreateThread(Object message) {
    return 'Could not create the thread: $message';
  }

  @override
  String get thread => 'Thread';

  @override
  String get addMessyNote => 'Add a messy note';

  @override
  String get rawNoteBoundary =>
      'Write it as it comes. The original wording is preserved. AI formatting is not used here.';

  @override
  String get messyNote => 'Messy note';

  @override
  String get fakeDataHint => 'Use fake test data while developing.';

  @override
  String get saveOriginalNote => 'Save original note';

  @override
  String get saving => 'Saving…';

  @override
  String get writeNoteFirst => 'Write a note first.';

  @override
  String get savedOriginalNote => 'Saved original note.';

  @override
  String get savedOriginalNoteNext =>
      'Saved original note. Now create a user-approved timeline event.';

  @override
  String couldNotSaveNote(Object message) {
    return 'Could not save the note: $message';
  }

  @override
  String get timelineEvents => 'Timeline events';

  @override
  String get timeline => 'Timeline';

  @override
  String get originalNotes => 'Original notes';

  @override
  String get noTimelineEventsYet => 'No timeline events yet.';

  @override
  String get noOriginalNotesYet => 'No original notes yet.';

  @override
  String get loadingSavedRecords => 'Loading saved records…';

  @override
  String couldNotLoadSavedRecords(Object message) {
    return 'Could not load saved records: $message';
  }

  @override
  String get threadNotFound => 'Thread not found.';

  @override
  String get threadOrRawNoteNotFound => 'Thread or raw note not found.';

  @override
  String get originalNote => 'Original note';

  @override
  String savedDate(Object date) {
    return 'Saved date: $date';
  }

  @override
  String get unknown => 'unknown';

  @override
  String get createUserApprovedTimelineEvent =>
      'Create user-approved timeline event';

  @override
  String get manualNoAi => 'This is manual. No AI is interpreting the note.';

  @override
  String get eventType => 'Event type';

  @override
  String get note => 'Note';

  @override
  String get baselineSnapshot => 'Baseline snapshot';

  @override
  String get startedTreatmentLabel => 'Started treatment label';

  @override
  String get sideEffectNote => 'Side-effect note';

  @override
  String get appointmentQuestion => 'Appointment question';

  @override
  String get timelineTitle => 'Timeline title';

  @override
  String get userApprovedSummary => 'User-approved summary';

  @override
  String get saveTimelineEvent => 'Save timeline event';

  @override
  String get savingEvent => 'Saving event…';

  @override
  String get saveOriginalNoteFirst => 'Save an original note first.';

  @override
  String get addTitleAndSummaryFirst =>
      'Add a title and approved summary first.';

  @override
  String get savedUserApprovedTimelineEvent =>
      'Saved user-approved timeline event.';

  @override
  String couldNotCreateTimelineEvent(Object message) {
    return 'Could not create the timeline event: $message';
  }

  @override
  String get timelineEvent => 'Timeline event';

  @override
  String source(Object source) {
    return 'Source: $source';
  }

  @override
  String get summary => 'Summary';

  @override
  String get summarySoFar => 'Summary so far';

  @override
  String get summaryToBring => 'Summary to bring to an appointment';

  @override
  String get recordTimelineNote => 'Record a timeline note';

  @override
  String get recordTimelineNoteBody =>
      'Write it as it comes. One tap records it to the timeline and preserves the original wording.';

  @override
  String get kindOfNote => 'Kind of note';

  @override
  String get recordToTimeline => 'Record to timeline';

  @override
  String get recording => 'Recording…';

  @override
  String get recordedToTimeline =>
      'Recorded to timeline. Original note preserved.';

  @override
  String couldNotRecordNote(Object message) {
    return 'Could not record the note: $message';
  }

  @override
  String get startSetup => 'Start setup';

  @override
  String get justRecordSomething => 'Just record something';

  @override
  String get onboardingTitle => 'What are you here to do?';

  @override
  String get onboardingBody =>
      'Choose the closest starting point. You can change direction later.';

  @override
  String get alreadyInCareTitle => 'I’m already in care';

  @override
  String get alreadyInCareBody =>
      'Track treatment changes, symptoms, side effects, appointments, and questions.';

  @override
  String get preparingForCareTitle => 'I’m preparing for care';

  @override
  String get preparingForCareBody =>
      'Put what is happening into words and prepare what to say.';

  @override
  String get justRecordTitle => 'Just record something';

  @override
  String get justRecordBody =>
      'Skip setup for now and capture something quickly.';

  @override
  String get continueAction => 'Continue';

  @override
  String get setupLaterNote =>
      'This choice is not stored yet. The next phase adds timeline beginning and starting snapshot.';

  @override
  String get timelineBeginningTitle => 'Where should this timeline begin?';

  @override
  String get timelineBeginningBody =>
      'Signup date is not always the real beginning. Choose the closest starting point. You can correct this later.';

  @override
  String get timelineBeginToday => 'Today';

  @override
  String get timelineBeginWhenStarted => 'When this started';

  @override
  String get timelineBeginTreatmentChanged => 'When treatment changed';

  @override
  String get timelineBeginLastAppointment => 'Last appointment';

  @override
  String get timelineBeginNotSure => 'I’m not sure';

  @override
  String get startingSnapshotTitle =>
      'Save a quick picture of how things feel now?';

  @override
  String get startingSnapshotBody =>
      'This helps compare later changes. It is not a diagnosis or clinical score.';

  @override
  String get quickSnapshot => 'Quick snapshot';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get snapshotMood => 'Mood';

  @override
  String get snapshotAnxiety => 'Anxiety';

  @override
  String get snapshotSleep => 'Sleep';

  @override
  String get snapshotEnergy => 'Energy';

  @override
  String get snapshotFocus => 'Focus';

  @override
  String get snapshotStartingTasks => 'Starting tasks';

  @override
  String get snapshotLow => 'low';

  @override
  String get snapshotMixed => 'mixed';

  @override
  String get snapshotOkay => 'okay';

  @override
  String get snapshotHigh => 'high';

  @override
  String get snapshotHard => 'hard';

  @override
  String get snapshotPossible => 'possible';

  @override
  String get continueToFirstThread => 'Continue to first thread';

  @override
  String get captureSomething => 'Record something';

  @override
  String get captureSomethingBody =>
      'Choose a quick card or write freely. AI is not needed for this.';

  @override
  String get captureTreatment => 'Treatment';

  @override
  String get captureExperience => 'Experience';

  @override
  String get captureAppointment => 'Appointment';

  @override
  String get captureOther => 'Other';

  @override
  String get captureStartTreatment => 'Start treatment label';

  @override
  String get captureChangeDose => 'Change dose';

  @override
  String get captureStopTreatment => 'Stop treatment label';

  @override
  String get captureMissedLateDose => 'Missed/late dose';

  @override
  String get captureMoodAnxiety => 'Mood/anxiety';

  @override
  String get captureSleep => 'Sleep';

  @override
  String get captureFocusTasks => 'Focus/tasks';

  @override
  String get captureSideEffect => 'Side effect';

  @override
  String get captureFunctioning => 'Functioning';

  @override
  String get captureQuestion => 'Question';

  @override
  String get captureThingToMention => 'Thing to mention';

  @override
  String get captureSummaryNote => 'Summary note';

  @override
  String get captureFreeNote => 'Free note';

  @override
  String selectedCaptureKind(Object kind) {
    return 'Selected: $kind';
  }
}
