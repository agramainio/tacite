// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'interim';

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
      'interim vous aide à enregistrer et organiser vos propres notes. L’app ne pose pas de diagnostic, ne recommande pas de traitement et ne remplace pas un médecin, psychiatre, psychologue, thérapeute ou service d’urgence.';

  @override
  String get loginTitle => 'Aucun vrai nom requis.';

  @override
  String get loginBody =>
      'Utilisez une adresse e-mail à laquelle vous avez accès pour qu’interim puisse relier vos notes à votre compte.';

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
}
