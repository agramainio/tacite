// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Tacite';

  @override
  String get language => 'Язык';

  @override
  String get languageEnglish => 'английский';

  @override
  String get languageFrench => 'французский';

  @override
  String get languageItalian => 'итальянский';

  @override
  String get languageRussian => 'русский';

  @override
  String get login => 'Войти';

  @override
  String get logout => 'Выйти';

  @override
  String get home => 'Главная';

  @override
  String get refresh => 'Обновить';

  @override
  String get loggedIn => 'Вы вошли';

  @override
  String get notLoggedIn => 'Вы не вошли';

  @override
  String get checkingSession => 'Проверка сессии';

  @override
  String get checkingSessionBody => 'Ищем сохранённый токен входа.';

  @override
  String get loginBeforePrivateRecords =>
      'Войдите, прежде чем создавать личные записи.';

  @override
  String get homeHero =>
      'Личная память для того, что позже может быть трудно объяснить.';

  @override
  String get homeBody =>
      'Записывайте хаотичные заметки, сохраняйте исходные слова и готовьте редактируемое резюме.';

  @override
  String get startThread => 'Начать тему';

  @override
  String get viewSampleTimeline => 'Посмотреть пример хронологии';

  @override
  String get productBoundaries => 'Границы продукта';

  @override
  String get boundaryNoRealName => 'Настоящее имя не требуется.';

  @override
  String get boundaryAiOptional => 'ИИ необязателен и по умолчанию выключен.';

  @override
  String get boundaryOriginalNotes => 'Исходные заметки сохраняются.';

  @override
  String get boundaryNoShame =>
      'Пропускать нормально. Без серий и чувства вины.';

  @override
  String get noMedicalAdviceTitle => 'Не медицинский совет';

  @override
  String get noMedicalAdviceBody =>
      'Tacite помогает записывать и организовывать ваши собственные заметки. Приложение не ставит диагнозы, не рекомендует лечение и не заменяет врача, психиатра, психолога, терапевта или экстренную службу.';

  @override
  String get loginTitle => 'Настоящее имя не требуется.';

  @override
  String get loginBody =>
      'Используйте e-mail, к которому у вас есть доступ, чтобы Tacite мог связать записи с вашим аккаунтом.';

  @override
  String get email => 'E-mail';

  @override
  String get requestLoginCode => 'Запросить код входа';

  @override
  String get loginCode => 'Код входа';

  @override
  String get verifyCode => 'Проверить код';

  @override
  String get loginCodeCreated => 'Код входа создан.';

  @override
  String localDevCode(Object code) {
    return 'Локальный код разработки: $code';
  }

  @override
  String couldNotRequestCode(Object message) {
    return 'Не удалось запросить код входа: $message';
  }

  @override
  String couldNotVerifyCode(Object message) {
    return 'Не удалось проверить код: $message';
  }

  @override
  String loggedInAs(Object email) {
    return 'Вход выполнен как $email';
  }

  @override
  String get startThreadTitle => 'Что вы хотите ясно помнить позже?';

  @override
  String get startThreadBody =>
      'Создайте личную тему для изменения лечения или подготовки к встрече.';

  @override
  String get threadType => 'Тип темы';

  @override
  String get treatmentChange => 'Изменение лечения';

  @override
  String get appointmentPreparation => 'Подготовка к встрече';

  @override
  String get shortTitle => 'Короткое название';

  @override
  String get shortTitleHint => 'Например: перед встречей с психиатром';

  @override
  String get threadGoal => 'Что эта тема должна помочь вам запомнить?';

  @override
  String get threadGoalHint =>
      'Необязательно. Используйте тестовые данные во время разработки.';

  @override
  String get createThread => 'Создать тему';

  @override
  String get creating => 'Создание…';

  @override
  String get addShortTitleFirst => 'Сначала добавьте короткое название.';

  @override
  String get loginFromHomeFirst => 'Сначала войдите с главной страницы.';

  @override
  String get loginFromHomeBeforeCreating =>
      'Войдите с главной страницы, затем создайте тему.';

  @override
  String couldNotCreateThread(Object message) {
    return 'Не удалось создать тему: $message';
  }

  @override
  String get thread => 'Тема';

  @override
  String get addMessyNote => 'Добавить хаотичную заметку';

  @override
  String get rawNoteBoundary =>
      'Пишите как есть. Исходные слова сохраняются. Здесь ИИ ничего не форматирует.';

  @override
  String get messyNote => 'Хаотичная заметка';

  @override
  String get fakeDataHint => 'Используйте тестовые данные во время разработки.';

  @override
  String get saveOriginalNote => 'Сохранить исходную заметку';

  @override
  String get saving => 'Сохранение…';

  @override
  String get writeNoteFirst => 'Сначала напишите заметку.';

  @override
  String get savedOriginalNote => 'Исходная заметка сохранена.';

  @override
  String get savedOriginalNoteNext =>
      'Исходная заметка сохранена. Теперь создайте подтверждённое вами событие хронологии.';

  @override
  String couldNotSaveNote(Object message) {
    return 'Не удалось сохранить заметку: $message';
  }

  @override
  String get timelineEvents => 'События хронологии';

  @override
  String get timeline => 'Хронология';

  @override
  String get originalNotes => 'Исходные заметки';

  @override
  String get noTimelineEventsYet => 'Пока нет событий.';

  @override
  String get noOriginalNotesYet => 'Пока нет исходных заметок.';

  @override
  String get loadingSavedRecords => 'Загрузка сохранённых записей…';

  @override
  String couldNotLoadSavedRecords(Object message) {
    return 'Не удалось загрузить сохранённые записи: $message';
  }

  @override
  String get threadNotFound => 'Тема не найдена.';

  @override
  String get threadOrRawNoteNotFound => 'Тема или исходная заметка не найдены.';

  @override
  String get originalNote => 'Исходная заметка';

  @override
  String savedDate(Object date) {
    return 'Дата сохранения: $date';
  }

  @override
  String get unknown => 'неизвестно';

  @override
  String get createUserApprovedTimelineEvent =>
      'Создать подтверждённое событие хронологии';

  @override
  String get manualNoAi => 'Это вручную. ИИ не интерпретирует заметку.';

  @override
  String get eventType => 'Тип события';

  @override
  String get note => 'Заметка';

  @override
  String get baselineSnapshot => 'Исходное состояние';

  @override
  String get startedTreatmentLabel => 'Начало лечения по метке';

  @override
  String get sideEffectNote => 'Заметка о побочном эффекте';

  @override
  String get appointmentQuestion => 'Вопрос для встречи';

  @override
  String get timelineTitle => 'Название в хронологии';

  @override
  String get userApprovedSummary => 'Подтверждённое вами резюме';

  @override
  String get saveTimelineEvent => 'Сохранить событие';

  @override
  String get savingEvent => 'Сохранение события…';

  @override
  String get saveOriginalNoteFirst => 'Сначала сохраните исходную заметку.';

  @override
  String get addTitleAndSummaryFirst =>
      'Сначала добавьте название и подтверждённое резюме.';

  @override
  String get savedUserApprovedTimelineEvent => 'Событие хронологии сохранено.';

  @override
  String couldNotCreateTimelineEvent(Object message) {
    return 'Не удалось создать событие: $message';
  }

  @override
  String get timelineEvent => 'Событие хронологии';

  @override
  String source(Object source) {
    return 'Источник: $source';
  }

  @override
  String get summary => 'Резюме';

  @override
  String get summarySoFar => 'Резюме на данный момент';

  @override
  String get summaryToBring => 'Резюме для встречи';

  @override
  String get recordTimelineNote => 'Записать заметку в хронологию';

  @override
  String get recordTimelineNoteBody =>
      'Пишите как есть. Одним нажатием заметка добавляется в хронологию, а исходные слова сохраняются.';

  @override
  String get kindOfNote => 'Тип заметки';

  @override
  String get recordToTimeline => 'Записать в хронологию';

  @override
  String get recording => 'Запись…';

  @override
  String get recordedToTimeline =>
      'Записано в хронологию. Исходная заметка сохранена.';

  @override
  String couldNotRecordNote(Object message) {
    return 'Не удалось записать заметку: $message';
  }

  @override
  String get startSetup => 'Начать настройку';

  @override
  String get justRecordSomething => 'Просто записать что-то';

  @override
  String get onboardingTitle => 'Зачем вы здесь?';

  @override
  String get onboardingBody =>
      'Выберите самый близкий вариант. Позже направление можно изменить.';

  @override
  String get alreadyInCareTitle => 'Я уже получаю помощь';

  @override
  String get alreadyInCareBody =>
      'Отслеживать изменения лечения, симптомы, побочные эффекты, встречи и вопросы.';

  @override
  String get preparingForCareTitle => 'Я готовлюсь обратиться за помощью';

  @override
  String get preparingForCareBody =>
      'Сформулировать, что происходит, и подготовить, что сказать.';

  @override
  String get justRecordTitle => 'Просто записать что-то';

  @override
  String get justRecordBody =>
      'Пока пропустить настройку и быстро записать что-то.';

  @override
  String get continueAction => 'Продолжить';

  @override
  String get setupLaterNote =>
      'Этот выбор пока не сохраняется. В следующей фазе появятся начало хронологии и исходное состояние.';

  @override
  String get timelineBeginningTitle => 'Где должна начинаться эта хронология?';

  @override
  String get timelineBeginningBody =>
      'Дата регистрации не всегда настоящий старт. Выберите ближайший вариант. Позже это можно исправить.';

  @override
  String get timelineBeginToday => 'Сегодня';

  @override
  String get timelineBeginWhenStarted => 'Когда это началось';

  @override
  String get timelineBeginTreatmentChanged => 'Когда изменилось лечение';

  @override
  String get timelineBeginLastAppointment => 'Последняя встреча';

  @override
  String get timelineBeginNotSure => 'Я не уверен';

  @override
  String get startingSnapshotTitle =>
      'Сохранить короткий снимок того, как всё ощущается сейчас?';

  @override
  String get startingSnapshotBody =>
      'Это поможет сравнивать изменения позже. Это не диагноз и не клиническая оценка.';

  @override
  String get quickSnapshot => 'Короткий снимок';

  @override
  String get skipForNow => 'Пока пропустить';

  @override
  String get snapshotMood => 'Настроение';

  @override
  String get snapshotAnxiety => 'Тревога';

  @override
  String get snapshotSleep => 'Сон';

  @override
  String get snapshotEnergy => 'Энергия';

  @override
  String get snapshotFocus => 'Фокус';

  @override
  String get snapshotStartingTasks => 'Начинать задачи';

  @override
  String get snapshotLow => 'низко';

  @override
  String get snapshotMixed => 'смешанно';

  @override
  String get snapshotOkay => 'нормально';

  @override
  String get snapshotHigh => 'высоко';

  @override
  String get snapshotHard => 'трудно';

  @override
  String get snapshotPossible => 'возможно';

  @override
  String get continueToFirstThread => 'Перейти к первой теме';

  @override
  String get captureSomething => 'Записать что-то';

  @override
  String get captureSomethingBody =>
      'Выберите быструю карточку или пишите свободно. ИИ для этого не нужен.';

  @override
  String get captureTreatment => 'Лечение';

  @override
  String get captureExperience => 'Самочувствие';

  @override
  String get captureAppointment => 'Встреча';

  @override
  String get captureOther => 'Другое';

  @override
  String get captureStartTreatment => 'Начало лечения по метке';

  @override
  String get captureChangeDose => 'Изменение дозы';

  @override
  String get captureStopTreatment => 'Остановка лечения по метке';

  @override
  String get captureMissedLateDose => 'Пропущенная/поздняя доза';

  @override
  String get captureMoodAnxiety => 'Настроение/тревога';

  @override
  String get captureSleep => 'Сон';

  @override
  String get captureFocusTasks => 'Фокус/задачи';

  @override
  String get captureSideEffect => 'Побочный эффект';

  @override
  String get captureFunctioning => 'Функционирование';

  @override
  String get captureQuestion => 'Вопрос';

  @override
  String get captureThingToMention => 'Что упомянуть';

  @override
  String get captureSummaryNote => 'Заметка для резюме';

  @override
  String get captureFreeNote => 'Свободная заметка';

  @override
  String selectedCaptureKind(Object kind) {
    return 'Выбрано: $kind';
  }
}
