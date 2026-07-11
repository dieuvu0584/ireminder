// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'היום';

  @override
  String get navCalendar => 'לוח שנה';

  @override
  String get navLoans => 'הלוואות';

  @override
  String get navCategories => 'קטגוריות';

  @override
  String get navSettings => 'הגדרות';

  @override
  String get navAssistant => 'עוזר';

  @override
  String get onboardingTitle1 => 'לעולם אל תשכחו את מה שחשוב';

  @override
  String get onboardingBody1 =>
      'עקבו אחר תחזוקת מכשירים, טיפולי רכב, ימי שנה ועוד — הכול במקום אחד.';

  @override
  String get onboardingTitle2 => 'חזרות בקלות';

  @override
  String get onboardingBody2 =>
      'יומי, שבועי, חודשי, שנתי או אפילו לפי הלוח הירחי — הגדירו פעם אחת ו-iReminder ידאג לשאר.';

  @override
  String get onboardingTitle3 => '100% פרטי, 100% אופליין';

  @override
  String get onboardingBody3 =>
      'בלי חשבון, בלי ענן, בלי התחברות. הכול נשאר בטלפון שלכם.';

  @override
  String get onboardingSkip => 'דלג';

  @override
  String get onboardingNext => 'הבא';

  @override
  String get onboardingGetStarted => 'בואו נתחיל';

  @override
  String get notificationPermissionTitle => 'הישארו בזמן';

  @override
  String get notificationPermissionBody =>
      'iReminder זקוקה להרשאה כדי לשלוח לכם התראות כשמשהו עומד לפוג.';

  @override
  String get notificationPermissionAllow => 'אפשר התראות';

  @override
  String get notificationPermissionLater => 'לא עכשיו';

  @override
  String get homeSectionOverdue => 'באיחור';

  @override
  String get homeSectionToday => 'היום';

  @override
  String get homeSectionThisWeek => 'השבוע';

  @override
  String get homeSectionUpcoming => 'בקרוב';

  @override
  String get homeEmptyTitle => 'עדיין אין כאן כלום';

  @override
  String get homeEmptyBody =>
      'הקישו על + כדי להוסיף את התזכורת או הלוואת התשלומים הראשונה שלכם.';

  @override
  String get fabAddReminder => 'תזכורת';

  @override
  String get fabAddLoan => 'הלוואת תשלומים';

  @override
  String get actionDone => 'בוצע';

  @override
  String get actionSnooze => 'דחייה';

  @override
  String get actionEdit => 'עריכה';

  @override
  String get actionDelete => 'מחיקה';

  @override
  String get actionSave => 'שמירה';

  @override
  String get actionCancel => 'ביטול';

  @override
  String get actionConfirm => 'אישור';

  @override
  String get actionYes => 'כן';

  @override
  String get actionNo => 'לא';

  @override
  String get actionOk => 'אישור';

  @override
  String get actionAdd => 'הוספה';

  @override
  String get actionClose => 'סגירה';

  @override
  String get reminderFormTitleNew => 'תזכורת חדשה';

  @override
  String get reminderFormTitleEdit => 'עריכת תזכורת';

  @override
  String get reminderFieldTitle => 'כותרת';

  @override
  String get reminderFieldTitleRequired => 'יש להזין כותרת';

  @override
  String get reminderFieldDescription => 'תיאור (לא חובה)';

  @override
  String get reminderFieldCategory => 'קטגוריה';

  @override
  String get reminderFieldRecurrence => 'חזרה';

  @override
  String get reminderFieldStartDate => 'תאריך התחלה';

  @override
  String get reminderFieldTime => 'שעת תזכורת';

  @override
  String get reminderFieldAdvanceNotice => 'הודע N ימים מראש';

  @override
  String get reminderFieldRecurrenceDay => 'יום בחודש';

  @override
  String get reminderFieldRecurrenceMonth => 'חודש';

  @override
  String get reminderFieldRecurrenceWeekday => 'יום בשבוע';

  @override
  String get reminderFieldIntervalDays => 'כל N ימים';

  @override
  String get reminderFieldLunarDay => 'יום בלוח הירחי';

  @override
  String get reminderFieldLunarMonth => 'חודש בלוח הירחי';

  @override
  String get reminderFieldLunarToggle => 'לוח שנה ירחי';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (ירחי)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'למחוק את התזכורת הזו?';

  @override
  String get reminderDeleteConfirmBody => 'לא ניתן לבטל פעולה זו.';

  @override
  String get recurrenceNone => 'פעם אחת';

  @override
  String get recurrenceDaily => 'יומי';

  @override
  String get recurrenceWeekly => 'שבועי';

  @override
  String get recurrenceMonthly => 'חודשי';

  @override
  String get recurrenceYearly => 'שנתי';

  @override
  String get recurrenceCustomIntervalDays => 'כל N ימים';

  @override
  String get recurrenceLunarYearly => 'שנתי (לוח ירחי)';

  @override
  String get weekdayMonday => 'יום שני';

  @override
  String get weekdayTuesday => 'יום שלישי';

  @override
  String get weekdayWednesday => 'יום רביעי';

  @override
  String get weekdayThursday => 'יום חמישי';

  @override
  String get weekdayFriday => 'יום שישי';

  @override
  String get weekdaySaturday => 'שבת';

  @override
  String get weekdaySunday => 'יום ראשון';

  @override
  String get loanListTitle => 'הלוואות ותשלומים';

  @override
  String get loanFormTitleNew => 'הלוואת תשלומים חדשה';

  @override
  String get loanFormTitleEdit => 'עריכת הלוואה';

  @override
  String get loanFieldName => 'שם';

  @override
  String get loanFieldCategory => 'קטגוריה';

  @override
  String get loanFieldTotalAmount => 'סכום כולל (לא חובה)';

  @override
  String get loanFieldInstallmentAmount => 'סכום לכל תשלום';

  @override
  String get loanFieldTotalInstallments => 'מספר תשלומים';

  @override
  String get loanFieldFrequency => 'תדירות';

  @override
  String get loanFieldDueDayOfMonth => 'יום פירעון בחודש';

  @override
  String get loanFieldStartDate => 'תאריך התחלה';

  @override
  String get loanFieldReminderAdvanceDays => 'הזכר N ימים לפני התשלום';

  @override
  String get loanFieldNotes => 'הערות (לא חובה)';

  @override
  String get loanFrequencyMonthly => 'חודשי';

  @override
  String get loanFrequencyWeekly => 'שבועי';

  @override
  String get loanFrequencyBiweekly => 'דו-שבועי';

  @override
  String loanProgress(int paid, int total) {
    return 'שולמו $paid מתוך $total';
  }

  @override
  String get loanMarkPaid => 'סמן כשולם';

  @override
  String loanMarkPaidBatch(int count) {
    return 'סמן $count תשלומים כשולמו';
  }

  @override
  String get loanStatusPending => 'ממתין';

  @override
  String get loanStatusPaid => 'שולם';

  @override
  String get loanStatusOverdue => 'באיחור';

  @override
  String loanInstallmentNumber(int number) {
    return 'תשלום מס\' $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'למחוק את ההלוואה הזו?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'כל $count התשלומים יימחקו גם הם.';
  }

  @override
  String get categoryManagerTitle => 'קטגוריות';

  @override
  String get categoryFormTitleNew => 'קטגוריה חדשה';

  @override
  String get categoryFormTitleEdit => 'עריכת קטגוריה';

  @override
  String get categoryFieldName => 'שם';

  @override
  String get categoryFieldNameRequired => 'יש להזין שם';

  @override
  String get categoryFieldIcon => 'סמל';

  @override
  String get categoryFieldColor => 'צבע';

  @override
  String get categoryDeleteSimpleTitle => 'למחוק את הקטגוריה הזו?';

  @override
  String get categoryDeleteSimpleBody => 'אין תזכורות בקטגוריה הזו.';

  @override
  String get categoryDeleteHasRemindersTitle => 'עדיין יש תזכורות בקטגוריה הזו';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count תזכורות משתמשות בקטגוריה הזו. בחרו מה לעשות איתן.';
  }

  @override
  String get categoryDeleteReassign => 'העברה לקטגוריה אחרת';

  @override
  String get categoryDeleteReassignTarget => 'העבר אל';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'מחק את כל $count התזכורות';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'פעולה זו תמחק לצמיתות $count תזכורות. לא ניתן לבטל פעולה זו.';
  }

  @override
  String get categoryReorderHint => 'גררו כדי לשנות את הסדר';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get settingsLanguage => 'שפה';

  @override
  String get settingsDefaultReminderTime => 'שעת תזכורת ברירת מחדל';

  @override
  String get settingsTheme => 'ערכת נושא';

  @override
  String get settingsThemeSystem => 'לפי המערכת';

  @override
  String get settingsThemeLight => 'בהיר';

  @override
  String get settingsThemeDark => 'כהה';

  @override
  String get settingsBackupRestore => 'גיבוי ושחזור';

  @override
  String get settingsExport => 'ייצוא גיבוי';

  @override
  String get settingsImport => 'שחזור מגיבוי';

  @override
  String get settingsExportLocationHint =>
      'נשמר בנתיב Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'הגיבוי נשמר';

  @override
  String get settingsImportNoneFound => 'לא נמצאו קובצי גיבוי';

  @override
  String get settingsImportPickFile => 'בחרו גיבוי';

  @override
  String get settingsImportSuccess => 'הגיבוי שוחזר';

  @override
  String get settingsImportConfirmTitle => 'לשחזר את הגיבוי?';

  @override
  String get settingsImportConfirmBody =>
      'פעולה זו תחליף את כל הנתונים הנוכחיים בתוכן קובץ הגיבוי.';

  @override
  String get settingsAbout => 'אודות';

  @override
  String get settingsBatteryOptimizationTitle => 'התראות לא מגיעות בזמן?';

  @override
  String get settingsBatteryOptimizationBody =>
      'חלק מיצרני הטלפונים (סמסונג, שיאומי, אופו...) מגבילים בצורה אגרסיבית אפליקציות הפועלות ברקע. כבו את אופטימיזציית הסוללה עבור iReminder דרך הגדרות > סוללה בטלפון שלכם, כדי לוודא שהתזכורות תמיד מגיעות בזמן.';

  @override
  String get errorGeneric => 'משהו השתבש. נסו שוב.';

  @override
  String get errorLoadFailed => 'לא ניתן היה לטעון את הנתונים.';

  @override
  String get settingsAiSectionTitle => 'עוזר בינה מלאכותית';

  @override
  String get settingsAiEnable => 'הפעל עוזר בינה מלאכותית';

  @override
  String get settingsAiProvider => 'ספק בינה מלאכותית';

  @override
  String get settingsAiModel => 'מודל';

  @override
  String get settingsAiApiKey => 'מפתח API';

  @override
  String get settingsAiApiKeyHint => 'הדביקו כאן את מפתח ה-API שלכם';

  @override
  String get settingsAiApiKeyHelp => 'איפה משיגים מפתח?';

  @override
  String get settingsAiApiKeySaved => 'מפתח ה-API נשמר';

  @override
  String get settingsAiAllowedCategories => 'קטגוריות שהעוזר רשאי לקרוא';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'כל הקטגוריות מלבד כספים משותפות כברירת מחדל — כבה את אלה שלא תרצה שהעוזר יראה.';

  @override
  String get settingsAiClearHistory => 'מחיקת היסטוריית הצ\'אט';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'למחוק את היסטוריית הצ\'אט?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'פעולה זו תמחק את כל השאלות והתשובות השמורות במכשיר זה. לא ניתן לבטל פעולה זו.';

  @override
  String get assistantTitle => 'עוזר';

  @override
  String get assistantEmptyTitle => 'שאלו אותי כל דבר';

  @override
  String get assistantEmptyBody =>
      'נסו לשאול \"מה עליי לעשות השבוע?\" או \"כמה תשלומים נותרו לי בהלוואת האופנוע?\"';

  @override
  String get assistantInputHint => 'שאלו משהו…';

  @override
  String get assistantSend => 'שליחה';

  @override
  String get assistantDisabledTitle => 'העוזר כבוי';

  @override
  String get assistantDisabledBody =>
      'הפעילו אותו בהגדרות ובחרו ספק בינה מלאכותית כדי להתחיל לשוחח.';

  @override
  String get assistantOpenSettings => 'פתח הגדרות';

  @override
  String get assistantThinking => 'חושב…';

  @override
  String get validationRequired => 'שדה חובה';

  @override
  String get validationDayOfMonth => 'הזינו יום בין 1 ל-31';

  @override
  String get validationMonth => 'הזינו חודש בין 1 ל-12';

  @override
  String get validationPositiveNumber => 'הזינו מספר גדול מ-0';

  @override
  String get validationPositiveInteger => 'הזינו מספר שלם גדול מ-0';

  @override
  String get settingsPermissionsSectionTitle => 'התראות ואזעקות';

  @override
  String get settingsPermissionsNotificationLabel => 'הרשאת התראות';

  @override
  String get settingsPermissionsExactAlarmLabel => 'הרשאת אזעקות מדויקות';

  @override
  String get settingsPermissionsBatteryLabel =>
      'התעלם מאופטימיזציית סוללה (מומלץ)';

  @override
  String get settingsPermissionsGranted => 'אושרה';

  @override
  String get settingsPermissionsDenied =>
      'לא אושרה — ייתכן שהתזכורות לא יופיעו בזמן';

  @override
  String get settingsPermissionsGrantAction => 'אשר';

  @override
  String get settingsPermissionsOpenSettingsAction => 'פתח הגדרות';

  @override
  String get onboardingExactAlarmRationaleTitle => 'עוד הרשאה אחת';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'במסך הבא, אפשרו ל-iReminder לתזמן אזעקות מדויקות כדי שהתזכורות יופעלו בדיוק בשעה שקבעתם.';

  @override
  String get loanMarkPaidSuccess => 'סומן כשולם';

  @override
  String get settingsNotificationPrefsTitle => 'צליל ורטט';

  @override
  String get settingsNotificationSound => 'צליל התראה';

  @override
  String get settingsNotificationVibration => 'רטט';

  @override
  String get settingsSnoozeDuration => 'משך נודניק';

  @override
  String get snoozeDuration5Min => '5 דקות';

  @override
  String get snoozeDuration10Min => '10 דקות';

  @override
  String get snoozeDuration15Min => '15 דקות';

  @override
  String get snoozeDuration30Min => '30 דקות';

  @override
  String get snoozeDuration60Min => 'שעה אחת';

  @override
  String get snoozeDuration120Min => 'שעתיים';

  @override
  String get defaultCategoryHomeAppliances => 'בית ומכשירים';

  @override
  String get defaultCategoryVehicles => 'כלי רכב';

  @override
  String get defaultCategoryFamilyEvents => 'ימי שנה ומשפחה';

  @override
  String get defaultCategoryFinance => 'כספים';

  @override
  String get defaultCategoryWork => 'עבודה';

  @override
  String get defaultCategoryFamily => 'משפחה';

  @override
  String get defaultCategoryOutdoorEvents => 'טיולים ואירועים';

  @override
  String get defaultCategoryHealth => 'בריאות';
}
