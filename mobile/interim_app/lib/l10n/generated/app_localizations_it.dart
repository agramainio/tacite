// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Tacite';

  @override
  String get language => 'Lingua';

  @override
  String get languageEnglish => 'inglese';

  @override
  String get languageFrench => 'francese';

  @override
  String get languageItalian => 'italiano';

  @override
  String get languageRussian => 'russo';

  @override
  String get login => 'Accedi';

  @override
  String get logout => 'Esci';

  @override
  String get home => 'Home';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get loggedIn => 'Accesso effettuato';

  @override
  String get notLoggedIn => 'Non hai effettuato l’accesso';

  @override
  String get checkingSession => 'Controllo della sessione';

  @override
  String get checkingSessionBody => 'Cerco un token di accesso salvato.';

  @override
  String get loginBeforePrivateRecords =>
      'Accedi prima di creare note private.';

  @override
  String get homeHero =>
      'Una memoria privata per ciò che potresti dover spiegare più tardi.';

  @override
  String get homeBody =>
      'Cattura note disordinate, conserva le parole originali e prepara un riassunto modificabile.';

  @override
  String get startThread => 'Inizia un filo';

  @override
  String get viewSampleTimeline => 'Vedi una cronologia di esempio';

  @override
  String get productBoundaries => 'Limiti del prodotto';

  @override
  String get boundaryNoRealName => 'Non serve il nome reale.';

  @override
  String get boundaryAiOptional =>
      'L’IA è facoltativa e disattivata per impostazione predefinita.';

  @override
  String get boundaryOriginalNotes => 'Le note originali vengono conservate.';

  @override
  String get boundaryNoShame =>
      'Saltare è normale. Niente serie, niente colpa.';

  @override
  String get noMedicalAdviceTitle => 'Nessun consiglio medico';

  @override
  String get noMedicalAdviceBody =>
      'Tacite ti aiuta a registrare e organizzare le tue note. Non fa diagnosi, non consiglia trattamenti e non sostituisce medico, psichiatra, psicologo, terapeuta o servizi di emergenza.';

  @override
  String get loginTitle => 'Non serve il nome reale.';

  @override
  String get loginBody =>
      'Usa un’e-mail a cui hai accesso, così Tacite può collegare le note al tuo account.';

  @override
  String get email => 'E-mail';

  @override
  String get requestLoginCode => 'Richiedi codice di accesso';

  @override
  String get loginCode => 'Codice di accesso';

  @override
  String get verifyCode => 'Verifica codice';

  @override
  String get loginCodeCreated => 'È stato creato un codice di accesso.';

  @override
  String localDevCode(Object code) {
    return 'Codice locale di sviluppo: $code';
  }

  @override
  String couldNotRequestCode(Object message) {
    return 'Impossibile richiedere un codice: $message';
  }

  @override
  String couldNotVerifyCode(Object message) {
    return 'Impossibile verificare il codice: $message';
  }

  @override
  String loggedInAs(Object email) {
    return 'Accesso effettuato come $email';
  }

  @override
  String get startThreadTitle =>
      'Che cosa vuoi ricordare chiaramente più tardi?';

  @override
  String get startThreadBody =>
      'Crea un filo privato per un cambiamento di trattamento o per preparare un appuntamento.';

  @override
  String get threadType => 'Tipo di filo';

  @override
  String get treatmentChange => 'Cambiamento di trattamento';

  @override
  String get appointmentPreparation => 'Preparazione appuntamento';

  @override
  String get shortTitle => 'Titolo breve';

  @override
  String get shortTitleHint => 'Esempio: prima dello psichiatra';

  @override
  String get threadGoal => 'Che cosa deve aiutarti a ricordare?';

  @override
  String get threadGoalHint =>
      'Facoltativo. Usa dati finti durante lo sviluppo.';

  @override
  String get createThread => 'Crea filo';

  @override
  String get creating => 'Creazione…';

  @override
  String get addShortTitleFirst => 'Aggiungi prima un titolo breve.';

  @override
  String get loginFromHomeFirst => 'Accedi prima dalla home.';

  @override
  String get loginFromHomeBeforeCreating =>
      'Accedi dalla home prima di creare il filo.';

  @override
  String couldNotCreateThread(Object message) {
    return 'Impossibile creare il filo: $message';
  }

  @override
  String get thread => 'Filo';

  @override
  String get addMessyNote => 'Aggiungi una nota disordinata';

  @override
  String get rawNoteBoundary =>
      'Scrivi come viene. Le parole originali vengono conservate. Qui l’IA non formatta nulla.';

  @override
  String get messyNote => 'Nota disordinata';

  @override
  String get fakeDataHint => 'Usa dati finti durante lo sviluppo.';

  @override
  String get saveOriginalNote => 'Salva nota originale';

  @override
  String get saving => 'Salvataggio…';

  @override
  String get writeNoteFirst => 'Scrivi prima una nota.';

  @override
  String get savedOriginalNote => 'Nota originale salvata.';

  @override
  String get savedOriginalNoteNext =>
      'Nota originale salvata. Ora crea un evento di cronologia approvato da te.';

  @override
  String couldNotSaveNote(Object message) {
    return 'Impossibile salvare la nota: $message';
  }

  @override
  String get timelineEvents => 'Eventi della cronologia';

  @override
  String get timeline => 'Cronologia';

  @override
  String get originalNotes => 'Note originali';

  @override
  String get noTimelineEventsYet => 'Nessun evento per ora.';

  @override
  String get noOriginalNotesYet => 'Nessuna nota originale per ora.';

  @override
  String get loadingSavedRecords => 'Caricamento degli elementi salvati…';

  @override
  String couldNotLoadSavedRecords(Object message) {
    return 'Impossibile caricare gli elementi salvati: $message';
  }

  @override
  String get threadNotFound => 'Filo non trovato.';

  @override
  String get threadOrRawNoteNotFound => 'Filo o nota originale non trovati.';

  @override
  String get originalNote => 'Nota originale';

  @override
  String savedDate(Object date) {
    return 'Data salvata: $date';
  }

  @override
  String get unknown => 'sconosciuto';

  @override
  String get createUserApprovedTimelineEvent =>
      'Crea evento di cronologia approvato';

  @override
  String get manualNoAi => 'È manuale. Nessuna IA interpreta la nota.';

  @override
  String get eventType => 'Tipo di evento';

  @override
  String get note => 'Nota';

  @override
  String get baselineSnapshot => 'Punto di partenza';

  @override
  String get startedTreatmentLabel => 'Inizio trattamento etichettato';

  @override
  String get sideEffectNote => 'Nota effetto collaterale';

  @override
  String get appointmentQuestion => 'Domanda per l’appuntamento';

  @override
  String get timelineTitle => 'Titolo nella cronologia';

  @override
  String get userApprovedSummary => 'Riassunto approvato da te';

  @override
  String get saveTimelineEvent => 'Salva evento';

  @override
  String get savingEvent => 'Salvataggio evento…';

  @override
  String get saveOriginalNoteFirst => 'Salva prima una nota originale.';

  @override
  String get addTitleAndSummaryFirst =>
      'Aggiungi prima un titolo e un riassunto approvato.';

  @override
  String get savedUserApprovedTimelineEvent => 'Evento di cronologia salvato.';

  @override
  String couldNotCreateTimelineEvent(Object message) {
    return 'Impossibile creare l’evento: $message';
  }

  @override
  String get timelineEvent => 'Evento di cronologia';

  @override
  String source(Object source) {
    return 'Fonte: $source';
  }

  @override
  String get summary => 'Riassunto';

  @override
  String get summarySoFar => 'Riassunto finora';

  @override
  String get summaryToBring => 'Riassunto da portare a un appuntamento';

  @override
  String get recordTimelineNote => 'Registra una nota nella cronologia';

  @override
  String get recordTimelineNoteBody =>
      'Scrivi come viene. Con un solo gesto viene registrata nella cronologia e le parole originali vengono conservate.';

  @override
  String get kindOfNote => 'Tipo di nota';

  @override
  String get recordToTimeline => 'Registra nella cronologia';

  @override
  String get recording => 'Registrazione…';

  @override
  String get recordedToTimeline =>
      'Registrata nella cronologia. La nota originale è conservata.';

  @override
  String couldNotRecordNote(Object message) {
    return 'Impossibile registrare la nota: $message';
  }

  @override
  String get startSetup => 'Inizia configurazione';

  @override
  String get justRecordSomething => 'Registra qualcosa';

  @override
  String get onboardingTitle => 'Per cosa sei qui?';

  @override
  String get onboardingBody =>
      'Scegli il punto di partenza più vicino. Potrai cambiare direzione più tardi.';

  @override
  String get alreadyInCareTitle => 'Sono già in cura';

  @override
  String get alreadyInCareBody =>
      'Tieni traccia di cambiamenti di trattamento, sintomi, effetti collaterali, appuntamenti e domande.';

  @override
  String get preparingForCareTitle => 'Mi sto preparando a chiedere aiuto';

  @override
  String get preparingForCareBody =>
      'Metti in parole ciò che sta succedendo e prepara cosa dire.';

  @override
  String get justRecordTitle => 'Registra qualcosa';

  @override
  String get justRecordBody =>
      'Salta la configurazione per ora e cattura rapidamente qualcosa.';

  @override
  String get continueAction => 'Continua';

  @override
  String get setupLaterNote =>
      'Questa scelta non viene ancora salvata. La prossima fase aggiunge l’inizio della cronologia e il punto di partenza.';

  @override
  String get timelineBeginningTitle =>
      'Da dove dovrebbe iniziare questa cronologia?';

  @override
  String get timelineBeginningBody =>
      'La data di iscrizione non è sempre il vero inizio. Scegli il punto di partenza più vicino. Potrai correggerlo più tardi.';

  @override
  String get timelineBeginToday => 'Oggi';

  @override
  String get timelineBeginWhenStarted => 'Quando è iniziato';

  @override
  String get timelineBeginTreatmentChanged =>
      'Quando è cambiato il trattamento';

  @override
  String get timelineBeginLastAppointment => 'Ultimo appuntamento';

  @override
  String get timelineBeginNotSure => 'Non lo so';

  @override
  String get startingSnapshotTitle =>
      'Salvare una fotografia rapida di come stanno le cose ora?';

  @override
  String get startingSnapshotBody =>
      'Aiuta a confrontare i cambiamenti più tardi. Non è una diagnosi né un punteggio clinico.';

  @override
  String get quickSnapshot => 'Punto di partenza rapido';

  @override
  String get skipForNow => 'Salta per ora';

  @override
  String get snapshotMood => 'Umore';

  @override
  String get snapshotAnxiety => 'Ansia';

  @override
  String get snapshotSleep => 'Sonno';

  @override
  String get snapshotEnergy => 'Energia';

  @override
  String get snapshotFocus => 'Concentrazione';

  @override
  String get snapshotStartingTasks => 'Iniziare i compiti';

  @override
  String get snapshotLow => 'basso';

  @override
  String get snapshotMixed => 'misto';

  @override
  String get snapshotOkay => 'ok';

  @override
  String get snapshotHigh => 'alto';

  @override
  String get snapshotHard => 'difficile';

  @override
  String get snapshotPossible => 'possibile';

  @override
  String get continueToFirstThread => 'Continua al primo filo';

  @override
  String get captureSomething => 'Registra qualcosa';

  @override
  String get captureSomethingBody =>
      'Scegli una scheda rapida o scrivi liberamente. Qui non serve l’IA.';

  @override
  String get captureTreatment => 'Trattamento';

  @override
  String get captureExperience => 'Esperienza';

  @override
  String get captureAppointment => 'Appuntamento';

  @override
  String get captureOther => 'Altro';

  @override
  String get captureStartTreatment => 'Inizio trattamento etichettato';

  @override
  String get captureChangeDose => 'Cambio dose';

  @override
  String get captureStopTreatment => 'Stop trattamento etichettato';

  @override
  String get captureMissedLateDose => 'Dose saltata/in ritardo';

  @override
  String get captureMoodAnxiety => 'Umore/ansia';

  @override
  String get captureSleep => 'Sonno';

  @override
  String get captureFocusTasks => 'Concentrazione/compiti';

  @override
  String get captureSideEffect => 'Effetto collaterale';

  @override
  String get captureFunctioning => 'Funzionamento';

  @override
  String get captureQuestion => 'Domanda';

  @override
  String get captureThingToMention => 'Cosa da menzionare';

  @override
  String get captureSummaryNote => 'Nota di riassunto';

  @override
  String get captureFreeNote => 'Nota libera';

  @override
  String selectedCaptureKind(Object kind) {
    return 'Selezionato: $kind';
  }

  @override
  String get addToSummary => 'Aggiungi al riassunto';

  @override
  String get edit => 'Modifica';

  @override
  String get moreOptions => 'Altre opzioni';

  @override
  String get showOriginalNote => 'Mostra nota originale';

  @override
  String get swipeAddToSummary => 'Aggiungi al riassunto';

  @override
  String get swipeMoreOptions => 'Altre opzioni';

  @override
  String timelineActionPlaceholder(Object action) {
    return '$action verrà collegato in un prossimo passaggio prodotto.';
  }

  @override
  String get summaryScreenTitle => 'Riassunto finora';

  @override
  String get summaryScreenBody =>
      'Crea un riassunto modificabile da un periodo scelto. È una bozza che puoi cambiare prima di portarla in cura.';

  @override
  String get summaryRange => 'Periodo';

  @override
  String get summaryRangeSinceLastAppointment => 'Dall’ultimo appuntamento';

  @override
  String get summaryRangeSinceTreatmentChange =>
      'Dal cambiamento di trattamento';

  @override
  String get summaryRangeSinceDoseChange => 'Dal cambio dose';

  @override
  String get summaryRangeLastTwoWeeks => 'Ultime 2 settimane';

  @override
  String get summaryRangeLastMonth => 'Ultimo mese';

  @override
  String get summaryRangeCustom => 'Periodo personalizzato';

  @override
  String get summaryDraftLabel => 'Riassunto modificabile';

  @override
  String get summaryTemplate =>
      'Riassunto finora\\n\\nPeriodo: periodo scelto\\n\\nPer cosa voglio aiuto:\\n- \\n\\nCosa è cambiato:\\n- \\n\\nCosa ho notato dopo:\\n- \\n\\nEffetti collaterali o cambiamenti fisici:\\n- \\n\\nFunzionamento:\\n- \\n\\nContesto che può contare:\\n- \\n\\nDomande da fare:\\n- ';

  @override
  String get copySummary => 'Copia riassunto';

  @override
  String get summaryCopied => 'Riassunto copiato.';

  @override
  String get summaryNotMedicalAdvice =>
      'Questo riassunto si basa su ciò che hai registrato. Non è un consiglio medico né una diagnosi.';

  @override
  String get recordSomething => 'Registra qualcosa';

  @override
  String get privateAccountActive => 'Account privato attivo';

  @override
  String get privateAccountActiveBody =>
      'I tuoi record sono collegati a questo account privato.';

  @override
  String get privateAccountInactive => 'Account privato non attivo';

  @override
  String get privateAccountInactiveBody =>
      'Accedi prima di salvare record privati tra più sessioni.';

  @override
  String get setupCompleteHomeBody =>
      'Registra qualcosa rapidamente, rivedi la cronologia o prepara un riassunto.';

  @override
  String get setupIncompleteHomeBody =>
      'Configura una volta la cronologia, oppure salta e registra qualcosa ora.';

  @override
  String get timelinePreview => 'Cronologia';

  @override
  String get captureType => 'Tipo';

  @override
  String get changeType => 'Cambia tipo';

  @override
  String get chooseCaptureType => 'Scegli tipo';

  @override
  String get selectedTypeHelper =>
      'Serve solo a organizzare la cronologia. Potrai cambiarlo più tardi.';

  @override
  String get summaryLoading => 'Caricamento della cronologia salvata…';

  @override
  String get summaryLoadedFromTimeline =>
      'La bozza del riassunto è stata aggiornata dai record salvati.';

  @override
  String summaryCouldNotLoadTimeline(Object message) {
    return 'Impossibile caricare i record salvati: $message';
  }

  @override
  String get summaryNoSavedTimeline =>
      'Nessuna voce salvata per ora. Registra qualcosa e poi torna al riassunto.';

  @override
  String get summaryGeneratedFromSavedData =>
      'Questa bozza usa gli eventi della cronologia e le note originali salvati in questo filo.';

  @override
  String get timelineEntriesSection => 'Voci della cronologia';

  @override
  String get originalNotesSection => 'Note originali';

  @override
  String get noDate => 'senza data';

  @override
  String get timelineHomeBody =>
      'Una cronologia privata di cosa è cambiato, cosa hai notato e cosa menzionare più tardi.';

  @override
  String get whatChangedPrompt => 'Cosa è cambiato?';

  @override
  String get whatChangedHint =>
      'Scrivi in modo disordinato. Puoi organizzare con i tag.';

  @override
  String get timelineHomeEmpty =>
      'Nessuna voce per ora. Registra qualcosa sopra.';

  @override
  String get timelineHomeLoading => 'Caricamento della cronologia…';

  @override
  String timelineHomeCouldNotLoad(Object message) {
    return 'Impossibile caricare la cronologia: $message';
  }

  @override
  String timelineHomeCouldNotRecord(Object message) {
    return 'Impossibile registrare la voce: $message';
  }

  @override
  String get hiddenTimelineText =>
      'Testo privato nascosto. Tocca per rivelare.';

  @override
  String get hideTimelineText =>
      'Nascondi il testo per impostazione predefinita';

  @override
  String get showTimelineText => 'Mostra testo';

  @override
  String get tags => 'Tag';

  @override
  String get flags => 'Marcatori';

  @override
  String get moreTags => 'Altri tag';

  @override
  String get chooseTags => 'Scegli tag';

  @override
  String get tagMedication => '#farmaco';

  @override
  String get tagDoseChange => '#cambio-dose';

  @override
  String get tagMissedDose => '#dose-saltata';

  @override
  String get tagAnxiety => '#ansia';

  @override
  String get tagSleep => '#sonno';

  @override
  String get tagMood => '#umore';

  @override
  String get tagSideEffect => '#effetto-collaterale';

  @override
  String get tagFocus => '#concentrazione';

  @override
  String get tagTasks => '#compiti';

  @override
  String get tagWork => '#lavoro';

  @override
  String get tagSelfCare => '#cura-di-sé';

  @override
  String get tagQuestion => '#domanda';

  @override
  String get tagAppointment => '#appuntamento';

  @override
  String get tagHardToSay => '#difficile-da-dire';

  @override
  String get tagSafety => '#sicurezza';

  @override
  String get flagMentionThis => 'Da menzionare';

  @override
  String get flagHardToSay => 'Difficile da dire';

  @override
  String get flagAddToSummary => 'Aggiungi al riassunto';

  @override
  String get personalTimelineTitle => 'Cronologia personale';

  @override
  String get personalTimelineGoal => 'Cronologia privata predefinita';
}
