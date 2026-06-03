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

  @override
  String get addToSummary => 'Add to summary';

  @override
  String get edit => 'Edit';

  @override
  String get moreOptions => 'More options';

  @override
  String get showOriginalNote => 'Show original note';

  @override
  String get swipeAddToSummary => 'Add to summary';

  @override
  String get swipeMoreOptions => 'More options';

  @override
  String timelineActionPlaceholder(Object action) {
    return '$action will be wired in the next product pass.';
  }

  @override
  String get summaryScreenTitle => 'Summary so far';

  @override
  String get summaryScreenBody =>
      'Create an editable summary from a selected range. This is a draft you can change before bringing it to care.';

  @override
  String get summaryRange => 'Range';

  @override
  String get summaryRangeSinceLastAppointment => 'Since last appointment';

  @override
  String get summaryRangeSinceTreatmentChange => 'Since treatment change';

  @override
  String get summaryRangeSinceDoseChange => 'Since dose change';

  @override
  String get summaryRangeLastTwoWeeks => 'Last 2 weeks';

  @override
  String get summaryRangeLastMonth => 'Last month';

  @override
  String get summaryRangeCustom => 'Custom range';

  @override
  String get summaryDraftLabel => 'Editable summary';

  @override
  String get summaryTemplate =>
      'Summary so far\\n\\nRange: selected range\\n\\nWhat I want help with:\\n- \\n\\nWhat changed:\\n- \\n\\nWhat I noticed after:\\n- \\n\\nSide effects or body changes:\\n- \\n\\nFunctioning:\\n- \\n\\nContext that may matter:\\n- \\n\\nQuestions to bring up:\\n- ';

  @override
  String get copySummary => 'Copy summary';

  @override
  String get summaryCopied => 'Summary copied.';

  @override
  String get summaryNotMedicalAdvice =>
      'This summary is based on what you recorded. It is not medical advice or a diagnosis.';

  @override
  String get recordSomething => 'Record something';

  @override
  String get privateAccountActive => 'Private account active';

  @override
  String get privateAccountActiveBody =>
      'Your records are linked to this private account.';

  @override
  String get privateAccountInactive => 'Private account not active';

  @override
  String get privateAccountInactiveBody =>
      'Log in before saving private records across sessions.';

  @override
  String get setupCompleteHomeBody =>
      'Record something quickly, review the timeline, or prepare a summary.';

  @override
  String get setupIncompleteHomeBody =>
      'Set up the timeline once, or skip and record something now.';

  @override
  String get timelinePreview => 'Timeline';

  @override
  String get captureType => 'Type';

  @override
  String get changeType => 'Change type';

  @override
  String get chooseCaptureType => 'Choose type';

  @override
  String get selectedTypeHelper =>
      'This only helps organize the timeline. You can change it later.';

  @override
  String get summaryLoading => 'Loading saved timeline…';

  @override
  String get summaryLoadedFromTimeline =>
      'Summary draft updated from saved timeline records.';

  @override
  String summaryCouldNotLoadTimeline(Object message) {
    return 'Could not load saved timeline records: $message';
  }

  @override
  String get summaryNoSavedTimeline =>
      'No saved timeline entries yet. Record something first, then come back to Summary so far.';

  @override
  String get summaryGeneratedFromSavedData =>
      'This draft uses saved timeline events and original notes from this thread.';

  @override
  String get timelineEntriesSection => 'Timeline entries';

  @override
  String get originalNotesSection => 'Original notes';

  @override
  String get noDate => 'no date';

  @override
  String get timelineHomeBody =>
      'A private timeline of what changed, what you noticed, and what to mention later.';

  @override
  String get whatChangedPrompt => 'What changed?';

  @override
  String get whatChangedHint => 'Write messily. You can organize it with tags.';

  @override
  String get timelineHomeEmpty =>
      'No timeline entries yet. Record something above.';

  @override
  String get timelineHomeLoading => 'Loading timeline…';

  @override
  String timelineHomeCouldNotLoad(Object message) {
    return 'Could not load timeline: $message';
  }

  @override
  String timelineHomeCouldNotRecord(Object message) {
    return 'Could not record entry: $message';
  }

  @override
  String get hiddenTimelineText => 'Private text hidden. Tap to reveal.';

  @override
  String get hideTimelineText => 'Hide note text by default';

  @override
  String get showTimelineText => 'Show note text';

  @override
  String get tags => 'Tags';

  @override
  String get flags => 'Flags';

  @override
  String get moreTags => 'More tags';

  @override
  String get chooseTags => 'Choose tags';

  @override
  String get tagMedication => '#medication';

  @override
  String get tagDoseChange => '#dose-change';

  @override
  String get tagMissedDose => '#missed-dose';

  @override
  String get tagAnxiety => '#anxiety';

  @override
  String get tagSleep => '#sleep';

  @override
  String get tagMood => '#mood';

  @override
  String get tagSideEffect => '#side-effect';

  @override
  String get tagFocus => '#focus';

  @override
  String get tagTasks => '#tasks';

  @override
  String get tagWork => '#work';

  @override
  String get tagSelfCare => '#self-care';

  @override
  String get tagQuestion => '#question';

  @override
  String get tagAppointment => '#appointment';

  @override
  String get tagHardToSay => '#hard-to-say';

  @override
  String get tagSafety => '#safety';

  @override
  String get flagMentionThis => 'Mention this';

  @override
  String get flagHardToSay => 'Hard to say';

  @override
  String get flagAddToSummary => 'Add to summary';

  @override
  String get personalTimelineTitle => 'Personal timeline';

  @override
  String get personalTimelineGoal => 'Default private timeline';
}
