// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'कार्य सूची';

  @override
  String get navCalendar => 'कैलेंडर';

  @override
  String get navLoans => 'किस्तें';

  @override
  String get navCategories => 'श्रेणियाँ';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get onboardingTitle1 => 'ज़रूरी काम कभी न भूलें';

  @override
  String get onboardingBody1 =>
      'डिवाइस मेंटेनेंस, वाहन सर्विसिंग, सालगिरह और भी बहुत कुछ — सब एक ही जगह।';

  @override
  String get onboardingTitle2 => 'दोहराव अब आसान';

  @override
  String get onboardingBody2 =>
      'रोज़, हफ़्ते में, महीने में, साल में, या चंद्र कैलेंडर के अनुसार भी — एक बार सेट करें, iReminder बाकी संभाल लेगा।';

  @override
  String get onboardingTitle3 => '100% निजी, 100% ऑफ़लाइन';

  @override
  String get onboardingBody3 =>
      'कोई अकाउंट नहीं, कोई क्लाउड नहीं, कोई लॉगिन नहीं। सारा डेटा सिर्फ़ आपके फ़ोन में रहता है।';

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingNext => 'आगे';

  @override
  String get onboardingGetStarted => 'शुरू करें';

  @override
  String get permissionCheckTitle => 'अनुमतियां जांचें';

  @override
  String get permissionCheckIntro =>
      'समय पर सूचित करने के लिए iReminder को ये 3 अनुमतियां चाहिए। \"सटीक अलार्म\" देने पर सिस्टम सेटिंग्स स्क्रीन खुल सकती है — यह सामान्य है।';

  @override
  String get permissionCheckContinueAction => 'जारी रखें';

  @override
  String get permissionCheckIncompleteTitle => 'अनुमतियां अधूरी हैं';

  @override
  String get permissionCheckIncompleteBody =>
      'इन अनुमतियों के बिना रिमाइंडर सही तरीके से काम नहीं कर सकते। आप बाद में सेटिंग्स से दे सकते हैं, पर भूलना आसान है।';

  @override
  String get permissionCheckIncompleteStay => 'वापस जाकर अनुमति दें';

  @override
  String get permissionCheckIncompleteContinue => 'फिर भी जारी रखें';

  @override
  String get homeSectionOverdue => 'समय निकल गया';

  @override
  String get homeSectionToday => 'आज';

  @override
  String get homeSectionThisWeek => 'इस हफ़्ते';

  @override
  String get homeSectionUpcoming => 'आने वाले';

  @override
  String get homeEmptyTitle => 'अभी कुछ नहीं है';

  @override
  String get homeEmptyBody =>
      'अपना पहला रिमाइंडर या किस्त जोड़ने के लिए + दबाएं।';

  @override
  String get fabAddReminder => 'रिमाइंडर';

  @override
  String get fabAddLoan => 'किस्त योजना';

  @override
  String get actionDone => 'पूर्ण';

  @override
  String get actionSnooze => 'बाद में याद दिलाएं';

  @override
  String get actionEdit => 'संपादित करें';

  @override
  String get actionDelete => 'हटाएं';

  @override
  String get actionSave => 'सहेजें';

  @override
  String get actionCancel => 'रद्द करें';

  @override
  String get actionConfirm => 'पुष्टि करें';

  @override
  String get actionYes => 'हाँ';

  @override
  String get actionNo => 'नहीं';

  @override
  String get actionOk => 'ठीक है';

  @override
  String get actionAdd => 'जोड़ें';

  @override
  String get actionClose => 'बंद करें';

  @override
  String get reminderFormTitleNew => 'नया रिमाइंडर';

  @override
  String get reminderFormTitleEdit => 'रिमाइंडर संपादित करें';

  @override
  String get reminderFieldTitle => 'शीर्षक';

  @override
  String get reminderFieldTitleRequired => 'शीर्षक आवश्यक है';

  @override
  String get reminderFieldDescription => 'विवरण (वैकल्पिक)';

  @override
  String get reminderFieldCategory => 'श्रेणी';

  @override
  String get reminderFieldRecurrence => 'दोहराव';

  @override
  String get reminderFieldStartDate => 'शुरुआत तिथि';

  @override
  String get reminderFieldTime => 'याद दिलाने का समय';

  @override
  String get reminderFieldAdvanceNotice => 'पहले से सूचित करें';

  @override
  String get reminderFieldAdvanceNoticeDays => 'दिन';

  @override
  String get reminderFieldAdvanceNoticeHours => 'घंटे';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'मिनट';

  @override
  String get reminderFieldRecurrenceDay => 'महीने का दिन';

  @override
  String get reminderFieldRecurrenceMonth => 'महीना';

  @override
  String get reminderFieldRecurrenceWeekday => 'सप्ताह का दिन';

  @override
  String get reminderFieldIntervalDays => 'हर N दिन में';

  @override
  String get reminderFieldLunarDay => 'चंद्र तिथि';

  @override
  String get reminderFieldLunarMonth => 'चंद्र माह';

  @override
  String get reminderFieldLunarToggle => 'चंद्र कैलेंडर';

  @override
  String get reminderFieldDailyExclusionToggle => 'दिन बाहर रखें';

  @override
  String get reminderFieldDailyExclusionKind => 'बहिष्करण प्रकार';

  @override
  String get dailyExclusionKindWeekdays => 'सप्ताह के दिन के अनुसार';

  @override
  String get dailyExclusionKindEvenOdd => 'सम/विषम दिन';

  @override
  String get dailyExclusionKindSpecificDay => 'महीने का विशिष्ट दिन';

  @override
  String get dailyExclusionEvenDays => 'सम';

  @override
  String get dailyExclusionOddDays => 'विषम';

  @override
  String get reminderFieldDailyExclusionDay => 'बाहर रखने वाला दिन';

  @override
  String get validationDailyExclusionWeekdays =>
      'सप्ताह में कम से कम एक दिन शेष रहना चाहिए';

  @override
  String get validationDailyExclusionSpecificDay =>
      'अमान्य प्रारूप। कॉमा और डैश का उपयोग करें, जैसे: 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (चंद्र)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'यह रिमाइंडर हटाएं?';

  @override
  String get reminderDeleteConfirmBody => 'इसे वापस नहीं लाया जा सकता।';

  @override
  String get reminderScheduleWarning =>
      'रिमाइंडर सेव हो गया, लेकिन सूचना शेड्यूल नहीं हो सकी। सूचना सेटिंग जांचें।';

  @override
  String get recurrenceNone => 'एक बार';

  @override
  String get recurrenceDaily => 'प्रतिदिन';

  @override
  String get recurrenceWeekly => 'साप्ताहिक';

  @override
  String get recurrenceMonthly => 'मासिक';

  @override
  String get recurrenceYearly => 'वार्षिक';

  @override
  String get recurrenceCustomIntervalDays => 'हर N दिन में';

  @override
  String get recurrenceLunarYearly => 'वार्षिक (चंद्र कैलेंडर)';

  @override
  String get recurrenceLunarMonthly => 'मासिक (चंद्र कैलेंडर)';

  @override
  String get weekdayMonday => 'सोमवार';

  @override
  String get weekdayTuesday => 'मंगलवार';

  @override
  String get weekdayWednesday => 'बुधवार';

  @override
  String get weekdayThursday => 'गुरुवार';

  @override
  String get weekdayFriday => 'शुक्रवार';

  @override
  String get weekdaySaturday => 'शनिवार';

  @override
  String get weekdaySunday => 'रविवार';

  @override
  String get loanListTitle => 'किस्तें और कर्ज़';

  @override
  String get loanFormTitleNew => 'नई किस्त योजना';

  @override
  String get loanFormTitleEdit => 'किस्त योजना संपादित करें';

  @override
  String get loanFieldName => 'नाम';

  @override
  String get loanFieldCategory => 'श्रेणी';

  @override
  String get loanFieldTotalAmount => 'कुल राशि (वैकल्पिक)';

  @override
  String get loanFieldInstallmentAmount => 'प्रति किस्त राशि';

  @override
  String get loanFieldTotalInstallments => 'कुल किस्तों की संख्या';

  @override
  String get loanFieldFrequency => 'आवृत्ति';

  @override
  String get loanFieldDueDayOfMonth => 'महीने की देय तिथि';

  @override
  String get loanFieldStartDate => 'शुरुआत तिथि';

  @override
  String get loanFieldReminderAdvanceDays =>
      'देय तिथि से N दिन पहले याद दिलाएं';

  @override
  String get loanFieldNotes => 'टिप्पणी (वैकल्पिक)';

  @override
  String get loanFrequencyMonthly => 'मासिक';

  @override
  String get loanFrequencyWeekly => 'साप्ताहिक';

  @override
  String get loanFrequencyBiweekly => 'हर दो हफ़्ते में';

  @override
  String get loanFrequencyQuarterly => 'त्रैमासिक';

  @override
  String get loanFrequencySemiAnnually => 'हर 6 महीने में';

  @override
  String get loanFrequencyYearly => 'वार्षिक';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total किस्तें चुकाई गईं';
  }

  @override
  String get loanMarkPaid => 'भुगतान हुआ चिह्नित करें';

  @override
  String get loanStatusPending => 'बाकी';

  @override
  String get loanStatusPaid => 'भुगतान हो गया';

  @override
  String get loanStatusOverdue => 'समय निकल गया';

  @override
  String loanInstallmentNumber(int number) {
    return 'किस्त #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'यह किस्त योजना हटाएं?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'सभी $count किस्तें भी हट जाएंगी।';
  }

  @override
  String get categoryManagerTitle => 'श्रेणियाँ प्रबंधित करें';

  @override
  String get categoryFormTitleNew => 'नई श्रेणी';

  @override
  String get categoryFormTitleEdit => 'श्रेणी संपादित करें';

  @override
  String get categoryFieldName => 'नाम';

  @override
  String get categoryFieldNameRequired => 'श्रेणी का नाम आवश्यक है';

  @override
  String get categoryFieldIcon => 'आइकन';

  @override
  String get categoryFieldColor => 'रंग';

  @override
  String get categoryDeleteSimpleTitle => 'यह श्रेणी हटाएं?';

  @override
  String get categoryDeleteSimpleBody => 'इस श्रेणी में कोई रिमाइंडर नहीं है।';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'इस श्रेणी में अभी भी रिमाइंडर हैं';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count रिमाइंडर इस श्रेणी का उपयोग कर रहे हैं। आगे क्या करना है चुनें।';
  }

  @override
  String get categoryDeleteReassign => 'दूसरी श्रेणी में ले जाएं';

  @override
  String get categoryDeleteReassignTarget => 'यहाँ ले जाएं';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'सभी $count रिमाइंडर हटाएं';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'इससे $count रिमाइंडर स्थायी रूप से हट जाएंगे। इसे वापस नहीं लाया जा सकता।';
  }

  @override
  String get categoryReorderHint => 'क्रम बदलने के लिए खींचें';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsDefaultReminderTime => 'डिफ़ॉल्ट याद दिलाने का समय';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get settingsThemeSystem => 'सिस्टम अनुसार';

  @override
  String get settingsThemeLight => 'हल्का';

  @override
  String get settingsThemeDark => 'गहरा';

  @override
  String get settingsBackupRestore => 'बैकअप और पुनर्स्थापना';

  @override
  String get settingsExport => 'बैकअप निर्यात करें';

  @override
  String get settingsImport => 'बैकअप से पुनर्स्थापित करें';

  @override
  String get settingsExportLocationHint =>
      'Android/data/com.ireminder.ireminder/files/backups में सेव किया गया';

  @override
  String get settingsExportSuccess => 'बैकअप सहेजा गया';

  @override
  String get settingsImportNoneFound => 'कोई बैकअप फ़ाइल नहीं मिली';

  @override
  String get settingsImportPickFile => 'बैकअप चुनें';

  @override
  String get settingsImportSuccess => 'बैकअप पुनर्स्थापित किया गया';

  @override
  String get settingsImportConfirmTitle => 'बैकअप पुनर्स्थापित करें?';

  @override
  String get settingsImportConfirmBody =>
      'इससे वर्तमान सभी डेटा बैकअप फ़ाइल की सामग्री से बदल जाएगा।';

  @override
  String get settingsAbout => 'ऐप के बारे में';

  @override
  String get settingsBatteryOptimizationTitle => 'सूचनाएं समय पर नहीं आ रहीं?';

  @override
  String get settingsBatteryOptimizationBody =>
      'कुछ फ़ोन निर्माता (Samsung, Xiaomi, Oppo आदि) बैकग्राउंड ऐप्स को काफ़ी सीमित कर देते हैं। सूचनाएं हमेशा समय पर आएं, इसके लिए फ़ोन की सेटिंग्स > बैटरी में जाकर iReminder के लिए बैटरी ऑप्टिमाइज़ेशन बंद करें।';

  @override
  String get errorGeneric => 'कुछ गलत हो गया। कृपया फिर से प्रयास करें।';

  @override
  String get errorLoadFailed => 'डेटा लोड नहीं हो सका।';

  @override
  String get validationRequired => 'आवश्यक';

  @override
  String get validationDayOfMonth => '1–31 के बीच दिन दर्ज करें';

  @override
  String get validationMonth => '1–12 के बीच महीना दर्ज करें';

  @override
  String get validationPositiveNumber => '0 से बड़ी संख्या दर्ज करें';

  @override
  String get validationPositiveInteger => '0 से बड़ी पूर्ण संख्या दर्ज करें';

  @override
  String get settingsPermissionsSectionTitle => 'सूचनाएं और अलार्म';

  @override
  String get settingsPermissionsNotificationLabel => 'सूचना अनुमति';

  @override
  String get settingsPermissionsExactAlarmLabel => 'सटीक अलार्म अनुमति';

  @override
  String get settingsPermissionsBatteryLabel =>
      'बैटरी अनुकूलन अनदेखा करें (अनुशंसित)';

  @override
  String get settingsTestNotificationAction => 'सूचना जांचें (10 सेकंड)';

  @override
  String get settingsTestNotificationScheduled =>
      'शेड्यूल हो गया। अपनी स्क्रीन लॉक करें या ऐप छोड़ दें और लगभग 10 सेकंड प्रतीक्षा करें।';

  @override
  String get settingsPermissionsGranted => 'अनुमति दी गई';

  @override
  String get settingsPermissionsDenied =>
      'अनुमति नहीं दी गई — रिमाइंडर समय पर नहीं बज सकते';

  @override
  String get settingsPermissionsGrantAction => 'अनुमति दें';

  @override
  String get settingsPermissionsOpenSettingsAction => 'सेटिंग्स खोलें';

  @override
  String get loanMarkPaidSuccess => 'भुगतान के रूप में चिह्नित किया गया';

  @override
  String get settingsNotificationPrefsTitle => 'ध्वनि और वाइब्रेशन';

  @override
  String get settingsNotificationSound => 'सूचना ध्वनि';

  @override
  String get settingsNotificationVibration => 'वाइब्रेशन';

  @override
  String get settingsSnoozeDuration => 'स्नूज़ समय';

  @override
  String get snoozeDuration5Min => '5 मिनट';

  @override
  String get snoozeDuration10Min => '10 मिनट';

  @override
  String get snoozeDuration15Min => '15 मिनट';

  @override
  String get snoozeDuration30Min => '30 मिनट';

  @override
  String get snoozeDuration60Min => '1 घंटा';

  @override
  String get snoozeDuration120Min => '2 घंटे';

  @override
  String get defaultCategoryHomeAppliances => 'घर और उपकरण';

  @override
  String get defaultCategoryVehicles => 'वाहन';

  @override
  String get defaultCategoryFamilyEvents => 'वर्षगांठ और परिवार';

  @override
  String get defaultCategoryFinance => 'वित्त';

  @override
  String get defaultCategoryWork => 'काम';

  @override
  String get defaultCategoryFamily => 'परिवार';

  @override
  String get defaultCategoryOutdoorEvents => 'आउटिंग और आयोजन';

  @override
  String get defaultCategoryHealth => 'स्वास्थ्य';

  @override
  String get defaultCategoryBirthday => 'जन्मदिन';

  @override
  String get defaultCategoryFood => 'भोजन';
}
