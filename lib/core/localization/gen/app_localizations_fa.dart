// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'امروز';

  @override
  String get navCalendar => 'تقویم';

  @override
  String get navLoans => 'وام‌ها';

  @override
  String get navCategories => 'دسته‌بندی‌ها';

  @override
  String get navSettings => 'تنظیمات';

  @override
  String get navAssistant => 'دستیار';

  @override
  String get onboardingTitle1 => 'هرگز چیزهای مهم را فراموش نکنید';

  @override
  String get onboardingBody1 =>
      'نگهداری دستگاه‌ها، سرویس خودرو، سالگردها و موارد دیگر را — همه در یک جا پیگیری کنید.';

  @override
  String get onboardingTitle2 => 'یادآوری‌های تکرارشونده، ساده‌تر از همیشه';

  @override
  String get onboardingBody2 =>
      'روزانه، هفتگی، ماهانه، سالانه یا حتی بر اساس تقویم قمری — فقط یک‌بار تنظیم کنید و iReminder بقیه را به خاطر می‌سپارد.';

  @override
  String get onboardingTitle3 => '۱۰۰٪ خصوصی، ۱۰۰٪ آفلاین';

  @override
  String get onboardingBody3 =>
      'بدون حساب کاربری، بدون فضای ابری، بدون ورود. همه‌چیز فقط روی گوشی شما باقی می‌ماند.';

  @override
  String get onboardingSkip => 'رد کردن';

  @override
  String get onboardingNext => 'بعدی';

  @override
  String get onboardingGetStarted => 'شروع کنید';

  @override
  String get permissionCheckTitle => 'بررسی مجوزها';

  @override
  String get permissionCheckIntro =>
      'iReminder برای اطلاع‌رسانی دقیق در زمان تعیین‌شده به این ۳ مجوز نیاز دارد. اعطای مجوز «زنگ دقیق» ممکن است شما را به صفحه تنظیمات سیستم ببرد — این طبیعی است.';

  @override
  String get permissionCheckContinueAction => 'ادامه';

  @override
  String get permissionCheckIncompleteTitle => 'مجوزها ناقص است';

  @override
  String get permissionCheckIncompleteBody =>
      'بدون این مجوزها ممکن است یادآورها به‌طور قابل‌اعتماد فعال نشوند. می‌توانید بعداً از تنظیمات آن‌ها را بدهید، اما فراموش کردنش آسان است.';

  @override
  String get permissionCheckIncompleteStay => 'بازگشت و اعطای مجوز';

  @override
  String get permissionCheckIncompleteContinue => 'در هر صورت ادامه بده';

  @override
  String get homeSectionOverdue => 'عقب‌افتاده';

  @override
  String get homeSectionToday => 'امروز';

  @override
  String get homeSectionThisWeek => 'این هفته';

  @override
  String get homeSectionUpcoming => 'پیش‌رو';

  @override
  String get homeEmptyTitle => 'هنوز چیزی اینجا نیست';

  @override
  String get homeEmptyBody =>
      'برای افزودن اولین یادآور یا وام قسطی خود، روی + ضربه بزنید.';

  @override
  String get fabAddReminder => 'یادآور';

  @override
  String get fabAddLoan => 'وام قسطی';

  @override
  String get actionDone => 'انجام شد';

  @override
  String get actionSnooze => 'به تعویق انداختن';

  @override
  String get actionEdit => 'ویرایش';

  @override
  String get actionDelete => 'حذف';

  @override
  String get actionSave => 'ذخیره';

  @override
  String get actionCancel => 'انصراف';

  @override
  String get actionConfirm => 'تأیید';

  @override
  String get actionYes => 'بله';

  @override
  String get actionNo => 'خیر';

  @override
  String get actionOk => 'باشه';

  @override
  String get actionAdd => 'افزودن';

  @override
  String get actionClose => 'بستن';

  @override
  String get reminderFormTitleNew => 'یادآور جدید';

  @override
  String get reminderFormTitleEdit => 'ویرایش یادآور';

  @override
  String get reminderFieldTitle => 'عنوان';

  @override
  String get reminderFieldTitleRequired => 'عنوان الزامی است';

  @override
  String get reminderFieldDescription => 'توضیحات (اختیاری)';

  @override
  String get reminderFieldCategory => 'دسته‌بندی';

  @override
  String get reminderFieldRecurrence => 'تکرار';

  @override
  String get reminderFieldStartDate => 'تاریخ شروع';

  @override
  String get reminderFieldTime => 'زمان یادآوری';

  @override
  String get reminderFieldAdvanceNotice => 'از قبل اطلاع بده';

  @override
  String get reminderFieldAdvanceNoticeDays => 'روز';

  @override
  String get reminderFieldAdvanceNoticeHours => 'ساعت';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'دقیقه';

  @override
  String get reminderFieldRecurrenceDay => 'روز ماه';

  @override
  String get reminderFieldRecurrenceMonth => 'ماه';

  @override
  String get reminderFieldRecurrenceWeekday => 'روز هفته';

  @override
  String get reminderFieldIntervalDays => 'هر N روز';

  @override
  String get reminderFieldLunarDay => 'روز قمری';

  @override
  String get reminderFieldLunarMonth => 'ماه قمری';

  @override
  String get reminderFieldLunarToggle => 'تقویم قمری';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (قمری)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'این یادآور حذف شود؟';

  @override
  String get reminderDeleteConfirmBody => 'این کار قابل بازگشت نیست.';

  @override
  String get reminderCompletedFeedback => 'به‌عنوان انجام‌شده علامت‌گذاری شد';

  @override
  String get reminderScheduleWarning =>
      'یادآور ذخیره شد، اما اعلان زمان‌بندی نشد. تنظیمات اعلان را بررسی کنید.';

  @override
  String get recurrenceNone => 'یک‌بار';

  @override
  String get recurrenceDaily => 'روزانه';

  @override
  String get recurrenceWeekly => 'هفتگی';

  @override
  String get recurrenceMonthly => 'ماهانه';

  @override
  String get recurrenceYearly => 'سالانه';

  @override
  String get recurrenceCustomIntervalDays => 'هر N روز';

  @override
  String get recurrenceLunarYearly => 'سالانه (تقویم قمری)';

  @override
  String get weekdayMonday => 'دوشنبه';

  @override
  String get weekdayTuesday => 'سه‌شنبه';

  @override
  String get weekdayWednesday => 'چهارشنبه';

  @override
  String get weekdayThursday => 'پنجشنبه';

  @override
  String get weekdayFriday => 'جمعه';

  @override
  String get weekdaySaturday => 'شنبه';

  @override
  String get weekdaySunday => 'یکشنبه';

  @override
  String get loanListTitle => 'وام‌ها و اقساط';

  @override
  String get loanFormTitleNew => 'وام قسطی جدید';

  @override
  String get loanFormTitleEdit => 'ویرایش وام';

  @override
  String get loanFieldName => 'نام';

  @override
  String get loanFieldCategory => 'دسته‌بندی';

  @override
  String get loanFieldTotalAmount => 'مبلغ کل (اختیاری)';

  @override
  String get loanFieldInstallmentAmount => 'مبلغ هر قسط';

  @override
  String get loanFieldTotalInstallments => 'تعداد اقساط';

  @override
  String get loanFieldFrequency => 'تناوب';

  @override
  String get loanFieldDueDayOfMonth => 'روز سررسید در ماه';

  @override
  String get loanFieldStartDate => 'تاریخ شروع';

  @override
  String get loanFieldReminderAdvanceDays => 'N روز قبل از سررسید یادآوری کن';

  @override
  String get loanFieldNotes => 'یادداشت (اختیاری)';

  @override
  String get loanFrequencyMonthly => 'ماهانه';

  @override
  String get loanFrequencyWeekly => 'هفتگی';

  @override
  String get loanFrequencyBiweekly => 'هر دو هفته';

  @override
  String loanProgress(int paid, int total) {
    return '$paid از $total قسط پرداخت شده';
  }

  @override
  String get loanMarkPaid => 'علامت‌گذاری به‌عنوان پرداخت‌شده';

  @override
  String loanMarkPaidBatch(int count) {
    return 'علامت‌گذاری $count قسط به‌عنوان پرداخت‌شده';
  }

  @override
  String get loanStatusPending => 'در انتظار';

  @override
  String get loanStatusPaid => 'پرداخت‌شده';

  @override
  String get loanStatusOverdue => 'عقب‌افتاده';

  @override
  String loanInstallmentNumber(int number) {
    return 'قسط #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'این وام حذف شود؟';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'تمام $count قسط نیز حذف خواهند شد.';
  }

  @override
  String get categoryManagerTitle => 'دسته‌بندی‌ها';

  @override
  String get categoryFormTitleNew => 'دسته‌بندی جدید';

  @override
  String get categoryFormTitleEdit => 'ویرایش دسته‌بندی';

  @override
  String get categoryFieldName => 'نام';

  @override
  String get categoryFieldNameRequired => 'نام الزامی است';

  @override
  String get categoryFieldIcon => 'آیکون';

  @override
  String get categoryFieldColor => 'رنگ';

  @override
  String get categoryDeleteSimpleTitle => 'این دسته‌بندی حذف شود؟';

  @override
  String get categoryDeleteSimpleBody => 'این دسته‌بندی هیچ یادآوری ندارد.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'این دسته‌بندی هنوز یادآور دارد';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count یادآور از این دسته‌بندی استفاده می‌کنند. نحوه برخورد با آن‌ها را انتخاب کنید.';
  }

  @override
  String get categoryDeleteReassign => 'انتقال به دسته‌بندی دیگر';

  @override
  String get categoryDeleteReassignTarget => 'انتقال به';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'حذف همه $count یادآور';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'این کار $count یادآور را برای همیشه حذف می‌کند. این کار قابل بازگشت نیست.';
  }

  @override
  String get categoryReorderHint => 'برای تغییر ترتیب بکشید';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get settingsDefaultReminderTime => 'زمان پیش‌فرض یادآوری';

  @override
  String get settingsTheme => 'پوسته';

  @override
  String get settingsThemeSystem => 'سیستم';

  @override
  String get settingsThemeLight => 'روشن';

  @override
  String get settingsThemeDark => 'تیره';

  @override
  String get settingsBackupRestore => 'پشتیبان‌گیری و بازیابی';

  @override
  String get settingsExport => 'خروجی گرفتن از پشتیبان';

  @override
  String get settingsImport => 'بازیابی از پشتیبان';

  @override
  String get settingsExportLocationHint =>
      'در مسیر Android/data/com.ireminder.ireminder/files/backups ذخیره شد';

  @override
  String get settingsExportSuccess => 'فایل پشتیبان ذخیره شد';

  @override
  String get settingsImportNoneFound => 'هیچ فایل پشتیبانی یافت نشد';

  @override
  String get settingsImportPickFile => 'یک فایل پشتیبان انتخاب کنید';

  @override
  String get settingsImportSuccess => 'بازیابی با موفقیت انجام شد';

  @override
  String get settingsImportConfirmTitle => 'پشتیبان بازیابی شود؟';

  @override
  String get settingsImportConfirmBody =>
      'این کار همه داده‌های فعلی را با محتوای فایل پشتیبان جایگزین می‌کند.';

  @override
  String get settingsAbout => 'درباره برنامه';

  @override
  String get settingsBatteryOptimizationTitle => 'اعلان‌ها به‌موقع نمی‌رسند؟';

  @override
  String get settingsBatteryOptimizationBody =>
      'برخی سازندگان گوشی (سامسونگ، شیائومی، اوپو و ...) برنامه‌های پس‌زمینه را به‌شدت محدود می‌کنند. برای اطمینان از رسیدن به‌موقع یادآورها، از مسیر تنظیمات گوشی > باتری، بهینه‌سازی باتری را برای iReminder غیرفعال کنید.';

  @override
  String get errorGeneric => 'خطایی رخ داد. لطفاً دوباره تلاش کنید.';

  @override
  String get errorLoadFailed => 'بارگذاری اطلاعات ممکن نشد.';

  @override
  String get settingsAiSectionTitle => 'دستیار هوش مصنوعی';

  @override
  String get settingsAiEnable => 'فعال‌سازی دستیار هوش مصنوعی';

  @override
  String get settingsAiProvider => 'ارائه‌دهنده هوش مصنوعی';

  @override
  String get settingsAiModel => 'مدل';

  @override
  String get settingsAiApiKey => 'کلید API';

  @override
  String get settingsAiApiKeyHint => 'کلید API خود را جای‌گذاری کنید';

  @override
  String get settingsAiApiKeyHelp => 'کلید را از کجا بگیرم؟';

  @override
  String get settingsAiApiKeySaved => 'کلید API ذخیره شد';

  @override
  String get settingsAiAllowedCategories =>
      'دسته‌بندی‌هایی که دستیار می‌تواند ببیند';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'همه دسته‌ها به‌جز امور مالی به‌طور پیش‌فرض به اشتراک گذاشته می‌شوند — هرکدام را که نمی‌خواهید دستیار ببیند خاموش کنید.';

  @override
  String get settingsAiClearHistory => 'پاک کردن تاریخچه گفتگو';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'تاریخچه گفتگو پاک شود؟';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'این کار همه سؤال‌ها و پاسخ‌های ذخیره‌شده روی این دستگاه را حذف می‌کند. این کار قابل بازگشت نیست.';

  @override
  String get assistantTitle => 'دستیار';

  @override
  String get assistantEmptyTitle => 'هر چیزی می‌خواهید بپرسید';

  @override
  String get assistantEmptyBody =>
      'امتحان کنید: «این هفته چه کارهایی باید انجام دهم؟» یا «چند قسط از وام موتورسیکلتم باقی مانده؟»';

  @override
  String get assistantInputHint => 'چیزی بپرسید…';

  @override
  String get assistantSend => 'ارسال';

  @override
  String get assistantDisabledTitle => 'دستیار غیرفعال است';

  @override
  String get assistantDisabledBody =>
      'برای شروع گفتگو، آن را در تنظیمات فعال کنید و یک ارائه‌دهنده هوش مصنوعی انتخاب کنید.';

  @override
  String get assistantOpenSettings => 'باز کردن تنظیمات';

  @override
  String get assistantThinking => 'در حال فکر کردن…';

  @override
  String get validationRequired => 'الزامی است';

  @override
  String get validationDayOfMonth => 'روزی بین ۱ تا ۳۱ وارد کنید';

  @override
  String get validationMonth => 'ماهی بین ۱ تا ۱۲ وارد کنید';

  @override
  String get validationPositiveNumber => 'عددی بزرگ‌تر از ۰ وارد کنید';

  @override
  String get validationPositiveInteger => 'عدد صحیحی بزرگ‌تر از ۰ وارد کنید';

  @override
  String get settingsPermissionsSectionTitle => 'اعلان‌ها و زنگ‌های هشدار';

  @override
  String get settingsPermissionsNotificationLabel => 'مجوز اعلان';

  @override
  String get settingsPermissionsExactAlarmLabel => 'مجوز زنگ هشدار دقیق';

  @override
  String get settingsPermissionsBatteryLabel =>
      'نادیده گرفتن بهینه‌سازی باتری (توصیه‌شده)';

  @override
  String get settingsTestNotificationAction => 'آزمایش اعلان (۱۰ ثانیه)';

  @override
  String get settingsTestNotificationScheduled =>
      'زمان‌بندی شد. اکنون صفحه را قفل کنید یا از برنامه خارج شوید و حدود ۱۰ ثانیه صبر کنید.';

  @override
  String get settingsPermissionsGranted => 'اعطا شده';

  @override
  String get settingsPermissionsDenied =>
      'اعطا نشده — ممکن است یادآورها به‌موقع فعال نشوند';

  @override
  String get settingsPermissionsGrantAction => 'اعطای مجوز';

  @override
  String get settingsPermissionsOpenSettingsAction => 'باز کردن تنظیمات';

  @override
  String get loanMarkPaidSuccess => 'به‌عنوان پرداخت‌شده علامت‌گذاری شد';

  @override
  String get settingsNotificationPrefsTitle => 'صدا و لرزش';

  @override
  String get settingsNotificationSound => 'صدای اعلان';

  @override
  String get settingsNotificationVibration => 'لرزش';

  @override
  String get settingsSnoozeDuration => 'مدت زمان تعویق';

  @override
  String get snoozeDuration5Min => '۵ دقیقه';

  @override
  String get snoozeDuration10Min => '۱۰ دقیقه';

  @override
  String get snoozeDuration15Min => '۱۵ دقیقه';

  @override
  String get snoozeDuration30Min => '۳۰ دقیقه';

  @override
  String get snoozeDuration60Min => '۱ ساعت';

  @override
  String get snoozeDuration120Min => '۲ ساعت';

  @override
  String get defaultCategoryHomeAppliances => 'خانه و لوازم';

  @override
  String get defaultCategoryVehicles => 'وسایل نقلیه';

  @override
  String get defaultCategoryFamilyEvents => 'سالگرد و خانواده';

  @override
  String get defaultCategoryFinance => 'امور مالی';

  @override
  String get defaultCategoryWork => 'کار';

  @override
  String get defaultCategoryFamily => 'خانواده';

  @override
  String get defaultCategoryOutdoorEvents => 'گردش‌ها و رویدادها';

  @override
  String get defaultCategoryHealth => 'سلامتی';

  @override
  String get defaultCategoryBirthday => 'تولدها';
}
