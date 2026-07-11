import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('mr'),
    Locale('ms'),
    Locale('nl'),
    Locale('no'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'iReminder'**
  String get appTitle;

  /// No description provided for @navToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// No description provided for @navCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get navCalendar;

  /// No description provided for @navLoans.
  ///
  /// In en, this message translates to:
  /// **'Loans'**
  String get navLoans;

  /// No description provided for @navCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get navCategories;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @navAssistant.
  ///
  /// In en, this message translates to:
  /// **'Assistant'**
  String get navAssistant;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Never forget what matters'**
  String get onboardingTitle1;

  /// No description provided for @onboardingBody1.
  ///
  /// In en, this message translates to:
  /// **'Track device maintenance, vehicle service, anniversaries and more — all in one place.'**
  String get onboardingBody1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Recurring made simple'**
  String get onboardingTitle2;

  /// No description provided for @onboardingBody2.
  ///
  /// In en, this message translates to:
  /// **'Daily, weekly, monthly, yearly, or even by lunar calendar — set it once and iReminder keeps track.'**
  String get onboardingBody2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'100% private, 100% offline'**
  String get onboardingTitle3;

  /// No description provided for @onboardingBody3.
  ///
  /// In en, this message translates to:
  /// **'No account, no cloud, no login. Everything stays on your phone.'**
  String get onboardingBody3;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @notificationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay on time'**
  String get notificationPermissionTitle;

  /// No description provided for @notificationPermissionBody.
  ///
  /// In en, this message translates to:
  /// **'iReminder needs permission to send you notifications when something is due.'**
  String get notificationPermissionBody;

  /// No description provided for @notificationPermissionAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications'**
  String get notificationPermissionAllow;

  /// No description provided for @notificationPermissionLater.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notificationPermissionLater;

  /// No description provided for @homeSectionOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get homeSectionOverdue;

  /// No description provided for @homeSectionToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homeSectionToday;

  /// No description provided for @homeSectionThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get homeSectionThisWeek;

  /// No description provided for @homeSectionUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get homeSectionUpcoming;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first reminder or installment loan.'**
  String get homeEmptyBody;

  /// No description provided for @fabAddReminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get fabAddReminder;

  /// No description provided for @fabAddLoan.
  ///
  /// In en, this message translates to:
  /// **'Installment loan'**
  String get fabAddLoan;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionSnooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze'**
  String get actionSnooze;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// No description provided for @actionYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get actionYes;

  /// No description provided for @actionNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get actionNo;

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get actionOk;

  /// No description provided for @actionAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get actionAdd;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @reminderFormTitleNew.
  ///
  /// In en, this message translates to:
  /// **'New reminder'**
  String get reminderFormTitleNew;

  /// No description provided for @reminderFormTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit reminder'**
  String get reminderFormTitleEdit;

  /// No description provided for @reminderFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get reminderFieldTitle;

  /// No description provided for @reminderFieldTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get reminderFieldTitleRequired;

  /// No description provided for @reminderFieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get reminderFieldDescription;

  /// No description provided for @reminderFieldCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get reminderFieldCategory;

  /// No description provided for @reminderFieldRecurrence.
  ///
  /// In en, this message translates to:
  /// **'Repeats'**
  String get reminderFieldRecurrence;

  /// No description provided for @reminderFieldStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get reminderFieldStartDate;

  /// No description provided for @reminderFieldTime.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get reminderFieldTime;

  /// No description provided for @reminderFieldAdvanceNotice.
  ///
  /// In en, this message translates to:
  /// **'Notify N days early'**
  String get reminderFieldAdvanceNotice;

  /// No description provided for @reminderFieldRecurrenceDay.
  ///
  /// In en, this message translates to:
  /// **'Day of month'**
  String get reminderFieldRecurrenceDay;

  /// No description provided for @reminderFieldRecurrenceMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get reminderFieldRecurrenceMonth;

  /// No description provided for @reminderFieldRecurrenceWeekday.
  ///
  /// In en, this message translates to:
  /// **'Day of week'**
  String get reminderFieldRecurrenceWeekday;

  /// No description provided for @reminderFieldIntervalDays.
  ///
  /// In en, this message translates to:
  /// **'Every N days'**
  String get reminderFieldIntervalDays;

  /// No description provided for @reminderFieldLunarDay.
  ///
  /// In en, this message translates to:
  /// **'Lunar day'**
  String get reminderFieldLunarDay;

  /// No description provided for @reminderFieldLunarMonth.
  ///
  /// In en, this message translates to:
  /// **'Lunar month'**
  String get reminderFieldLunarMonth;

  /// No description provided for @reminderFieldLunarToggle.
  ///
  /// In en, this message translates to:
  /// **'Lunar calendar'**
  String get reminderFieldLunarToggle;

  /// No description provided for @reminderLunarDateLabel.
  ///
  /// In en, this message translates to:
  /// **'{date} (lunar)'**
  String reminderLunarDateLabel(String date);

  /// No description provided for @reminderDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this reminder?'**
  String get reminderDeleteConfirmTitle;

  /// No description provided for @reminderDeleteConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get reminderDeleteConfirmBody;

  /// No description provided for @reminderScheduleWarning.
  ///
  /// In en, this message translates to:
  /// **'Reminder saved, but the notification could not be scheduled. Check notification settings.'**
  String get reminderScheduleWarning;

  /// No description provided for @recurrenceNone.
  ///
  /// In en, this message translates to:
  /// **'Once'**
  String get recurrenceNone;

  /// No description provided for @recurrenceDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get recurrenceDaily;

  /// No description provided for @recurrenceWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get recurrenceWeekly;

  /// No description provided for @recurrenceMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get recurrenceMonthly;

  /// No description provided for @recurrenceYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get recurrenceYearly;

  /// No description provided for @recurrenceCustomIntervalDays.
  ///
  /// In en, this message translates to:
  /// **'Every N days'**
  String get recurrenceCustomIntervalDays;

  /// No description provided for @recurrenceLunarYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly (lunar calendar)'**
  String get recurrenceLunarYearly;

  /// No description provided for @weekdayMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get weekdayMonday;

  /// No description provided for @weekdayTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get weekdayTuesday;

  /// No description provided for @weekdayWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get weekdayWednesday;

  /// No description provided for @weekdayThursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get weekdayThursday;

  /// No description provided for @weekdayFriday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get weekdayFriday;

  /// No description provided for @weekdaySaturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get weekdaySaturday;

  /// No description provided for @weekdaySunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get weekdaySunday;

  /// No description provided for @loanListTitle.
  ///
  /// In en, this message translates to:
  /// **'Loans & installments'**
  String get loanListTitle;

  /// No description provided for @loanFormTitleNew.
  ///
  /// In en, this message translates to:
  /// **'New installment loan'**
  String get loanFormTitleNew;

  /// No description provided for @loanFormTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit loan'**
  String get loanFormTitleEdit;

  /// No description provided for @loanFieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get loanFieldName;

  /// No description provided for @loanFieldCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get loanFieldCategory;

  /// No description provided for @loanFieldTotalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total amount (optional)'**
  String get loanFieldTotalAmount;

  /// No description provided for @loanFieldInstallmentAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount per installment'**
  String get loanFieldInstallmentAmount;

  /// No description provided for @loanFieldTotalInstallments.
  ///
  /// In en, this message translates to:
  /// **'Number of installments'**
  String get loanFieldTotalInstallments;

  /// No description provided for @loanFieldFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get loanFieldFrequency;

  /// No description provided for @loanFieldDueDayOfMonth.
  ///
  /// In en, this message translates to:
  /// **'Due day of month'**
  String get loanFieldDueDayOfMonth;

  /// No description provided for @loanFieldStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get loanFieldStartDate;

  /// No description provided for @loanFieldReminderAdvanceDays.
  ///
  /// In en, this message translates to:
  /// **'Remind N days before due'**
  String get loanFieldReminderAdvanceDays;

  /// No description provided for @loanFieldNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get loanFieldNotes;

  /// No description provided for @loanFrequencyMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get loanFrequencyMonthly;

  /// No description provided for @loanFrequencyWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get loanFrequencyWeekly;

  /// No description provided for @loanFrequencyBiweekly.
  ///
  /// In en, this message translates to:
  /// **'Biweekly'**
  String get loanFrequencyBiweekly;

  /// No description provided for @loanProgress.
  ///
  /// In en, this message translates to:
  /// **'{paid} / {total} paid'**
  String loanProgress(int paid, int total);

  /// No description provided for @loanMarkPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark as paid'**
  String get loanMarkPaid;

  /// No description provided for @loanMarkPaidBatch.
  ///
  /// In en, this message translates to:
  /// **'Mark {count} installments as paid'**
  String loanMarkPaidBatch(int count);

  /// No description provided for @loanStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get loanStatusPending;

  /// No description provided for @loanStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get loanStatusPaid;

  /// No description provided for @loanStatusOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get loanStatusOverdue;

  /// No description provided for @loanInstallmentNumber.
  ///
  /// In en, this message translates to:
  /// **'Installment #{number}'**
  String loanInstallmentNumber(int number);

  /// No description provided for @loanDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this loan?'**
  String get loanDeleteConfirmTitle;

  /// No description provided for @loanDeleteConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'All {count} installments will be removed too.'**
  String loanDeleteConfirmBody(int count);

  /// No description provided for @categoryManagerTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoryManagerTitle;

  /// No description provided for @categoryFormTitleNew.
  ///
  /// In en, this message translates to:
  /// **'New category'**
  String get categoryFormTitleNew;

  /// No description provided for @categoryFormTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit category'**
  String get categoryFormTitleEdit;

  /// No description provided for @categoryFieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get categoryFieldName;

  /// No description provided for @categoryFieldNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get categoryFieldNameRequired;

  /// No description provided for @categoryFieldIcon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get categoryFieldIcon;

  /// No description provided for @categoryFieldColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get categoryFieldColor;

  /// No description provided for @categoryDeleteSimpleTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this category?'**
  String get categoryDeleteSimpleTitle;

  /// No description provided for @categoryDeleteSimpleBody.
  ///
  /// In en, this message translates to:
  /// **'This category has no reminders in it.'**
  String get categoryDeleteSimpleBody;

  /// No description provided for @categoryDeleteHasRemindersTitle.
  ///
  /// In en, this message translates to:
  /// **'This category still has reminders'**
  String get categoryDeleteHasRemindersTitle;

  /// No description provided for @categoryDeleteHasRemindersBody.
  ///
  /// In en, this message translates to:
  /// **'{count} reminders use this category. Choose what to do with them.'**
  String categoryDeleteHasRemindersBody(int count);

  /// No description provided for @categoryDeleteReassign.
  ///
  /// In en, this message translates to:
  /// **'Move to another category'**
  String get categoryDeleteReassign;

  /// No description provided for @categoryDeleteReassignTarget.
  ///
  /// In en, this message translates to:
  /// **'Move to'**
  String get categoryDeleteReassignTarget;

  /// No description provided for @categoryDeleteRemoveAll.
  ///
  /// In en, this message translates to:
  /// **'Delete all {count} reminders'**
  String categoryDeleteRemoveAll(int count);

  /// No description provided for @categoryDeleteRemoveAllConfirm.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete {count} reminders. This cannot be undone.'**
  String categoryDeleteRemoveAllConfirm(int count);

  /// No description provided for @categoryReorderHint.
  ///
  /// In en, this message translates to:
  /// **'Drag to reorder'**
  String get categoryReorderHint;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsDefaultReminderTime.
  ///
  /// In en, this message translates to:
  /// **'Default reminder time'**
  String get settingsDefaultReminderTime;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsBackupRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & restore'**
  String get settingsBackupRestore;

  /// No description provided for @settingsExport.
  ///
  /// In en, this message translates to:
  /// **'Export backup'**
  String get settingsExport;

  /// No description provided for @settingsImport.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup'**
  String get settingsImport;

  /// No description provided for @settingsExportLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Saved to Android/data/com.ireminder.ireminder/files/backups'**
  String get settingsExportLocationHint;

  /// No description provided for @settingsExportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup saved'**
  String get settingsExportSuccess;

  /// No description provided for @settingsImportNoneFound.
  ///
  /// In en, this message translates to:
  /// **'No backup files found'**
  String get settingsImportNoneFound;

  /// No description provided for @settingsImportPickFile.
  ///
  /// In en, this message translates to:
  /// **'Choose a backup'**
  String get settingsImportPickFile;

  /// No description provided for @settingsImportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup restored'**
  String get settingsImportSuccess;

  /// No description provided for @settingsImportConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore backup?'**
  String get settingsImportConfirmTitle;

  /// No description provided for @settingsImportConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This replaces all current data with the contents of the backup file.'**
  String get settingsImportConfirmBody;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsBatteryOptimizationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications not firing on time?'**
  String get settingsBatteryOptimizationTitle;

  /// No description provided for @settingsBatteryOptimizationBody.
  ///
  /// In en, this message translates to:
  /// **'Some phone makers (Samsung, Xiaomi, Oppo...) aggressively restrict background apps. Turn off battery optimization for iReminder in your phone\'s Settings > Battery to make sure reminders always arrive on time.'**
  String get settingsBatteryOptimizationBody;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load data.'**
  String get errorLoadFailed;

  /// No description provided for @settingsAiSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get settingsAiSectionTitle;

  /// No description provided for @settingsAiEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable AI Assistant'**
  String get settingsAiEnable;

  /// No description provided for @settingsAiProvider.
  ///
  /// In en, this message translates to:
  /// **'AI provider'**
  String get settingsAiProvider;

  /// No description provided for @settingsAiModel.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get settingsAiModel;

  /// No description provided for @settingsAiApiKey.
  ///
  /// In en, this message translates to:
  /// **'API key'**
  String get settingsAiApiKey;

  /// No description provided for @settingsAiApiKeyHint.
  ///
  /// In en, this message translates to:
  /// **'Paste your API key'**
  String get settingsAiApiKeyHint;

  /// No description provided for @settingsAiApiKeyHelp.
  ///
  /// In en, this message translates to:
  /// **'Where do I get a key?'**
  String get settingsAiApiKeyHelp;

  /// No description provided for @settingsAiApiKeySaved.
  ///
  /// In en, this message translates to:
  /// **'API key saved'**
  String get settingsAiApiKeySaved;

  /// No description provided for @settingsAiAllowedCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories the assistant can read'**
  String get settingsAiAllowedCategories;

  /// No description provided for @settingsAiAllowedCategoriesHint.
  ///
  /// In en, this message translates to:
  /// **'All categories except Finance are shared by default — turn off any you don\'t want the assistant to see.'**
  String get settingsAiAllowedCategoriesHint;

  /// No description provided for @settingsAiClearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear chat history'**
  String get settingsAiClearHistory;

  /// No description provided for @settingsAiClearHistoryConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear chat history?'**
  String get settingsAiClearHistoryConfirmTitle;

  /// No description provided for @settingsAiClearHistoryConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This deletes every question and answer stored on this device. This cannot be undone.'**
  String get settingsAiClearHistoryConfirmBody;

  /// No description provided for @assistantTitle.
  ///
  /// In en, this message translates to:
  /// **'Assistant'**
  String get assistantTitle;

  /// No description provided for @assistantEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask me anything'**
  String get assistantEmptyTitle;

  /// No description provided for @assistantEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Try \"What do I need to do this week?\" or \"How many installments are left on my motorcycle loan?\"'**
  String get assistantEmptyBody;

  /// No description provided for @assistantInputHint.
  ///
  /// In en, this message translates to:
  /// **'Ask something…'**
  String get assistantInputHint;

  /// No description provided for @assistantSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get assistantSend;

  /// No description provided for @assistantDisabledTitle.
  ///
  /// In en, this message translates to:
  /// **'Assistant is turned off'**
  String get assistantDisabledTitle;

  /// No description provided for @assistantDisabledBody.
  ///
  /// In en, this message translates to:
  /// **'Enable it in Settings and pick an AI provider to start chatting.'**
  String get assistantDisabledBody;

  /// No description provided for @assistantOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get assistantOpenSettings;

  /// No description provided for @assistantThinking.
  ///
  /// In en, this message translates to:
  /// **'Thinking…'**
  String get assistantThinking;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get validationRequired;

  /// No description provided for @validationDayOfMonth.
  ///
  /// In en, this message translates to:
  /// **'Enter a day from 1–31'**
  String get validationDayOfMonth;

  /// No description provided for @validationMonth.
  ///
  /// In en, this message translates to:
  /// **'Enter a month from 1–12'**
  String get validationMonth;

  /// No description provided for @validationPositiveNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a number greater than 0'**
  String get validationPositiveNumber;

  /// No description provided for @validationPositiveInteger.
  ///
  /// In en, this message translates to:
  /// **'Enter a whole number greater than 0'**
  String get validationPositiveInteger;

  /// No description provided for @settingsPermissionsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications & Alarms'**
  String get settingsPermissionsSectionTitle;

  /// No description provided for @settingsPermissionsNotificationLabel.
  ///
  /// In en, this message translates to:
  /// **'Notification permission'**
  String get settingsPermissionsNotificationLabel;

  /// No description provided for @settingsPermissionsExactAlarmLabel.
  ///
  /// In en, this message translates to:
  /// **'Exact alarm permission'**
  String get settingsPermissionsExactAlarmLabel;

  /// No description provided for @settingsPermissionsBatteryLabel.
  ///
  /// In en, this message translates to:
  /// **'Ignore battery optimization (recommended)'**
  String get settingsPermissionsBatteryLabel;

  /// No description provided for @settingsTestNotificationAction.
  ///
  /// In en, this message translates to:
  /// **'Test notification (10s)'**
  String get settingsTestNotificationAction;

  /// No description provided for @settingsTestNotificationScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled. Lock your screen or leave the app now and wait about 10 seconds.'**
  String get settingsTestNotificationScheduled;

  /// No description provided for @settingsPermissionsGranted.
  ///
  /// In en, this message translates to:
  /// **'Granted'**
  String get settingsPermissionsGranted;

  /// No description provided for @settingsPermissionsDenied.
  ///
  /// In en, this message translates to:
  /// **'Not granted — reminders may not fire on time'**
  String get settingsPermissionsDenied;

  /// No description provided for @settingsPermissionsGrantAction.
  ///
  /// In en, this message translates to:
  /// **'Grant'**
  String get settingsPermissionsGrantAction;

  /// No description provided for @settingsPermissionsOpenSettingsAction.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get settingsPermissionsOpenSettingsAction;

  /// No description provided for @onboardingExactAlarmRationaleTitle.
  ///
  /// In en, this message translates to:
  /// **'One more permission'**
  String get onboardingExactAlarmRationaleTitle;

  /// No description provided for @onboardingExactAlarmRationaleBody.
  ///
  /// In en, this message translates to:
  /// **'On the next screen, allow iReminder to schedule exact alarms so reminders fire at the exact time you set.'**
  String get onboardingExactAlarmRationaleBody;

  /// No description provided for @loanMarkPaidSuccess.
  ///
  /// In en, this message translates to:
  /// **'Marked as paid'**
  String get loanMarkPaidSuccess;

  /// No description provided for @settingsNotificationPrefsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound & vibration'**
  String get settingsNotificationPrefsTitle;

  /// No description provided for @settingsNotificationSound.
  ///
  /// In en, this message translates to:
  /// **'Notification sound'**
  String get settingsNotificationSound;

  /// No description provided for @settingsNotificationVibration.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get settingsNotificationVibration;

  /// No description provided for @settingsSnoozeDuration.
  ///
  /// In en, this message translates to:
  /// **'Snooze duration'**
  String get settingsSnoozeDuration;

  /// No description provided for @snoozeDuration5Min.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get snoozeDuration5Min;

  /// No description provided for @snoozeDuration10Min.
  ///
  /// In en, this message translates to:
  /// **'10 minutes'**
  String get snoozeDuration10Min;

  /// No description provided for @snoozeDuration15Min.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get snoozeDuration15Min;

  /// No description provided for @snoozeDuration30Min.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get snoozeDuration30Min;

  /// No description provided for @snoozeDuration60Min.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get snoozeDuration60Min;

  /// No description provided for @snoozeDuration120Min.
  ///
  /// In en, this message translates to:
  /// **'2 hours'**
  String get snoozeDuration120Min;

  /// No description provided for @defaultCategoryHomeAppliances.
  ///
  /// In en, this message translates to:
  /// **'Home & Appliances'**
  String get defaultCategoryHomeAppliances;

  /// No description provided for @defaultCategoryVehicles.
  ///
  /// In en, this message translates to:
  /// **'Vehicles'**
  String get defaultCategoryVehicles;

  /// No description provided for @defaultCategoryFamilyEvents.
  ///
  /// In en, this message translates to:
  /// **'Anniversaries & Family'**
  String get defaultCategoryFamilyEvents;

  /// No description provided for @defaultCategoryFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get defaultCategoryFinance;

  /// No description provided for @defaultCategoryWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get defaultCategoryWork;

  /// No description provided for @defaultCategoryFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get defaultCategoryFamily;

  /// No description provided for @defaultCategoryOutdoorEvents.
  ///
  /// In en, this message translates to:
  /// **'Outings & Events'**
  String get defaultCategoryOutdoorEvents;

  /// No description provided for @defaultCategoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get defaultCategoryHealth;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fil',
    'fr',
    'gu',
    'he',
    'hi',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'mr',
    'ms',
    'nl',
    'no',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'no':
      return AppLocalizationsNo();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
