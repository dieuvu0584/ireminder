// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Task List';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navCategories => 'Categories';

  @override
  String get navSettings => 'Settings';

  @override
  String get onboardingTitle1 => 'Never forget what matters';

  @override
  String get onboardingBody1 =>
      'Track device maintenance, vehicle service, anniversaries and more — all in one place.';

  @override
  String get onboardingTitle2 => 'Recurring made simple';

  @override
  String get onboardingBody2 =>
      'Daily, weekly, monthly, yearly, or even by lunar calendar — set it once and iReminder keeps track.';

  @override
  String get onboardingTitle3 => '100% private, 100% offline';

  @override
  String get onboardingBody3 =>
      'No account, no cloud, no login. Everything stays on your phone.';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get permissionCheckTitle => 'Check permissions';

  @override
  String get permissionCheckIntro =>
      'iReminder needs these 3 permissions to reliably notify you at the exact time you set. Granting Exact alarm may take you to a system Settings screen — that\'s expected.';

  @override
  String get permissionCheckContinueAction => 'Continue';

  @override
  String get permissionCheckIncompleteTitle => 'Permissions incomplete';

  @override
  String get permissionCheckIncompleteBody =>
      'Reminders may not fire reliably without these permissions. You can grant them later from Settings, but it\'s easy to forget.';

  @override
  String get permissionCheckIncompleteStay => 'Go back and grant';

  @override
  String get permissionCheckIncompleteContinue => 'Continue anyway';

  @override
  String get homeSectionOverdue => 'Overdue';

  @override
  String get homeSectionToday => 'Today';

  @override
  String get homeSectionThisWeek => 'This week';

  @override
  String get homeSectionUpcoming => 'Upcoming';

  @override
  String get homeEmptyTitle => 'Nothing here yet';

  @override
  String get homeEmptyBody => 'Tap + to add your first reminder.';

  @override
  String get fabAddReminder => 'Reminder';

  @override
  String get actionDone => 'Done';

  @override
  String get actionSnooze => 'Snooze';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get actionYes => 'Yes';

  @override
  String get actionNo => 'No';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Add';

  @override
  String get actionClose => 'Close';

  @override
  String get reminderFormTitleNew => 'New reminder';

  @override
  String get reminderFormTitleEdit => 'Edit reminder';

  @override
  String get reminderFieldTitle => 'Title';

  @override
  String get reminderFieldTitleRequired => 'Title is required';

  @override
  String get reminderFieldDescription => 'Description (optional)';

  @override
  String get reminderFieldCategory => 'Category';

  @override
  String get reminderFieldRecurrence => 'Repeats';

  @override
  String get reminderFieldStartDate => 'Start date';

  @override
  String get reminderFieldTime => 'Reminder time';

  @override
  String get reminderFieldAdvanceNotice => 'Notify me in advance';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Days';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Hours';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minutes';

  @override
  String get reminderFieldRecurrenceDay => 'Day of month';

  @override
  String get reminderFieldRecurrenceMonth => 'Month';

  @override
  String get reminderFieldRecurrenceWeekday => 'Day of week';

  @override
  String get reminderFieldIntervalDays => 'Every N days';

  @override
  String get reminderFieldLunarDay => 'Lunar day';

  @override
  String get reminderFieldLunarMonth => 'Lunar month';

  @override
  String get reminderFieldLunarToggle => 'Lunar calendar';

  @override
  String get reminderFieldDailyExclusionToggle => 'Exclude days';

  @override
  String get reminderFieldDailyExclusionKind => 'Exclusion type';

  @override
  String get dailyExclusionKindWeekdays => 'By day of week';

  @override
  String get dailyExclusionKindEvenOdd => 'Even/odd days';

  @override
  String get dailyExclusionKindSpecificDay => 'Specific day of month';

  @override
  String get dailyExclusionEvenDays => 'Even';

  @override
  String get dailyExclusionOddDays => 'Odd';

  @override
  String get reminderFieldDailyExclusionDay => 'Day to exclude';

  @override
  String get validationDailyExclusionWeekdays =>
      'Keep at least one day of the week';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Invalid format. Use commas and dashes, e.g. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (lunar)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Delete this reminder?';

  @override
  String get reminderDeleteConfirmBody => 'This cannot be undone.';

  @override
  String get reminderScheduleWarning =>
      'Reminder saved, but the notification could not be scheduled. Check notification settings.';

  @override
  String get recurrenceNone => 'Once';

  @override
  String get recurrenceDaily => 'Daily';

  @override
  String get recurrenceWeekly => 'Weekly';

  @override
  String get recurrenceMonthly => 'Monthly';

  @override
  String get recurrenceYearly => 'Yearly';

  @override
  String get recurrenceCustomIntervalDays => 'Every N days';

  @override
  String get recurrenceLunarYearly => 'Yearly (lunar calendar)';

  @override
  String get recurrenceLunarMonthly => 'Monthly (lunar calendar)';

  @override
  String get weekdayMonday => 'Monday';

  @override
  String get weekdayTuesday => 'Tuesday';

  @override
  String get weekdayWednesday => 'Wednesday';

  @override
  String get weekdayThursday => 'Thursday';

  @override
  String get weekdayFriday => 'Friday';

  @override
  String get weekdaySaturday => 'Saturday';

  @override
  String get weekdaySunday => 'Sunday';

  @override
  String get categoryManagerTitle => 'Categories';

  @override
  String get categoryFormTitleNew => 'New category';

  @override
  String get categoryFormTitleEdit => 'Edit category';

  @override
  String get categoryFieldName => 'Name';

  @override
  String get categoryFieldNameRequired => 'Name is required';

  @override
  String get categoryFieldIcon => 'Icon';

  @override
  String get categoryFieldColor => 'Color';

  @override
  String get categoryDeleteSimpleTitle => 'Delete this category?';

  @override
  String get categoryDeleteSimpleBody =>
      'This category has no reminders in it.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'This category still has reminders';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count reminders use this category. Choose what to do with them.';
  }

  @override
  String get categoryDeleteReassign => 'Move to another category';

  @override
  String get categoryDeleteReassignTarget => 'Move to';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Delete all $count reminders';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'This will permanently delete $count reminders. This cannot be undone.';
  }

  @override
  String get categoryReorderHint => 'Drag to reorder';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsDefaultReminderTime => 'Default reminder time';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsBackupRestore => 'Backup & restore';

  @override
  String get settingsExport => 'Export backup';

  @override
  String get settingsImport => 'Restore from backup';

  @override
  String get settingsExportLocationHint =>
      'Saved to Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Backup saved';

  @override
  String get settingsImportNoneFound => 'No backup files found';

  @override
  String get settingsImportPickFile => 'Choose a backup';

  @override
  String get settingsImportSuccess => 'Backup restored';

  @override
  String get settingsImportConfirmTitle => 'Restore backup?';

  @override
  String get settingsImportConfirmBody =>
      'This replaces all current data with the contents of the backup file.';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Notifications not firing on time?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Some phone makers (Samsung, Xiaomi, Oppo...) aggressively restrict background apps. Turn off battery optimization for iReminder in your phone\'s Settings > Battery to make sure reminders always arrive on time.';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorLoadFailed => 'Couldn\'t load data.';

  @override
  String get validationRequired => 'Required';

  @override
  String get validationDayOfMonth => 'Enter a day from 1–31';

  @override
  String get validationMonth => 'Enter a month from 1–12';

  @override
  String get validationPositiveNumber => 'Enter a number greater than 0';

  @override
  String get validationPositiveInteger => 'Enter a whole number greater than 0';

  @override
  String get settingsPermissionsSectionTitle => 'Notifications & Alarms';

  @override
  String get settingsPermissionsNotificationLabel => 'Notification permission';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Exact alarm permission';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ignore battery optimization (recommended)';

  @override
  String get settingsTestNotificationAction => 'Test notification (10s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Scheduled. Lock your screen or leave the app now and wait about 10 seconds.';

  @override
  String get settingsPermissionsGranted => 'Granted';

  @override
  String get settingsPermissionsDenied =>
      'Not granted — reminders may not fire on time';

  @override
  String get settingsPermissionsGrantAction => 'Grant';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Open settings';

  @override
  String get settingsNotificationPrefsTitle => 'Sound & vibration';

  @override
  String get settingsNotificationSound => 'Notification sound';

  @override
  String get settingsNotificationVibration => 'Vibration';

  @override
  String get settingsSnoozeDuration => 'Snooze duration';

  @override
  String get snoozeDuration5Min => '5 minutes';

  @override
  String get snoozeDuration10Min => '10 minutes';

  @override
  String get snoozeDuration15Min => '15 minutes';

  @override
  String get snoozeDuration30Min => '30 minutes';

  @override
  String get snoozeDuration60Min => '1 hour';

  @override
  String get snoozeDuration120Min => '2 hours';

  @override
  String get defaultCategoryHomeAppliances => 'Home';

  @override
  String get defaultCategoryVehicles => 'Vehicles';

  @override
  String get defaultCategoryFamilyEvents => 'Anniversaries';

  @override
  String get defaultCategoryFinance => 'Finance';

  @override
  String get defaultCategoryWork => 'Work';

  @override
  String get defaultCategoryFamily => 'Family';

  @override
  String get defaultCategoryOutdoorEvents => 'Events';

  @override
  String get defaultCategoryHealth => 'Health';

  @override
  String get defaultCategoryBirthday => 'Birthdays';

  @override
  String get defaultCategoryFood => 'Food';
}
