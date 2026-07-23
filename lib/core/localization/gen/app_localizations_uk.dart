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
  String get navToday => 'Список завдань';

  @override
  String get navCalendar => 'Календар';

  @override
  String get navCategories => 'Категорії';

  @override
  String get navSettings => 'Налаштування';

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
  String get permissionCheckTitle => 'Перевірка дозволів';

  @override
  String get permissionCheckIntro =>
      'Додатку iReminder потрібні ці 3 дозволи, щоб надійно нагадувати вам точно у визначений час. Надання дозволу «Точний будильник» може відкрити екран системних налаштувань — це нормально.';

  @override
  String get permissionCheckContinueAction => 'Продовжити';

  @override
  String get permissionCheckIncompleteTitle => 'Дозволи не повні';

  @override
  String get permissionCheckIncompleteBody =>
      'Без цих дозволів нагадування можуть спрацьовувати ненадійно. Ви можете надати їх пізніше в налаштуваннях, але про це легко забути.';

  @override
  String get permissionCheckIncompleteStay => 'Повернутися й надати';

  @override
  String get permissionCheckIncompleteContinue => 'Все одно продовжити';

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
  String get homeEmptyBody => 'Натисніть +, щоб додати перше нагадування.';

  @override
  String get fabAddReminder => 'Нагадування';

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
  String get reminderFieldAdvanceNotice => 'Повідомити заздалегідь';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Дні';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Години';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Хвилини';

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
  String get reminderFieldLunarToggle => 'Місячний календар';

  @override
  String get reminderFieldDailyExclusionToggle => 'Виключити дні';

  @override
  String get reminderFieldDailyExclusionKind => 'Тип виключення';

  @override
  String get dailyExclusionKindWeekdays => 'За днем тижня';

  @override
  String get dailyExclusionKindEvenOdd => 'Парні/непарні дні';

  @override
  String get dailyExclusionKindSpecificDay => 'Конкретний день місяця';

  @override
  String get dailyExclusionEvenDays => 'Парні';

  @override
  String get dailyExclusionOddDays => 'Непарні';

  @override
  String get reminderFieldDailyExclusionDay => 'День для виключення';

  @override
  String get validationDailyExclusionWeekdays =>
      'Має залишитися принаймні один день тижня';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Невірний формат. Використовуйте коми та дефіси, напр. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (місячний)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Видалити це нагадування?';

  @override
  String get reminderDeleteConfirmBody => 'Цю дію неможливо скасувати.';

  @override
  String get reminderScheduleWarning =>
      'Нагадування збережено, але не вдалося запланувати сповіщення. Перевірте налаштування сповіщень.';

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
  String get recurrenceLunarMonthly => 'Щомісяця (за місячним календарем)';

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
  String get settingsPermissionsBatteryLabel =>
      'Ігнорувати оптимізацію батареї (рекомендовано)';

  @override
  String get settingsTestNotificationAction => 'Тест сповіщення (10 с)';

  @override
  String get settingsTestNotificationScheduled =>
      'Заплановано. Заблокуйте екран або вийдіть із застосунку й зачекайте близько 10 секунд.';

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
  String get settingsNotificationPrefsTitle => 'Звук і вібрація';

  @override
  String get settingsNotificationSound => 'Звук сповіщення';

  @override
  String get settingsNotificationVibration => 'Вібрація';

  @override
  String get settingsSnoozeDuration => 'Тривалість відкладення';

  @override
  String get snoozeDuration5Min => '5 хвилин';

  @override
  String get snoozeDuration10Min => '10 хвилин';

  @override
  String get snoozeDuration15Min => '15 хвилин';

  @override
  String get snoozeDuration30Min => '30 хвилин';

  @override
  String get snoozeDuration60Min => '1 година';

  @override
  String get snoozeDuration120Min => '2 години';

  @override
  String get defaultCategoryHomeAppliances => 'Дім';

  @override
  String get defaultCategoryVehicles => 'Транспорт';

  @override
  String get defaultCategoryFamilyEvents => 'Річниці';

  @override
  String get defaultCategoryFinance => 'Фінанси';

  @override
  String get defaultCategoryWork => 'Робота';

  @override
  String get defaultCategoryFamily => 'Сім\'я';

  @override
  String get defaultCategoryOutdoorEvents => 'Події';

  @override
  String get defaultCategoryHealth => 'Здоров\'я';

  @override
  String get defaultCategoryBirthday => 'Дні народження';

  @override
  String get defaultCategoryFood => 'Харчування';
}
