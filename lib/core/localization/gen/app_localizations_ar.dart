// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'اليوم';

  @override
  String get navCalendar => 'التقويم';

  @override
  String get navLoans => 'الأقساط';

  @override
  String get navCategories => 'الفئات';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get onboardingTitle1 => 'لا تنسَ أبدًا ما يهمك';

  @override
  String get onboardingBody1 =>
      'تابع صيانة الأجهزة وخدمة السيارة والمناسبات وغيرها الكثير — كل ذلك في مكان واحد.';

  @override
  String get onboardingTitle2 => 'التكرار أصبح أسهل';

  @override
  String get onboardingBody2 =>
      'يوميًا أو أسبوعيًا أو شهريًا أو سنويًا، أو حتى وفق التقويم القمري — اضبطه مرة واحدة وسيتذكره iReminder دائمًا.';

  @override
  String get onboardingTitle3 => 'خصوصية كاملة وعمل بلا إنترنت';

  @override
  String get onboardingBody3 =>
      'بدون حساب، بدون سحابة، بدون تسجيل دخول. كل شيء يبقى على هاتفك فقط.';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingGetStarted => 'ابدأ الآن';

  @override
  String get permissionCheckTitle => 'التحقق من الأذونات';

  @override
  String get permissionCheckIntro =>
      'يحتاج iReminder إلى هذه الأذونات الثلاثة لتنبيهك بشكل موثوق في الوقت المحدد بالضبط. قد يؤدي منح إذن \"المنبه الدقيق\" إلى فتح شاشة إعدادات النظام — وهذا أمر متوقع.';

  @override
  String get permissionCheckContinueAction => 'متابعة';

  @override
  String get permissionCheckIncompleteTitle => 'الأذونات غير مكتملة';

  @override
  String get permissionCheckIncompleteBody =>
      'قد لا تعمل التذكيرات بشكل موثوق دون هذه الأذونات. يمكنك منحها لاحقًا من الإعدادات، لكن من السهل نسيان ذلك.';

  @override
  String get permissionCheckIncompleteStay => 'الرجوع والمنح';

  @override
  String get permissionCheckIncompleteContinue => 'المتابعة على أي حال';

  @override
  String get homeSectionOverdue => 'متأخر';

  @override
  String get homeSectionToday => 'اليوم';

  @override
  String get homeSectionThisWeek => 'هذا الأسبوع';

  @override
  String get homeSectionUpcoming => 'قادم';

  @override
  String get homeEmptyTitle => 'لا يوجد شيء هنا بعد';

  @override
  String get homeEmptyBody => 'اضغط على + لإضافة أول تذكير أو قسط لديك.';

  @override
  String get fabAddReminder => 'تذكير';

  @override
  String get fabAddLoan => 'قسط';

  @override
  String get actionDone => 'تم';

  @override
  String get actionSnooze => 'تأجيل';

  @override
  String get actionEdit => 'تعديل';

  @override
  String get actionDelete => 'حذف';

  @override
  String get actionSave => 'حفظ';

  @override
  String get actionCancel => 'إلغاء';

  @override
  String get actionConfirm => 'تأكيد';

  @override
  String get actionYes => 'نعم';

  @override
  String get actionNo => 'لا';

  @override
  String get actionOk => 'موافق';

  @override
  String get actionAdd => 'إضافة';

  @override
  String get actionClose => 'إغلاق';

  @override
  String get reminderFormTitleNew => 'تذكير جديد';

  @override
  String get reminderFormTitleEdit => 'تعديل التذكير';

  @override
  String get reminderFieldTitle => 'العنوان';

  @override
  String get reminderFieldTitleRequired => 'العنوان مطلوب';

  @override
  String get reminderFieldDescription => 'الوصف (اختياري)';

  @override
  String get reminderFieldCategory => 'الفئة';

  @override
  String get reminderFieldRecurrence => 'التكرار';

  @override
  String get reminderFieldStartDate => 'تاريخ البدء';

  @override
  String get reminderFieldTime => 'وقت التذكير';

  @override
  String get reminderFieldAdvanceNotice => 'التنبيه مسبقًا';

  @override
  String get reminderFieldAdvanceNoticeDays => 'أيام';

  @override
  String get reminderFieldAdvanceNoticeHours => 'ساعات';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'دقائق';

  @override
  String get reminderFieldRecurrenceDay => 'يوم الشهر';

  @override
  String get reminderFieldRecurrenceMonth => 'الشهر';

  @override
  String get reminderFieldRecurrenceWeekday => 'يوم الأسبوع';

  @override
  String get reminderFieldIntervalDays => 'كل N يوم';

  @override
  String get reminderFieldLunarDay => 'اليوم القمري';

  @override
  String get reminderFieldLunarMonth => 'الشهر القمري';

  @override
  String get reminderFieldLunarToggle => 'التقويم القمري';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (قمري)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'هل تريد حذف هذا التذكير؟';

  @override
  String get reminderDeleteConfirmBody => 'لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get reminderCompletedFeedback => 'تم وضع علامة كمكتمل';

  @override
  String get reminderScheduleWarning =>
      'تم حفظ التذكير، لكن تعذر جدولة الإشعار. تحقق من إعدادات الإشعارات.';

  @override
  String get recurrenceNone => 'مرة واحدة';

  @override
  String get recurrenceDaily => 'يوميًا';

  @override
  String get recurrenceWeekly => 'أسبوعيًا';

  @override
  String get recurrenceMonthly => 'شهريًا';

  @override
  String get recurrenceYearly => 'سنويًا';

  @override
  String get recurrenceCustomIntervalDays => 'كل N يوم';

  @override
  String get recurrenceLunarYearly => 'سنويًا (تقويم قمري)';

  @override
  String get weekdayMonday => 'الاثنين';

  @override
  String get weekdayTuesday => 'الثلاثاء';

  @override
  String get weekdayWednesday => 'الأربعاء';

  @override
  String get weekdayThursday => 'الخميس';

  @override
  String get weekdayFriday => 'الجمعة';

  @override
  String get weekdaySaturday => 'السبت';

  @override
  String get weekdaySunday => 'الأحد';

  @override
  String get loanListTitle => 'القروض والأقساط';

  @override
  String get loanFormTitleNew => 'قسط جديد';

  @override
  String get loanFormTitleEdit => 'تعديل القسط';

  @override
  String get loanFieldName => 'الاسم';

  @override
  String get loanFieldCategory => 'الفئة';

  @override
  String get loanFieldTotalAmount => 'المبلغ الإجمالي (اختياري)';

  @override
  String get loanFieldInstallmentAmount => 'مبلغ كل قسط';

  @override
  String get loanFieldTotalInstallments => 'عدد الأقساط';

  @override
  String get loanFieldFrequency => 'التكرار';

  @override
  String get loanFieldDueDayOfMonth => 'يوم الاستحقاق من الشهر';

  @override
  String get loanFieldStartDate => 'تاريخ البدء';

  @override
  String get loanFieldReminderAdvanceDays => 'التذكير قبل N يوم من الاستحقاق';

  @override
  String get loanFieldNotes => 'ملاحظات (اختياري)';

  @override
  String get loanFrequencyMonthly => 'شهريًا';

  @override
  String get loanFrequencyWeekly => 'أسبوعيًا';

  @override
  String get loanFrequencyBiweekly => 'كل أسبوعين';

  @override
  String loanProgress(int paid, int total) {
    return 'تم دفع $paid من $total';
  }

  @override
  String get loanMarkPaid => 'تحديد كمدفوع';

  @override
  String loanMarkPaidBatch(int count) {
    return 'تحديد $count قسطًا كمدفوعة';
  }

  @override
  String get loanStatusPending => 'قيد الانتظار';

  @override
  String get loanStatusPaid => 'مدفوع';

  @override
  String get loanStatusOverdue => 'متأخر';

  @override
  String loanInstallmentNumber(int number) {
    return 'القسط رقم $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'هل تريد حذف هذا القسط؟';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'سيتم حذف جميع الأقساط الـ $count أيضًا.';
  }

  @override
  String get categoryManagerTitle => 'الفئات';

  @override
  String get categoryFormTitleNew => 'فئة جديدة';

  @override
  String get categoryFormTitleEdit => 'تعديل الفئة';

  @override
  String get categoryFieldName => 'الاسم';

  @override
  String get categoryFieldNameRequired => 'الاسم مطلوب';

  @override
  String get categoryFieldIcon => 'الأيقونة';

  @override
  String get categoryFieldColor => 'اللون';

  @override
  String get categoryDeleteSimpleTitle => 'هل تريد حذف هذه الفئة؟';

  @override
  String get categoryDeleteSimpleBody => 'لا تحتوي هذه الفئة على أي تذكيرات.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'لا تزال هذه الفئة تحتوي على تذكيرات';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return 'يستخدم $count تذكيرًا هذه الفئة. اختر كيف تريد التعامل معها.';
  }

  @override
  String get categoryDeleteReassign => 'نقل إلى فئة أخرى';

  @override
  String get categoryDeleteReassignTarget => 'نقل إلى';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'حذف جميع الـ $count تذكيرًا';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'سيؤدي هذا إلى حذف $count تذكيرًا نهائيًا. لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get categoryReorderHint => 'اسحب لإعادة الترتيب';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsDefaultReminderTime => 'وقت التذكير الافتراضي';

  @override
  String get settingsTheme => 'المظهر';

  @override
  String get settingsThemeSystem => 'حسب النظام';

  @override
  String get settingsThemeLight => 'فاتح';

  @override
  String get settingsThemeDark => 'داكن';

  @override
  String get settingsBackupRestore => 'النسخ الاحتياطي والاستعادة';

  @override
  String get settingsExport => 'تصدير نسخة احتياطية';

  @override
  String get settingsImport => 'استعادة من نسخة احتياطية';

  @override
  String get settingsExportLocationHint =>
      'يتم الحفظ في Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'تم حفظ النسخة الاحتياطية';

  @override
  String get settingsImportNoneFound => 'لم يتم العثور على ملفات نسخ احتياطي';

  @override
  String get settingsImportPickFile => 'اختيار نسخة احتياطية';

  @override
  String get settingsImportSuccess => 'تمت استعادة النسخة الاحتياطية';

  @override
  String get settingsImportConfirmTitle => 'هل تريد استعادة النسخة الاحتياطية؟';

  @override
  String get settingsImportConfirmBody =>
      'سيؤدي هذا إلى استبدال جميع البيانات الحالية بمحتوى ملف النسخة الاحتياطية.';

  @override
  String get settingsAbout => 'حول التطبيق';

  @override
  String get settingsBatteryOptimizationTitle =>
      'هل تصل الإشعارات في غير موعدها؟';

  @override
  String get settingsBatteryOptimizationBody =>
      'بعض الشركات المصنّعة (سامسونج، شاومي، أوبو...) تقيّد بشدة تشغيل التطبيقات في الخلفية. أوقف تحسين البطارية لتطبيق iReminder من إعدادات هاتفك > البطارية للتأكد من وصول التذكيرات دائمًا في وقتها.';

  @override
  String get errorGeneric => 'حدث خطأ ما. يُرجى المحاولة مرة أخرى.';

  @override
  String get errorLoadFailed => 'تعذّر تحميل البيانات.';

  @override
  String get validationRequired => 'هذا الحقل مطلوب';

  @override
  String get validationDayOfMonth => 'أدخل يومًا من 1 إلى 31';

  @override
  String get validationMonth => 'أدخل شهرًا من 1 إلى 12';

  @override
  String get validationPositiveNumber => 'أدخل رقمًا أكبر من 0';

  @override
  String get validationPositiveInteger => 'أدخل عددًا صحيحًا أكبر من 0';

  @override
  String get settingsPermissionsSectionTitle => 'الإشعارات والمنبّهات';

  @override
  String get settingsPermissionsNotificationLabel => 'إذن الإشعارات';

  @override
  String get settingsPermissionsExactAlarmLabel => 'إذن المنبّهات الدقيقة';

  @override
  String get settingsPermissionsBatteryLabel =>
      'تجاهل تحسين البطارية (موصى به)';

  @override
  String get settingsTestNotificationAction => 'اختبار الإشعار (10 ثوانٍ)';

  @override
  String get settingsTestNotificationScheduled =>
      'تمت الجدولة. أغلق الشاشة أو غادر التطبيق الآن وانتظر حوالي 10 ثوانٍ.';

  @override
  String get settingsPermissionsGranted => 'ممنوح';

  @override
  String get settingsPermissionsDenied =>
      'غير ممنوح — قد لا تصل التذكيرات في وقتها';

  @override
  String get settingsPermissionsGrantAction => 'منح الإذن';

  @override
  String get settingsPermissionsOpenSettingsAction => 'فتح الإعدادات';

  @override
  String get loanMarkPaidSuccess => 'تم التحديد كمدفوع';

  @override
  String get settingsNotificationPrefsTitle => 'الصوت والاهتزاز';

  @override
  String get settingsNotificationSound => 'صوت الإشعار';

  @override
  String get settingsNotificationVibration => 'الاهتزاز';

  @override
  String get settingsSnoozeDuration => 'مدة الغفوة';

  @override
  String get snoozeDuration5Min => '5 دقائق';

  @override
  String get snoozeDuration10Min => '10 دقائق';

  @override
  String get snoozeDuration15Min => '15 دقيقة';

  @override
  String get snoozeDuration30Min => '30 دقيقة';

  @override
  String get snoozeDuration60Min => 'ساعة واحدة';

  @override
  String get snoozeDuration120Min => 'ساعتان';

  @override
  String get defaultCategoryHomeAppliances => 'المنزل والأجهزة';

  @override
  String get defaultCategoryVehicles => 'المركبات';

  @override
  String get defaultCategoryFamilyEvents => 'الذكرى السنوية والعائلة';

  @override
  String get defaultCategoryFinance => 'المالية';

  @override
  String get defaultCategoryWork => 'العمل';

  @override
  String get defaultCategoryFamily => 'العائلة';

  @override
  String get defaultCategoryOutdoorEvents => 'النزهات والفعاليات';

  @override
  String get defaultCategoryHealth => 'الصحة';

  @override
  String get defaultCategoryBirthday => 'أعياد الميلاد';
}
