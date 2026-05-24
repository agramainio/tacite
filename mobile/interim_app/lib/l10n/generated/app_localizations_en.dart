// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'interim';

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
      'interim helps you record and organize your own notes. It does not diagnose, recommend treatment, or replace a doctor, psychiatrist, psychologist, therapist, or emergency service.';

  @override
  String get loginTitle => 'No real name required.';

  @override
  String get loginBody =>
      'Use an email you control so interim can keep your records linked to your account.';

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
}
