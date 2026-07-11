// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'آج';

  @override
  String get navCalendar => 'کیلنڈر';

  @override
  String get navLoans => 'قرضے';

  @override
  String get navCategories => 'زمرہ جات';

  @override
  String get navSettings => 'ترتیبات';

  @override
  String get navAssistant => 'اسسٹنٹ';

  @override
  String get onboardingTitle1 => 'اہم باتیں کبھی نہ بھولیں';

  @override
  String get onboardingBody1 =>
      'ڈیوائس کی دیکھ بھال، گاڑی کی سروس، سالگرہ اور مزید بہت کچھ — سب ایک ہی جگہ پر۔';

  @override
  String get onboardingTitle2 => 'تکرار اب بہت آسان';

  @override
  String get onboardingBody2 =>
      'روزانہ، ہفتہ وار، ماہانہ، سالانہ، یا قمری کیلنڈر کے مطابق بھی — ایک بار سیٹ کریں اور iReminder خود یاد رکھے گا۔';

  @override
  String get onboardingTitle3 => '100% نجی، 100% آف لائن';

  @override
  String get onboardingBody3 =>
      'کوئی اکاؤنٹ نہیں، کوئی کلاؤڈ نہیں، کوئی لاگ ان نہیں۔ سب کچھ آپ کے فون میں ہی رہتا ہے۔';

  @override
  String get onboardingSkip => 'نظر انداز کریں';

  @override
  String get onboardingNext => 'اگلا';

  @override
  String get onboardingGetStarted => 'شروع کریں';

  @override
  String get notificationPermissionTitle => 'وقت پر رہیں';

  @override
  String get notificationPermissionBody =>
      'جب کوئی کام مقررہ وقت پر ہو تو آپ کو بتانے کے لیے iReminder کو اطلاعات بھیجنے کی اجازت درکار ہے۔';

  @override
  String get notificationPermissionAllow => 'اطلاعات کی اجازت دیں';

  @override
  String get notificationPermissionLater => 'ابھی نہیں';

  @override
  String get homeSectionOverdue => 'مقررہ وقت گزر چکا';

  @override
  String get homeSectionToday => 'آج';

  @override
  String get homeSectionThisWeek => 'اس ہفتے';

  @override
  String get homeSectionUpcoming => 'آنے والے';

  @override
  String get homeEmptyTitle => 'ابھی یہاں کچھ نہیں';

  @override
  String get homeEmptyBody =>
      'اپنی پہلی یاد دہانی یا قسطوں والا قرض شامل کرنے کے لیے + پر تھپتھپائیں۔';

  @override
  String get fabAddReminder => 'یاد دہانی';

  @override
  String get fabAddLoan => 'قسطوں کا قرض';

  @override
  String get actionDone => 'مکمل';

  @override
  String get actionSnooze => 'کچھ دیر بعد یاد دلائیں';

  @override
  String get actionEdit => 'ترمیم کریں';

  @override
  String get actionDelete => 'حذف کریں';

  @override
  String get actionSave => 'محفوظ کریں';

  @override
  String get actionCancel => 'منسوخ کریں';

  @override
  String get actionConfirm => 'تصدیق کریں';

  @override
  String get actionYes => 'ہاں';

  @override
  String get actionNo => 'نہیں';

  @override
  String get actionOk => 'ٹھیک ہے';

  @override
  String get actionAdd => 'شامل کریں';

  @override
  String get actionClose => 'بند کریں';

  @override
  String get reminderFormTitleNew => 'نئی یاد دہانی';

  @override
  String get reminderFormTitleEdit => 'یاد دہانی میں ترمیم کریں';

  @override
  String get reminderFieldTitle => 'عنوان';

  @override
  String get reminderFieldTitleRequired => 'عنوان درکار ہے';

  @override
  String get reminderFieldDescription => 'تفصیل (اختیاری)';

  @override
  String get reminderFieldCategory => 'زمرہ';

  @override
  String get reminderFieldRecurrence => 'تکرار';

  @override
  String get reminderFieldStartDate => 'آغاز کی تاریخ';

  @override
  String get reminderFieldTime => 'یاد دہانی کا وقت';

  @override
  String get reminderFieldAdvanceNotice => 'N دن پہلے مطلع کریں';

  @override
  String get reminderFieldRecurrenceDay => 'مہینے کا دن';

  @override
  String get reminderFieldRecurrenceMonth => 'مہینہ';

  @override
  String get reminderFieldRecurrenceWeekday => 'ہفتے کا دن';

  @override
  String get reminderFieldIntervalDays => 'ہر N دن بعد';

  @override
  String get reminderFieldLunarDay => 'قمری دن';

  @override
  String get reminderFieldLunarMonth => 'قمری مہینہ';

  @override
  String get reminderFieldLunarToggle => 'قمری کیلنڈر';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (قمری)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'کیا یہ یاد دہانی حذف کر دیں؟';

  @override
  String get reminderDeleteConfirmBody => 'اسے واپس نہیں لایا جا سکتا۔';

  @override
  String get reminderScheduleWarning =>
      'یاد دہانی محفوظ ہو گئی، لیکن اطلاع شیڈول نہیں ہو سکی۔ اطلاعی ترتیبات چیک کریں۔';

  @override
  String get recurrenceNone => 'ایک بار';

  @override
  String get recurrenceDaily => 'روزانہ';

  @override
  String get recurrenceWeekly => 'ہفتہ وار';

  @override
  String get recurrenceMonthly => 'ماہانہ';

  @override
  String get recurrenceYearly => 'سالانہ';

  @override
  String get recurrenceCustomIntervalDays => 'ہر N دن بعد';

  @override
  String get recurrenceLunarYearly => 'سالانہ (قمری کیلنڈر)';

  @override
  String get weekdayMonday => 'پیر';

  @override
  String get weekdayTuesday => 'منگل';

  @override
  String get weekdayWednesday => 'بدھ';

  @override
  String get weekdayThursday => 'جمعرات';

  @override
  String get weekdayFriday => 'جمعہ';

  @override
  String get weekdaySaturday => 'ہفتہ';

  @override
  String get weekdaySunday => 'اتوار';

  @override
  String get loanListTitle => 'قرضے اور قسطیں';

  @override
  String get loanFormTitleNew => 'نیا قسطوں کا قرض';

  @override
  String get loanFormTitleEdit => 'قرض میں ترمیم کریں';

  @override
  String get loanFieldName => 'نام';

  @override
  String get loanFieldCategory => 'زمرہ';

  @override
  String get loanFieldTotalAmount => 'کل رقم (اختیاری)';

  @override
  String get loanFieldInstallmentAmount => 'ہر قسط کی رقم';

  @override
  String get loanFieldTotalInstallments => 'قسطوں کی تعداد';

  @override
  String get loanFieldFrequency => 'تعدد';

  @override
  String get loanFieldDueDayOfMonth => 'مہینے میں واجب الادا دن';

  @override
  String get loanFieldStartDate => 'آغاز کی تاریخ';

  @override
  String get loanFieldReminderAdvanceDays =>
      'واجب الادا سے N دن پہلے یاد دلائیں';

  @override
  String get loanFieldNotes => 'نوٹس (اختیاری)';

  @override
  String get loanFrequencyMonthly => 'ماہانہ';

  @override
  String get loanFrequencyWeekly => 'ہفتہ وار';

  @override
  String get loanFrequencyBiweekly => 'ہر دو ہفتے بعد';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total قسطیں ادا شدہ';
  }

  @override
  String get loanMarkPaid => 'ادا شدہ کے طور پر نشان زد کریں';

  @override
  String loanMarkPaidBatch(int count) {
    return '$count قسطوں کو ادا شدہ کے طور پر نشان زد کریں';
  }

  @override
  String get loanStatusPending => 'زیر التوا';

  @override
  String get loanStatusPaid => 'ادا شدہ';

  @override
  String get loanStatusOverdue => 'مقررہ وقت گزر چکا';

  @override
  String loanInstallmentNumber(int number) {
    return 'قسط #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'کیا یہ قرض حذف کر دیں؟';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'تمام $count قسطیں بھی حذف ہو جائیں گی۔';
  }

  @override
  String get categoryManagerTitle => 'زمرہ جات';

  @override
  String get categoryFormTitleNew => 'نیا زمرہ';

  @override
  String get categoryFormTitleEdit => 'زمرے میں ترمیم کریں';

  @override
  String get categoryFieldName => 'نام';

  @override
  String get categoryFieldNameRequired => 'نام درکار ہے';

  @override
  String get categoryFieldIcon => 'آئیکن';

  @override
  String get categoryFieldColor => 'رنگ';

  @override
  String get categoryDeleteSimpleTitle => 'کیا یہ زمرہ حذف کر دیں؟';

  @override
  String get categoryDeleteSimpleBody => 'اس زمرے میں کوئی یاد دہانی نہیں ہے۔';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'اس زمرے میں اب بھی یاد دہانیاں موجود ہیں';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count یاد دہانیاں اس زمرے کو استعمال کر رہی ہیں۔ منتخب کریں کہ ان کے ساتھ کیا کیا جائے۔';
  }

  @override
  String get categoryDeleteReassign => 'دوسرے زمرے میں منتقل کریں';

  @override
  String get categoryDeleteReassignTarget => 'منتقل کریں';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'تمام $count یاد دہانیاں حذف کریں';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'اس سے $count یاد دہانیاں مستقل طور پر حذف ہو جائیں گی۔ اسے واپس نہیں لایا جا سکتا۔';
  }

  @override
  String get categoryReorderHint => 'ترتیب بدلنے کے لیے گھسیٹیں';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get settingsDefaultReminderTime => 'طے شدہ یاد دہانی کا وقت';

  @override
  String get settingsTheme => 'تھیم';

  @override
  String get settingsThemeSystem => 'سسٹم کے مطابق';

  @override
  String get settingsThemeLight => 'ہلکا';

  @override
  String get settingsThemeDark => 'گہرا';

  @override
  String get settingsBackupRestore => 'بیک اپ اور بحالی';

  @override
  String get settingsExport => 'بیک اپ برآمد کریں';

  @override
  String get settingsImport => 'بیک اپ سے بحال کریں';

  @override
  String get settingsExportLocationHint =>
      'Android/data/com.ireminder.ireminder/files/backups میں محفوظ کیا گیا';

  @override
  String get settingsExportSuccess => 'بیک اپ محفوظ ہو گیا';

  @override
  String get settingsImportNoneFound => 'کوئی بیک اپ فائل نہیں ملی';

  @override
  String get settingsImportPickFile => 'ایک بیک اپ منتخب کریں';

  @override
  String get settingsImportSuccess => 'بیک اپ بحال ہو گیا';

  @override
  String get settingsImportConfirmTitle => 'کیا بیک اپ بحال کریں؟';

  @override
  String get settingsImportConfirmBody =>
      'اس سے موجودہ تمام ڈیٹا بیک اپ فائل کے مواد سے بدل جائے گا۔';

  @override
  String get settingsAbout => 'ایپ کے بارے میں';

  @override
  String get settingsBatteryOptimizationTitle =>
      'کیا اطلاعات وقت پر موصول نہیں ہو رہیں؟';

  @override
  String get settingsBatteryOptimizationBody =>
      'کچھ فون کمپنیاں (Samsung, Xiaomi, Oppo وغیرہ) بیک گراؤنڈ ایپس پر سختی سے پابندی لگاتی ہیں۔ اطلاعات ہمیشہ وقت پر آئیں اس کے لیے اپنے فون کی Settings > Battery میں جا کر iReminder کے لیے بیٹری آپٹیمائزیشن بند کریں۔';

  @override
  String get errorGeneric => 'کچھ غلط ہو گیا۔ دوبارہ کوشش کریں۔';

  @override
  String get errorLoadFailed => 'ڈیٹا لوڈ نہیں ہو سکا۔';

  @override
  String get settingsAiSectionTitle => 'اے آئی اسسٹنٹ';

  @override
  String get settingsAiEnable => 'اے آئی اسسٹنٹ فعال کریں';

  @override
  String get settingsAiProvider => 'اے آئی فراہم کنندہ';

  @override
  String get settingsAiModel => 'ماڈل';

  @override
  String get settingsAiApiKey => 'API کلید';

  @override
  String get settingsAiApiKeyHint => 'اپنی API کلید پیسٹ کریں';

  @override
  String get settingsAiApiKeyHelp => 'کلید کہاں سے حاصل کروں؟';

  @override
  String get settingsAiApiKeySaved => 'API کلید محفوظ ہو گئی';

  @override
  String get settingsAiAllowedCategories => 'وہ زمرے جنہیں اسسٹنٹ دیکھ سکتا ہے';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'مالیات کے علاوہ تمام زمرے پہلے سے شیئر کیے جاتے ہیں — جنہیں آپ اسسٹنٹ کو نہیں دکھانا چاہتے انہیں بند کر دیں۔';

  @override
  String get settingsAiClearHistory => 'چیٹ کی تاریخ صاف کریں';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'کیا چیٹ کی تاریخ صاف کریں؟';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'اس سے اس ڈیوائس پر محفوظ ہر سوال اور جواب حذف ہو جائے گا۔ اسے واپس نہیں لایا جا سکتا۔';

  @override
  String get assistantTitle => 'اسسٹنٹ';

  @override
  String get assistantEmptyTitle => 'مجھ سے کچھ بھی پوچھیں';

  @override
  String get assistantEmptyBody =>
      'آزمائیں \"اس ہفتے مجھے کیا کرنا ہے؟\" یا \"میرے موٹرسائیکل قرض کی کتنی قسطیں باقی ہیں؟\"';

  @override
  String get assistantInputHint => 'کچھ پوچھیں…';

  @override
  String get assistantSend => 'بھیجیں';

  @override
  String get assistantDisabledTitle => 'اسسٹنٹ بند ہے';

  @override
  String get assistantDisabledBody =>
      'بات چیت شروع کرنے کے لیے ترتیبات میں جا کر اسے فعال کریں اور ایک اے آئی فراہم کنندہ منتخب کریں۔';

  @override
  String get assistantOpenSettings => 'ترتیبات کھولیں';

  @override
  String get assistantThinking => 'سوچ رہا ہے…';

  @override
  String get validationRequired => 'درکار ہے';

  @override
  String get validationDayOfMonth => '1–31 کے درمیان دن درج کریں';

  @override
  String get validationMonth => '1–12 کے درمیان مہینہ درج کریں';

  @override
  String get validationPositiveNumber => '0 سے بڑا نمبر درج کریں';

  @override
  String get validationPositiveInteger => '0 سے بڑا مکمل عدد درج کریں';

  @override
  String get settingsPermissionsSectionTitle => 'اطلاعات اور الارم';

  @override
  String get settingsPermissionsNotificationLabel => 'اطلاعات کی اجازت';

  @override
  String get settingsPermissionsExactAlarmLabel => 'درست وقت کے الارم کی اجازت';

  @override
  String get settingsPermissionsBatteryLabel =>
      'بیٹری آپٹیمائزیشن نظر انداز کریں (تجویز کردہ)';

  @override
  String get settingsTestNotificationAction => 'اطلاع ٹیسٹ کریں (10 سیکنڈ)';

  @override
  String get settingsTestNotificationScheduled =>
      'شیڈول ہو گیا۔ ابھی اپنی اسکرین لاک کریں یا ایپ چھوڑ دیں اور تقریباً 10 سیکنڈ انتظار کریں۔';

  @override
  String get settingsPermissionsGranted => 'دی گئی';

  @override
  String get settingsPermissionsDenied =>
      'نہیں دی گئی — یاد دہانیاں وقت پر نہ آ سکیں';

  @override
  String get settingsPermissionsGrantAction => 'اجازت دیں';

  @override
  String get settingsPermissionsOpenSettingsAction => 'ترتیبات کھولیں';

  @override
  String get onboardingExactAlarmRationaleTitle => 'ایک اور اجازت';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'اگلی اسکرین پر، iReminder کو درست وقت کے الارم شیڈول کرنے کی اجازت دیں تاکہ یاد دہانیاں عین اسی وقت پر آئیں جو آپ نے مقرر کیا ہے۔';

  @override
  String get loanMarkPaidSuccess => 'ادا شدہ کے طور پر نشان زد کر دیا گیا';

  @override
  String get settingsNotificationPrefsTitle => 'آواز اور وائبریشن';

  @override
  String get settingsNotificationSound => 'اطلاع کی آواز';

  @override
  String get settingsNotificationVibration => 'وائبریشن';

  @override
  String get settingsSnoozeDuration => 'اسنوز کا دورانیہ';

  @override
  String get snoozeDuration5Min => '5 منٹ';

  @override
  String get snoozeDuration10Min => '10 منٹ';

  @override
  String get snoozeDuration15Min => '15 منٹ';

  @override
  String get snoozeDuration30Min => '30 منٹ';

  @override
  String get snoozeDuration60Min => '1 گھنٹہ';

  @override
  String get snoozeDuration120Min => '2 گھنٹے';

  @override
  String get defaultCategoryHomeAppliances => 'گھر اور آلات';

  @override
  String get defaultCategoryVehicles => 'گاڑیاں';

  @override
  String get defaultCategoryFamilyEvents => 'سالگرہ اور خاندان';

  @override
  String get defaultCategoryFinance => 'مالیات';

  @override
  String get defaultCategoryWork => 'کام';

  @override
  String get defaultCategoryFamily => 'خاندان';

  @override
  String get defaultCategoryOutdoorEvents => 'سیر و تقریبات';

  @override
  String get defaultCategoryHealth => 'صحت';
}
