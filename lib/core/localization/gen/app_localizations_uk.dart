// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Сьогодні';

  @override
  String get navCalendar => 'Календар';

  @override
  String get navLoans => 'Кредити';

  @override
  String get navCategories => 'Категорії';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get navAssistant => 'Асистент';

  @override
  String get onboardingTitle1 => 'Ніколи не забувайте важливе';

  @override
  String get onboardingBody1 =>
      'Відстежуйте обслуговування техніки, ТО автомобіля, річниці та багато іншого — усе в одному місці.';

  @override
  String get onboardingTitle2 => 'Повторення стали простими';

  @override
  String get onboardingBody2 =>
      'Щодня, щотижня, щомісяця, щороку або навіть за місячним календарем — налаштуйте один раз, і iReminder сам про все нагадає.';

  @override
  String get onboardingTitle3 => '100% приватності, 100% офлайн';

  @override
  String get onboardingBody3 =>
      'Без акаунтів, без хмари, без входу в систему. Усе залишається лише на вашому телефоні.';

  @override
  String get onboardingSkip => 'Пропустити';

  @override
  String get onboardingNext => 'Далі';

  @override
  String get onboardingGetStarted => 'Почати';

  @override
  String get notificationPermissionTitle => 'Не спізнюйтесь';

  @override
  String get notificationPermissionBody =>
      'iReminder потребує дозволу надсилати сповіщення, щоб нагадати вам, коли настане термін.';

  @override
  String get notificationPermissionAllow => 'Дозволити сповіщення';

  @override
  String get notificationPermissionLater => 'Не зараз';

  @override
  String get homeSectionOverdue => 'Прострочено';

  @override
  String get homeSectionToday => 'Сьогодні';

  @override
  String get homeSectionThisWeek => 'Цього тижня';

  @override
  String get homeSectionUpcoming => 'Найближчим часом';

  @override
  String get homeEmptyTitle => 'Тут поки що нічого немає';

  @override
  String get homeEmptyBody =>
      'Натисніть +, щоб додати перше нагадування або кредит на виплату.';

  @override
  String get fabAddReminder => 'Нагадування';

  @override
  String get fabAddLoan => 'Кредит на виплату';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionSnooze => 'Відкласти';

  @override
  String get actionEdit => 'Редагувати';

  @override
  String get actionDelete => 'Видалити';

  @override
  String get actionSave => 'Зберегти';

  @override
  String get actionCancel => 'Скасувати';

  @override
  String get actionConfirm => 'Підтвердити';

  @override
  String get actionYes => 'Так';

  @override
  String get actionNo => 'Ні';

  @override
  String get actionOk => 'Гаразд';

  @override
  String get actionAdd => 'Додати';

  @override
  String get actionClose => 'Закрити';

  @override
  String get reminderFormTitleNew => 'Нове нагадування';

  @override
  String get reminderFormTitleEdit => 'Редагувати нагадування';

  @override
  String get reminderFieldTitle => 'Назва';

  @override
  String get reminderFieldTitleRequired => 'Назва обов\'язкова';

  @override
  String get reminderFieldDescription => 'Опис (необов\'язково)';

  @override
  String get reminderFieldCategory => 'Категорія';

  @override
  String get reminderFieldRecurrence => 'Повторення';

  @override
  String get reminderFieldStartDate => 'Дата початку';

  @override
  String get reminderFieldTime => 'Час нагадування';

  @override
  String get reminderFieldAdvanceNotice => 'Попередити за N днів';

  @override
  String get reminderFieldRecurrenceDay => 'День місяця';

  @override
  String get reminderFieldRecurrenceMonth => 'Місяць';

  @override
  String get reminderFieldRecurrenceWeekday => 'День тижня';

  @override
  String get reminderFieldIntervalDays => 'Кожні N днів';

  @override
  String get reminderFieldLunarDay => 'Місячний день';

  @override
  String get reminderFieldLunarMonth => 'Місячний місяць';

  @override
  String get reminderDeleteConfirmTitle => 'Видалити це нагадування?';

  @override
  String get reminderDeleteConfirmBody => 'Цю дію неможливо скасувати.';

  @override
  String get recurrenceNone => 'Один раз';

  @override
  String get recurrenceDaily => 'Щодня';

  @override
  String get recurrenceWeekly => 'Щотижня';

  @override
  String get recurrenceMonthly => 'Щомісяця';

  @override
  String get recurrenceYearly => 'Щороку';

  @override
  String get recurrenceCustomIntervalDays => 'Кожні N днів';

  @override
  String get recurrenceLunarYearly => 'Щороку (за місячним календарем)';

  @override
  String get weekdayMonday => 'Понеділок';

  @override
  String get weekdayTuesday => 'Вівторок';

  @override
  String get weekdayWednesday => 'Середа';

  @override
  String get weekdayThursday => 'Четвер';

  @override
  String get weekdayFriday => 'П\'ятниця';

  @override
  String get weekdaySaturday => 'Субота';

  @override
  String get weekdaySunday => 'Неділя';

  @override
  String get loanListTitle => 'Кредити та виплати';

  @override
  String get loanFormTitleNew => 'Новий кредит на виплату';

  @override
  String get loanFormTitleEdit => 'Редагувати кредит';

  @override
  String get loanFieldName => 'Назва';

  @override
  String get loanFieldCategory => 'Категорія';

  @override
  String get loanFieldTotalAmount => 'Загальна сума (необов\'язково)';

  @override
  String get loanFieldInstallmentAmount => 'Сума одного платежу';

  @override
  String get loanFieldTotalInstallments => 'Кількість платежів';

  @override
  String get loanFieldFrequency => 'Періодичність';

  @override
  String get loanFieldDueDayOfMonth => 'День місяця для оплати';

  @override
  String get loanFieldStartDate => 'Дата початку';

  @override
  String get loanFieldReminderAdvanceDays => 'Нагадати за N днів до сплати';

  @override
  String get loanFieldNotes => 'Нотатки (необов\'язково)';

  @override
  String get loanFrequencyMonthly => 'Щомісяця';

  @override
  String get loanFrequencyWeekly => 'Щотижня';

  @override
  String get loanFrequencyBiweekly => 'Раз на два тижні';

  @override
  String loanProgress(int paid, int total) {
    return 'Сплачено $paid / $total';
  }

  @override
  String get loanMarkPaid => 'Позначити як сплачено';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Позначити $count платежів як сплачені';
  }

  @override
  String get loanStatusPending => 'Очікується';

  @override
  String get loanStatusPaid => 'Сплачено';

  @override
  String get loanStatusOverdue => 'Прострочено';

  @override
  String loanInstallmentNumber(int number) {
    return 'Платіж №$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Видалити цей кредит?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Усі $count платежів також буде видалено.';
  }

  @override
  String get categoryManagerTitle => 'Категорії';

  @override
  String get categoryFormTitleNew => 'Нова категорія';

  @override
  String get categoryFormTitleEdit => 'Редагувати категорію';

  @override
  String get categoryFieldName => 'Назва';

  @override
  String get categoryFieldNameRequired => 'Назва обов\'язкова';

  @override
  String get categoryFieldIcon => 'Значок';

  @override
  String get categoryFieldColor => 'Колір';

  @override
  String get categoryDeleteSimpleTitle => 'Видалити цю категорію?';

  @override
  String get categoryDeleteSimpleBody => 'У цій категорії немає нагадувань.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'У цій категорії ще є нагадування';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count нагадувань використовують цю категорію. Виберіть, що з ними зробити.';
  }

  @override
  String get categoryDeleteReassign => 'Перенести в іншу категорію';

  @override
  String get categoryDeleteReassignTarget => 'Перенести до';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Видалити всі $count нагадувань';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Це остаточно видалить $count нагадувань. Цю дію неможливо скасувати.';
  }

  @override
  String get categoryReorderHint => 'Перетягніть, щоб змінити порядок';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get settingsLanguage => 'Мова';

  @override
  String get settingsDefaultReminderTime => 'Час нагадування за замовчуванням';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get settingsThemeSystem => 'Системна';

  @override
  String get settingsThemeLight => 'Світла';

  @override
  String get settingsThemeDark => 'Темна';

  @override
  String get settingsBackupRestore => 'Резервне копіювання та відновлення';

  @override
  String get settingsExport => 'Експортувати резервну копію';

  @override
  String get settingsImport => 'Відновити з резервної копії';

  @override
  String get settingsExportLocationHint =>
      'Збережено в Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Резервну копію збережено';

  @override
  String get settingsImportNoneFound => 'Файли резервних копій не знайдено';

  @override
  String get settingsImportPickFile => 'Виберіть резервну копію';

  @override
  String get settingsImportSuccess => 'Дані відновлено';

  @override
  String get settingsImportConfirmTitle => 'Відновити резервну копію?';

  @override
  String get settingsImportConfirmBody =>
      'Це замінить усі поточні дані вмістом файлу резервної копії.';

  @override
  String get settingsAbout => 'Про застосунок';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Сповіщення не приходять вчасно?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Деякі виробники телефонів (Samsung, Xiaomi, Oppo тощо) агресивно обмежують фонові застосунки. Вимкніть оптимізацію батареї для iReminder в Налаштуваннях телефону > Батарея, щоб нагадування завжди приходили вчасно.';

  @override
  String get errorGeneric => 'Щось пішло не так. Спробуйте ще раз.';

  @override
  String get errorLoadFailed => 'Не вдалося завантажити дані.';

  @override
  String get settingsAiSectionTitle => 'ШІ-асистент';

  @override
  String get settingsAiEnable => 'Увімкнути ШІ-асистента';

  @override
  String get settingsAiProvider => 'Постачальник ШІ';

  @override
  String get settingsAiModel => 'Модель';

  @override
  String get settingsAiApiKey => 'Ключ API';

  @override
  String get settingsAiApiKeyHint => 'Вставте свій ключ API';

  @override
  String get settingsAiApiKeyHelp => 'Де взяти ключ?';

  @override
  String get settingsAiApiKeySaved => 'Ключ API збережено';

  @override
  String get settingsAiAllowedCategories =>
      'Категорії, які асистент може бачити';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Вимкнено за замовчуванням. Увімкніть лише ті категорії, які хочете показати асистенту — більше нічого не надсилається.';

  @override
  String get settingsAiClearHistory => 'Очистити історію чату';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Очистити історію чату?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Це видалить усі запитання й відповіді, збережені на цьому пристрої. Цю дію неможливо скасувати.';

  @override
  String get assistantTitle => 'Асистент';

  @override
  String get assistantEmptyTitle => 'Запитайте про що завгодно';

  @override
  String get assistantEmptyBody =>
      'Спробуйте: «Що мені потрібно зробити цього тижня?» або «Скільки платежів залишилось за кредитом на мотоцикл?»';

  @override
  String get assistantInputHint => 'Задайте питання…';

  @override
  String get assistantSend => 'Надіслати';

  @override
  String get assistantDisabledTitle => 'Асистента вимкнено';

  @override
  String get assistantDisabledBody =>
      'Увімкніть його в налаштуваннях і виберіть постачальника ШІ, щоб почати спілкування.';

  @override
  String get assistantOpenSettings => 'Відкрити налаштування';

  @override
  String get assistantThinking => 'Думаю…';

  @override
  String get validationRequired => 'Обов\'язкове поле';

  @override
  String get validationDayOfMonth => 'Введіть день від 1 до 31';

  @override
  String get validationMonth => 'Введіть місяць від 1 до 12';

  @override
  String get validationPositiveNumber => 'Введіть число більше 0';

  @override
  String get validationPositiveInteger => 'Введіть ціле число більше 0';

  @override
  String get settingsPermissionsSectionTitle => 'Сповіщення та будильники';

  @override
  String get settingsPermissionsNotificationLabel => 'Дозвіл на сповіщення';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Дозвіл на точні будильники';

  @override
  String get settingsPermissionsGranted => 'Надано';

  @override
  String get settingsPermissionsDenied =>
      'Не надано — нагадування можуть не спрацювати вчасно';

  @override
  String get settingsPermissionsGrantAction => 'Надати';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Відкрити налаштування';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Ще один дозвіл';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'На наступному екрані дозвольте iReminder планувати точні будильники, щоб нагадування спрацьовували саме в той час, який ви вказали.';

  @override
  String get loanMarkPaidSuccess => 'Позначено як сплачено';
}
