// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Сегодня';

  @override
  String get navCalendar => 'Календарь';

  @override
  String get navLoans => 'Кредиты';

  @override
  String get navCategories => 'Категории';

  @override
  String get navSettings => 'Настройки';

  @override
  String get navAssistant => 'Ассистент';

  @override
  String get onboardingTitle1 => 'Никогда не забывайте важное';

  @override
  String get onboardingBody1 =>
      'Отслеживайте обслуживание техники, ТО автомобиля, годовщины и многое другое — всё в одном месте.';

  @override
  String get onboardingTitle2 => 'Повторение стало проще';

  @override
  String get onboardingBody2 =>
      'Ежедневно, еженедельно, ежемесячно, ежегодно или даже по лунному календарю — настройте один раз, и iReminder всё запомнит.';

  @override
  String get onboardingTitle3 => '100% приватно, 100% офлайн';

  @override
  String get onboardingBody3 =>
      'Без аккаунта, без облака, без входа в систему. Всё остаётся на вашем телефоне.';

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingNext => 'Далее';

  @override
  String get onboardingGetStarted => 'Начать';

  @override
  String get notificationPermissionTitle => 'Ничего не пропустите';

  @override
  String get notificationPermissionBody =>
      'iReminder нужно разрешение на отправку уведомлений, когда наступает срок.';

  @override
  String get notificationPermissionAllow => 'Разрешить уведомления';

  @override
  String get notificationPermissionLater => 'Не сейчас';

  @override
  String get homeSectionOverdue => 'Просрочено';

  @override
  String get homeSectionToday => 'Сегодня';

  @override
  String get homeSectionThisWeek => 'На этой неделе';

  @override
  String get homeSectionUpcoming => 'Предстоящие';

  @override
  String get homeEmptyTitle => 'Пока здесь пусто';

  @override
  String get homeEmptyBody =>
      'Нажмите +, чтобы добавить первое напоминание или кредит с рассрочкой.';

  @override
  String get fabAddReminder => 'Напоминание';

  @override
  String get fabAddLoan => 'Кредит с рассрочкой';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionSnooze => 'Отложить';

  @override
  String get actionEdit => 'Изменить';

  @override
  String get actionDelete => 'Удалить';

  @override
  String get actionSave => 'Сохранить';

  @override
  String get actionCancel => 'Отмена';

  @override
  String get actionConfirm => 'Подтвердить';

  @override
  String get actionYes => 'Да';

  @override
  String get actionNo => 'Нет';

  @override
  String get actionOk => 'ОК';

  @override
  String get actionAdd => 'Добавить';

  @override
  String get actionClose => 'Закрыть';

  @override
  String get reminderFormTitleNew => 'Новое напоминание';

  @override
  String get reminderFormTitleEdit => 'Изменить напоминание';

  @override
  String get reminderFieldTitle => 'Название';

  @override
  String get reminderFieldTitleRequired => 'Введите название';

  @override
  String get reminderFieldDescription => 'Описание (необязательно)';

  @override
  String get reminderFieldCategory => 'Категория';

  @override
  String get reminderFieldRecurrence => 'Повтор';

  @override
  String get reminderFieldStartDate => 'Дата начала';

  @override
  String get reminderFieldTime => 'Время напоминания';

  @override
  String get reminderFieldAdvanceNotice => 'Напомнить за N дней';

  @override
  String get reminderFieldRecurrenceDay => 'День месяца';

  @override
  String get reminderFieldRecurrenceMonth => 'Месяц';

  @override
  String get reminderFieldRecurrenceWeekday => 'День недели';

  @override
  String get reminderFieldIntervalDays => 'Каждые N дней';

  @override
  String get reminderFieldLunarDay => 'Лунный день';

  @override
  String get reminderFieldLunarMonth => 'Лунный месяц';

  @override
  String get reminderDeleteConfirmTitle => 'Удалить это напоминание?';

  @override
  String get reminderDeleteConfirmBody => 'Это действие нельзя отменить.';

  @override
  String get recurrenceNone => 'Один раз';

  @override
  String get recurrenceDaily => 'Ежедневно';

  @override
  String get recurrenceWeekly => 'Еженедельно';

  @override
  String get recurrenceMonthly => 'Ежемесячно';

  @override
  String get recurrenceYearly => 'Ежегодно';

  @override
  String get recurrenceCustomIntervalDays => 'Каждые N дней';

  @override
  String get recurrenceLunarYearly => 'Ежегодно (по лунному календарю)';

  @override
  String get weekdayMonday => 'Понедельник';

  @override
  String get weekdayTuesday => 'Вторник';

  @override
  String get weekdayWednesday => 'Среда';

  @override
  String get weekdayThursday => 'Четверг';

  @override
  String get weekdayFriday => 'Пятница';

  @override
  String get weekdaySaturday => 'Суббота';

  @override
  String get weekdaySunday => 'Воскресенье';

  @override
  String get loanListTitle => 'Кредиты и рассрочки';

  @override
  String get loanFormTitleNew => 'Новый кредит с рассрочкой';

  @override
  String get loanFormTitleEdit => 'Изменить кредит';

  @override
  String get loanFieldName => 'Название';

  @override
  String get loanFieldCategory => 'Категория';

  @override
  String get loanFieldTotalAmount => 'Общая сумма (необязательно)';

  @override
  String get loanFieldInstallmentAmount => 'Сумма одного платежа';

  @override
  String get loanFieldTotalInstallments => 'Количество платежей';

  @override
  String get loanFieldFrequency => 'Периодичность';

  @override
  String get loanFieldDueDayOfMonth => 'День платежа в месяце';

  @override
  String get loanFieldStartDate => 'Дата начала';

  @override
  String get loanFieldReminderAdvanceDays => 'Напомнить за N дней до платежа';

  @override
  String get loanFieldNotes => 'Заметки (необязательно)';

  @override
  String get loanFrequencyMonthly => 'Ежемесячно';

  @override
  String get loanFrequencyWeekly => 'Еженедельно';

  @override
  String get loanFrequencyBiweekly => 'Раз в две недели';

  @override
  String loanProgress(int paid, int total) {
    return 'Оплачено $paid из $total';
  }

  @override
  String get loanMarkPaid => 'Отметить как оплачено';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Отметить $count платежей как оплаченные';
  }

  @override
  String get loanStatusPending => 'Ожидается';

  @override
  String get loanStatusPaid => 'Оплачено';

  @override
  String get loanStatusOverdue => 'Просрочено';

  @override
  String loanInstallmentNumber(int number) {
    return 'Платёж №$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Удалить этот кредит?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Все $count платежей также будут удалены.';
  }

  @override
  String get categoryManagerTitle => 'Категории';

  @override
  String get categoryFormTitleNew => 'Новая категория';

  @override
  String get categoryFormTitleEdit => 'Изменить категорию';

  @override
  String get categoryFieldName => 'Название';

  @override
  String get categoryFieldNameRequired => 'Введите название';

  @override
  String get categoryFieldIcon => 'Значок';

  @override
  String get categoryFieldColor => 'Цвет';

  @override
  String get categoryDeleteSimpleTitle => 'Удалить эту категорию?';

  @override
  String get categoryDeleteSimpleBody => 'В этой категории нет напоминаний.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'В этой категории ещё есть напоминания';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count напоминаний используют эту категорию. Выберите, что с ними делать.';
  }

  @override
  String get categoryDeleteReassign => 'Перенести в другую категорию';

  @override
  String get categoryDeleteReassignTarget => 'Перенести в';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Удалить все $count напоминаний';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Это навсегда удалит $count напоминаний. Это действие нельзя отменить.';
  }

  @override
  String get categoryReorderHint => 'Перетащите, чтобы изменить порядок';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsDefaultReminderTime => 'Время напоминания по умолчанию';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get settingsThemeSystem => 'Системная';

  @override
  String get settingsThemeLight => 'Светлая';

  @override
  String get settingsThemeDark => 'Тёмная';

  @override
  String get settingsBackupRestore => 'Резервное копирование и восстановление';

  @override
  String get settingsExport => 'Создать резервную копию';

  @override
  String get settingsImport => 'Восстановить из резервной копии';

  @override
  String get settingsExportLocationHint =>
      'Сохранено в Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Резервная копия сохранена';

  @override
  String get settingsImportNoneFound => 'Резервные копии не найдены';

  @override
  String get settingsImportPickFile => 'Выбрать резервную копию';

  @override
  String get settingsImportSuccess => 'Данные восстановлены';

  @override
  String get settingsImportConfirmTitle => 'Восстановить резервную копию?';

  @override
  String get settingsImportConfirmBody =>
      'Все текущие данные будут заменены содержимым файла резервной копии.';

  @override
  String get settingsAbout => 'О приложении';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Уведомления приходят не вовремя?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Некоторые производители (Samsung, Xiaomi, Oppo и др.) сильно ограничивают работу приложений в фоне. Отключите оптимизацию батареи для iReminder в настройках телефона (Батарея), чтобы напоминания всегда приходили вовремя.';

  @override
  String get errorGeneric => 'Что-то пошло не так. Попробуйте ещё раз.';

  @override
  String get errorLoadFailed => 'Не удалось загрузить данные.';

  @override
  String get settingsAiSectionTitle => 'ИИ-ассистент';

  @override
  String get settingsAiEnable => 'Включить ИИ-ассистента';

  @override
  String get settingsAiProvider => 'Провайдер ИИ';

  @override
  String get settingsAiModel => 'Модель';

  @override
  String get settingsAiApiKey => 'API-ключ';

  @override
  String get settingsAiApiKeyHint => 'Вставьте ваш API-ключ';

  @override
  String get settingsAiApiKeyHelp => 'Где взять ключ?';

  @override
  String get settingsAiApiKeySaved => 'API-ключ сохранён';

  @override
  String get settingsAiAllowedCategories => 'Категории, доступные ассистенту';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'По умолчанию всё выключено. Включите только те категории, которые хотите показать ассистенту — больше ничего не передаётся.';

  @override
  String get settingsAiClearHistory => 'Очистить историю чата';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Очистить историю чата?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Все вопросы и ответы, сохранённые на этом устройстве, будут удалены. Это действие нельзя отменить.';

  @override
  String get assistantTitle => 'Ассистент';

  @override
  String get assistantEmptyTitle => 'Спросите что угодно';

  @override
  String get assistantEmptyBody =>
      'Попробуйте спросить «Что мне нужно сделать на этой неделе?» или «Сколько платежей осталось по кредиту на мотоцикл?»';

  @override
  String get assistantInputHint => 'Введите вопрос…';

  @override
  String get assistantSend => 'Отправить';

  @override
  String get assistantDisabledTitle => 'Ассистент отключён';

  @override
  String get assistantDisabledBody =>
      'Включите его в настройках и выберите провайдера ИИ, чтобы начать общение.';

  @override
  String get assistantOpenSettings => 'Открыть настройки';

  @override
  String get assistantThinking => 'Думаю…';

  @override
  String get validationRequired => 'Обязательное поле';

  @override
  String get validationDayOfMonth => 'Введите день от 1 до 31';

  @override
  String get validationMonth => 'Введите месяц от 1 до 12';

  @override
  String get validationPositiveNumber => 'Введите число больше 0';

  @override
  String get validationPositiveInteger => 'Введите целое число больше 0';

  @override
  String get settingsPermissionsSectionTitle => 'Уведомления и будильники';

  @override
  String get settingsPermissionsNotificationLabel =>
      'Разрешение на уведомления';

  @override
  String get settingsPermissionsExactAlarmLabel =>
      'Разрешение на точные будильники';

  @override
  String get settingsPermissionsGranted => 'Предоставлено';

  @override
  String get settingsPermissionsDenied =>
      'Не предоставлено — напоминания могут приходить не вовремя';

  @override
  String get settingsPermissionsGrantAction => 'Предоставить';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Открыть настройки';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Ещё одно разрешение';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'На следующем экране разрешите iReminder планировать точные будильники, чтобы напоминания приходили точно в заданное время.';

  @override
  String get loanMarkPaidSuccess => 'Отмечено как оплачено';

  @override
  String get settingsNotificationPrefsTitle => 'Звук и вибрация';

  @override
  String get settingsNotificationSound => 'Звук уведомления';

  @override
  String get settingsNotificationVibration => 'Вибрация';

  @override
  String get settingsSnoozeDuration => 'Длительность отложенного напоминания';

  @override
  String get snoozeDuration5Min => '5 минут';

  @override
  String get snoozeDuration10Min => '10 минут';

  @override
  String get snoozeDuration15Min => '15 минут';

  @override
  String get snoozeDuration30Min => '30 минут';

  @override
  String get snoozeDuration60Min => '1 час';

  @override
  String get snoozeDuration120Min => '2 часа';
}
