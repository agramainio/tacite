// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Tacite';

  @override
  String get language => 'Langue';

  @override
  String get languageEnglish => 'anglais';

  @override
  String get languageFrench => 'français';

  @override
  String get languageItalian => 'italien';

  @override
  String get languageRussian => 'russe';

  @override
  String get login => 'Connexion';

  @override
  String get logout => 'Déconnexion';

  @override
  String get home => 'Accueil';

  @override
  String get refresh => 'Actualiser';

  @override
  String get loggedIn => 'Connecté';

  @override
  String get notLoggedIn => 'Non connecté';

  @override
  String get checkingSession => 'Vérification de la session';

  @override
  String get checkingSessionBody =>
      'Recherche d’un jeton de connexion enregistré.';

  @override
  String get loginBeforePrivateRecords =>
      'Connectez-vous avant de créer des notes privées.';

  @override
  String get homeHero =>
      'Une mémoire privée pour ce que vous devrez peut-être expliquer plus tard.';

  @override
  String get homeBody =>
      'Capturez des notes désordonnées, gardez les mots d’origine, et préparez un résumé modifiable.';

  @override
  String get startThread => 'Commencer un fil';

  @override
  String get viewSampleTimeline => 'Voir un exemple de chronologie';

  @override
  String get productBoundaries => 'Limites du produit';

  @override
  String get boundaryNoRealName => 'Aucun vrai nom requis.';

  @override
  String get boundaryAiOptional =>
      'L’IA est facultative et désactivée par défaut.';

  @override
  String get boundaryOriginalNotes => 'Les notes originales sont conservées.';

  @override
  String get boundaryNoShame =>
      'Passer est normal. Pas de séries, pas de culpabilité.';

  @override
  String get noMedicalAdviceTitle => 'Pas d’avis médical';

  @override
  String get noMedicalAdviceBody =>
      'Tacite vous aide à enregistrer et organiser vos propres notes. L’app ne pose pas de diagnostic, ne recommande pas de traitement et ne remplace pas un médecin, psychiatre, psychologue, thérapeute ou service d’urgence.';

  @override
  String get loginTitle => 'Aucun vrai nom requis.';

  @override
  String get loginBody =>
      'Utilisez une adresse e-mail à laquelle vous avez accès pour que Tacite puisse relier vos notes à votre compte.';

  @override
  String get email => 'E-mail';

  @override
  String get requestLoginCode => 'Demander un code de connexion';

  @override
  String get loginCode => 'Code de connexion';

  @override
  String get verifyCode => 'Vérifier le code';

  @override
  String get loginCodeCreated => 'Un code de connexion a été créé.';

  @override
  String localDevCode(Object code) {
    return 'Code local de développement : $code';
  }

  @override
  String couldNotRequestCode(Object message) {
    return 'Impossible de demander un code de connexion : $message';
  }

  @override
  String couldNotVerifyCode(Object message) {
    return 'Impossible de vérifier le code : $message';
  }

  @override
  String loggedInAs(Object email) {
    return 'Connecté avec $email';
  }

  @override
  String get startThreadTitle =>
      'Que voulez-vous pouvoir expliquer clairement plus tard ?';

  @override
  String get startThreadBody =>
      'Créez un fil privé pour un changement de traitement ou une préparation de rendez-vous.';

  @override
  String get threadType => 'Type de fil';

  @override
  String get treatmentChange => 'Changement de traitement';

  @override
  String get appointmentPreparation => 'Préparation de rendez-vous';

  @override
  String get shortTitle => 'Titre court';

  @override
  String get shortTitleHint => 'Exemple : avant rendez-vous psychiatre';

  @override
  String get threadGoal => 'Qu’est-ce que ce fil doit vous aider à retenir ?';

  @override
  String get threadGoalHint =>
      'Facultatif. Utilisez de fausses données pendant le développement.';

  @override
  String get createThread => 'Créer le fil';

  @override
  String get creating => 'Création…';

  @override
  String get addShortTitleFirst => 'Ajoutez d’abord un titre court.';

  @override
  String get loginFromHomeFirst => 'Connectez-vous d’abord depuis l’accueil.';

  @override
  String get loginFromHomeBeforeCreating =>
      'Connectez-vous depuis l’accueil avant de créer le fil.';

  @override
  String couldNotCreateThread(Object message) {
    return 'Impossible de créer le fil : $message';
  }

  @override
  String get thread => 'Fil';

  @override
  String get addMessyNote => 'Ajouter une note désordonnée';

  @override
  String get rawNoteBoundary =>
      'Écrivez comme ça vient. Les mots d’origine sont conservés. Aucun formatage par IA ici.';

  @override
  String get messyNote => 'Note désordonnée';

  @override
  String get fakeDataHint =>
      'Utilisez de fausses données pendant le développement.';

  @override
  String get saveOriginalNote => 'Enregistrer la note originale';

  @override
  String get saving => 'Enregistrement…';

  @override
  String get writeNoteFirst => 'Écrivez d’abord une note.';

  @override
  String get savedOriginalNote => 'Note originale enregistrée.';

  @override
  String get savedOriginalNoteNext =>
      'Note originale enregistrée. Créez maintenant un événement de chronologie validé par vous.';

  @override
  String couldNotSaveNote(Object message) {
    return 'Impossible d’enregistrer la note : $message';
  }

  @override
  String get timelineEvents => 'Événements de chronologie';

  @override
  String get timeline => 'Chronologie';

  @override
  String get originalNotes => 'Notes originales';

  @override
  String get noTimelineEventsYet => 'Aucun événement pour l’instant.';

  @override
  String get noOriginalNotesYet => 'Aucune note originale pour l’instant.';

  @override
  String get loadingSavedRecords => 'Chargement des éléments enregistrés…';

  @override
  String couldNotLoadSavedRecords(Object message) {
    return 'Impossible de charger les éléments enregistrés : $message';
  }

  @override
  String get threadNotFound => 'Fil introuvable.';

  @override
  String get threadOrRawNoteNotFound => 'Fil ou note originale introuvable.';

  @override
  String get originalNote => 'Note originale';

  @override
  String savedDate(Object date) {
    return 'Date enregistrée : $date';
  }

  @override
  String get unknown => 'inconnu';

  @override
  String get createUserApprovedTimelineEvent =>
      'Créer un événement de chronologie validé';

  @override
  String get manualNoAi => 'C’est manuel. Aucune IA n’interprète la note.';

  @override
  String get eventType => 'Type d’événement';

  @override
  String get note => 'Note';

  @override
  String get baselineSnapshot => 'Point de départ';

  @override
  String get startedTreatmentLabel => 'Début d’un traitement libellé';

  @override
  String get sideEffectNote => 'Note d’effet indésirable';

  @override
  String get appointmentQuestion => 'Question pour le rendez-vous';

  @override
  String get timelineTitle => 'Titre dans la chronologie';

  @override
  String get userApprovedSummary => 'Résumé validé par vous';

  @override
  String get saveTimelineEvent => 'Enregistrer l’événement';

  @override
  String get savingEvent => 'Enregistrement de l’événement…';

  @override
  String get saveOriginalNoteFirst => 'Enregistrez d’abord une note originale.';

  @override
  String get addTitleAndSummaryFirst =>
      'Ajoutez d’abord un titre et un résumé validé.';

  @override
  String get savedUserApprovedTimelineEvent =>
      'Événement de chronologie enregistré.';

  @override
  String couldNotCreateTimelineEvent(Object message) {
    return 'Impossible de créer l’événement : $message';
  }

  @override
  String get timelineEvent => 'Événement de chronologie';

  @override
  String source(Object source) {
    return 'Source : $source';
  }

  @override
  String get summary => 'Résumé';

  @override
  String get summarySoFar => 'Résumé pour l’instant';

  @override
  String get summaryToBring => 'Résumé à apporter à un rendez-vous';

  @override
  String get recordTimelineNote => 'Enregistrer une note dans la chronologie';

  @override
  String get recordTimelineNoteBody =>
      'Écrivez comme ça vient. Un seul geste l’ajoute à la chronologie et conserve les mots d’origine.';

  @override
  String get kindOfNote => 'Type de note';

  @override
  String get recordToTimeline => 'Enregistrer dans la chronologie';

  @override
  String get recording => 'Enregistrement…';

  @override
  String get recordedToTimeline =>
      'Enregistré dans la chronologie. La note originale est conservée.';

  @override
  String couldNotRecordNote(Object message) {
    return 'Impossible d’enregistrer la note : $message';
  }

  @override
  String get startSetup => 'Commencer la configuration';

  @override
  String get justRecordSomething => 'Noter quelque chose';

  @override
  String get onboardingTitle => 'Pourquoi êtes-vous ici ?';

  @override
  String get onboardingBody =>
      'Choisissez le point de départ le plus proche. Vous pourrez changer de direction plus tard.';

  @override
  String get alreadyInCareTitle => 'Je suis déjà suivi';

  @override
  String get alreadyInCareBody =>
      'Suivre les changements de traitement, symptômes, effets indésirables, rendez-vous et questions.';

  @override
  String get preparingForCareTitle => 'Je prépare une prise en charge';

  @override
  String get preparingForCareBody =>
      'Mettre ce qui se passe en mots et préparer ce qu’il faut dire.';

  @override
  String get justRecordTitle => 'Noter quelque chose';

  @override
  String get justRecordBody =>
      'Passer la configuration pour l’instant et capturer rapidement quelque chose.';

  @override
  String get continueAction => 'Continuer';

  @override
  String get setupLaterNote =>
      'Ce choix n’est pas encore enregistré. La prochaine phase ajoute le début de la chronologie et le point de départ.';

  @override
  String get timelineBeginningTitle =>
      'Où cette chronologie doit-elle commencer ?';

  @override
  String get timelineBeginningBody =>
      'La date d’inscription n’est pas toujours le vrai début. Choisissez le point de départ le plus proche. Vous pourrez le corriger plus tard.';

  @override
  String get timelineBeginToday => 'Aujourd’hui';

  @override
  String get timelineBeginWhenStarted => 'Quand cela a commencé';

  @override
  String get timelineBeginTreatmentChanged => 'Quand le traitement a changé';

  @override
  String get timelineBeginLastAppointment => 'Dernier rendez-vous';

  @override
  String get timelineBeginNotSure => 'Je ne suis pas sûr';

  @override
  String get startingSnapshotTitle =>
      'Enregistrer une image rapide de comment ça va maintenant ?';

  @override
  String get startingSnapshotBody =>
      'Cela aide à comparer les changements plus tard. Ce n’est pas un diagnostic ni un score clinique.';

  @override
  String get quickSnapshot => 'Point de départ rapide';

  @override
  String get skipForNow => 'Passer pour l’instant';

  @override
  String get snapshotMood => 'Humeur';

  @override
  String get snapshotAnxiety => 'Anxiété';

  @override
  String get snapshotSleep => 'Sommeil';

  @override
  String get snapshotEnergy => 'Énergie';

  @override
  String get snapshotFocus => 'Concentration';

  @override
  String get snapshotStartingTasks => 'Commencer les tâches';

  @override
  String get snapshotLow => 'bas';

  @override
  String get snapshotMixed => 'mitigé';

  @override
  String get snapshotOkay => 'correct';

  @override
  String get snapshotHigh => 'élevé';

  @override
  String get snapshotHard => 'difficile';

  @override
  String get snapshotPossible => 'possible';

  @override
  String get continueToFirstThread => 'Continuer vers le premier fil';
}
