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
  String get navToday => 'רשימת משימות';

  @override
  String get navCalendar => 'לוח שנה';

  @override
  String get navLoans => 'הלוואות';

  @override
  String get navCategories => 'קטגוריות';

  @override
  String get navSettings => 'הגדרות';

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
  String get permissionCheckTitle => 'בדיקת הרשאות';

  @override
  String get permissionCheckIntro =>
      'ל-iReminder דרושות 3 ההרשאות הללו כדי להתריע לך באופן אמין בדיוק בזמן שנקבע. מתן הרשאת \"התראה מדויקת\" עשוי לפתוח מסך הגדרות מערכת — זה תקין.';

  @override
  String get permissionCheckContinueAction => 'המשך';

  @override
  String get permissionCheckIncompleteTitle => 'ההרשאות אינן שלמות';

  @override
  String get permissionCheckIncompleteBody =>
      'ייתכן שתזכורות לא יופעלו באופן אמין ללא ההרשאות הללו. תוכל להעניק אותן מאוחר יותר דרך ההגדרות, אך קל לשכוח זאת.';

  @override
  String get permissionCheckIncompleteStay => 'חזרה והענקה';

  @override
  String get permissionCheckIncompleteContinue => 'המשך בכל זאת';

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
  String get reminderFieldAdvanceNotice => 'הודע מראש';

  @override
  String get reminderFieldAdvanceNoticeDays => 'ימים';

  @override
  String get reminderFieldAdvanceNoticeHours => 'שעות';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'דקות';

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
  String get reminderFieldDailyExclusionToggle => 'החרגת ימים';

  @override
  String get reminderFieldDailyExclusionKind => 'סוג ההחרגה';

  @override
  String get dailyExclusionKindWeekdays => 'לפי יום בשבוע';

  @override
  String get dailyExclusionKindEvenOdd => 'ימים זוגיים/אי-זוגיים';

  @override
  String get dailyExclusionKindSpecificDay => 'יום מסוים בחודש';

  @override
  String get dailyExclusionEvenDays => 'זוגי';

  @override
  String get dailyExclusionOddDays => 'אי-זוגי';

  @override
  String get reminderFieldDailyExclusionDay => 'יום להחרגה';

  @override
  String get validationDailyExclusionWeekdays =>
      'חובה להשאיר לפחות יום אחד בשבוע';

  @override
  String get validationDailyExclusionSpecificDay =>
      'פורמט לא תקין. השתמשו בפסיקים ומקפים, למשל: 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (ירחי)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'למחוק את התזכורת הזו?';

  @override
  String get reminderDeleteConfirmBody => 'לא ניתן לבטל פעולה זו.';

  @override
  String get reminderScheduleWarning =>
      'התזכורת נשמרה, אך לא ניתן היה לתזמן את ההתראה. בדוק את הגדרות ההתראות.';

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
  String get recurrenceLunarMonthly => 'חודשי (לוח ירחי)';

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
  String get loanFrequencyQuarterly => 'רבעוני';

  @override
  String get loanFrequencySemiAnnually => 'כל 6 חודשים';

  @override
  String get loanFrequencyYearly => 'שנתי';

  @override
  String loanProgress(int paid, int total) {
    return 'שולמו $paid מתוך $total';
  }

  @override
  String get loanMarkPaid => 'סמן כשולם';

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
  String get settingsTestNotificationAction => 'בדיקת התראה (10 שניות)';

  @override
  String get settingsTestNotificationScheduled =>
      'תוזמן. נעל את המסך או צא מהאפליקציה עכשיו והמתן כ-10 שניות.';

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

  @override
  String get defaultCategoryBirthday => 'ימי הולדת';

  @override
  String get defaultCategoryFood => 'אוכל';
}
