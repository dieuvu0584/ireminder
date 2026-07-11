// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'आज';

  @override
  String get navCalendar => 'दिनदर्शिका';

  @override
  String get navLoans => 'कर्ज';

  @override
  String get navCategories => 'श्रेणी';

  @override
  String get navSettings => 'सेटिंग्ज';

  @override
  String get navAssistant => 'सहाय्यक';

  @override
  String get onboardingTitle1 => 'महत्त्वाचं कधीच विसरू नका';

  @override
  String get onboardingBody1 =>
      'डिव्हाइस मेंटेनन्स, वाहन सर्व्हिसिंग, वाढदिवस-वर्धापनदिन आणि बरंच काही — सगळं एकाच ठिकाणी ट्रॅक करा.';

  @override
  String get onboardingTitle2 => 'पुनरावृत्ती आता अगदी सोपी';

  @override
  String get onboardingBody2 =>
      'दररोज, दर आठवड्याला, दर महिन्याला, दरवर्षी, किंवा अगदी चंद्र दिनदर्शिकेनुसारही — एकदा सेट करा, iReminder लक्षात ठेवेल.';

  @override
  String get onboardingTitle3 => '100% खाजगी, 100% ऑफलाइन';

  @override
  String get onboardingBody3 =>
      'खातं नाही, क्लाउड नाही, लॉगिन नाही. सर्व काही तुमच्या फोनमध्येच राहतं.';

  @override
  String get onboardingSkip => 'वगळा';

  @override
  String get onboardingNext => 'पुढे';

  @override
  String get onboardingGetStarted => 'सुरुवात करा';

  @override
  String get notificationPermissionTitle => 'वेळेवर रहा';

  @override
  String get notificationPermissionBody =>
      'एखादी गोष्ट देय झाल्यावर सूचना पाठवण्यासाठी iReminder ला परवानगी हवी आहे.';

  @override
  String get notificationPermissionAllow => 'सूचनांना परवानगी द्या';

  @override
  String get notificationPermissionLater => 'आत्ता नको';

  @override
  String get homeSectionOverdue => 'मुदत उलटलेले';

  @override
  String get homeSectionToday => 'आज';

  @override
  String get homeSectionThisWeek => 'या आठवड्यात';

  @override
  String get homeSectionUpcoming => 'आगामी';

  @override
  String get homeEmptyTitle => 'इथे अजून काही नाही';

  @override
  String get homeEmptyBody =>
      'तुमची पहिली रिमाइंडर किंवा हप्त्याचं कर्ज जोडण्यासाठी + दाबा.';

  @override
  String get fabAddReminder => 'रिमाइंडर';

  @override
  String get fabAddLoan => 'हप्त्याचं कर्ज';

  @override
  String get actionDone => 'पूर्ण';

  @override
  String get actionSnooze => 'स्नूझ करा';

  @override
  String get actionEdit => 'संपादित करा';

  @override
  String get actionDelete => 'हटवा';

  @override
  String get actionSave => 'जतन करा';

  @override
  String get actionCancel => 'रद्द करा';

  @override
  String get actionConfirm => 'पुष्टी करा';

  @override
  String get actionYes => 'होय';

  @override
  String get actionNo => 'नाही';

  @override
  String get actionOk => 'ठीक आहे';

  @override
  String get actionAdd => 'जोडा';

  @override
  String get actionClose => 'बंद करा';

  @override
  String get reminderFormTitleNew => 'नवीन रिमाइंडर';

  @override
  String get reminderFormTitleEdit => 'रिमाइंडर संपादित करा';

  @override
  String get reminderFieldTitle => 'शीर्षक';

  @override
  String get reminderFieldTitleRequired => 'शीर्षक आवश्यक आहे';

  @override
  String get reminderFieldDescription => 'वर्णन (ऐच्छिक)';

  @override
  String get reminderFieldCategory => 'श्रेणी';

  @override
  String get reminderFieldRecurrence => 'पुनरावृत्ती';

  @override
  String get reminderFieldStartDate => 'सुरुवातीची तारीख';

  @override
  String get reminderFieldTime => 'रिमाइंडरची वेळ';

  @override
  String get reminderFieldAdvanceNotice => 'N दिवस आधी सूचित करा';

  @override
  String get reminderFieldRecurrenceDay => 'महिन्याचा दिवस';

  @override
  String get reminderFieldRecurrenceMonth => 'महिना';

  @override
  String get reminderFieldRecurrenceWeekday => 'आठवड्याचा दिवस';

  @override
  String get reminderFieldIntervalDays => 'दर N दिवसांनी';

  @override
  String get reminderFieldLunarDay => 'चंद्र दिनांक';

  @override
  String get reminderFieldLunarMonth => 'चंद्र महिना';

  @override
  String get reminderFieldLunarToggle => 'चंद्र दिनदर्शिका';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (चंद्र)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'हे रिमाइंडर हटवायचं?';

  @override
  String get reminderDeleteConfirmBody => 'ही क्रिया पूर्ववत करता येणार नाही.';

  @override
  String get reminderCompletedFeedback => 'पूर्ण म्हणून चिन्हांकित';

  @override
  String get reminderScheduleWarning =>
      'स्मरणपत्र जतन केले, परंतु सूचना शेड्यूल करता आली नाही. सूचना सेटिंग्ज तपासा.';

  @override
  String get recurrenceNone => 'एकदाच';

  @override
  String get recurrenceDaily => 'दररोज';

  @override
  String get recurrenceWeekly => 'दर आठवड्याला';

  @override
  String get recurrenceMonthly => 'दर महिन्याला';

  @override
  String get recurrenceYearly => 'दरवर्षी';

  @override
  String get recurrenceCustomIntervalDays => 'दर N दिवसांनी';

  @override
  String get recurrenceLunarYearly => 'दरवर्षी (चंद्र दिनदर्शिका)';

  @override
  String get weekdayMonday => 'सोमवार';

  @override
  String get weekdayTuesday => 'मंगळवार';

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
  String get loanListTitle => 'कर्ज आणि हप्ते';

  @override
  String get loanFormTitleNew => 'नवीन हप्त्याचं कर्ज';

  @override
  String get loanFormTitleEdit => 'कर्ज संपादित करा';

  @override
  String get loanFieldName => 'नाव';

  @override
  String get loanFieldCategory => 'श्रेणी';

  @override
  String get loanFieldTotalAmount => 'एकूण रक्कम (ऐच्छिक)';

  @override
  String get loanFieldInstallmentAmount => 'प्रति हप्ता रक्कम';

  @override
  String get loanFieldTotalInstallments => 'हप्त्यांची संख्या';

  @override
  String get loanFieldFrequency => 'वारंवारता';

  @override
  String get loanFieldDueDayOfMonth => 'महिन्यातील देय दिवस';

  @override
  String get loanFieldStartDate => 'सुरुवातीची तारीख';

  @override
  String get loanFieldReminderAdvanceDays =>
      'देय तारखेच्या N दिवस आधी आठवण करा';

  @override
  String get loanFieldNotes => 'टिपा (ऐच्छिक)';

  @override
  String get loanFrequencyMonthly => 'दर महिन्याला';

  @override
  String get loanFrequencyWeekly => 'दर आठवड्याला';

  @override
  String get loanFrequencyBiweekly => 'दर दोन आठवड्यांनी';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total भरले';
  }

  @override
  String get loanMarkPaid => 'भरलं म्हणून चिन्हांकित करा';

  @override
  String loanMarkPaidBatch(int count) {
    return '$count हप्ते भरले म्हणून चिन्हांकित करा';
  }

  @override
  String get loanStatusPending => 'प्रलंबित';

  @override
  String get loanStatusPaid => 'भरलं';

  @override
  String get loanStatusOverdue => 'मुदत उलटलेली';

  @override
  String loanInstallmentNumber(int number) {
    return 'हप्ता #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'हे कर्ज हटवायचं?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'सर्व $count हप्तेही काढून टाकले जातील.';
  }

  @override
  String get categoryManagerTitle => 'श्रेणी';

  @override
  String get categoryFormTitleNew => 'नवीन श्रेणी';

  @override
  String get categoryFormTitleEdit => 'श्रेणी संपादित करा';

  @override
  String get categoryFieldName => 'नाव';

  @override
  String get categoryFieldNameRequired => 'नाव आवश्यक आहे';

  @override
  String get categoryFieldIcon => 'आयकॉन';

  @override
  String get categoryFieldColor => 'रंग';

  @override
  String get categoryDeleteSimpleTitle => 'ही श्रेणी हटवायची?';

  @override
  String get categoryDeleteSimpleBody => 'या श्रेणीत कोणतेही रिमाइंडर नाहीत.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'या श्रेणीत अजूनही रिमाइंडर आहेत';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count रिमाइंडर या श्रेणीचा वापर करतात. त्यांचं काय करायचं ते निवडा.';
  }

  @override
  String get categoryDeleteReassign => 'दुसऱ्या श्रेणीत हलवा';

  @override
  String get categoryDeleteReassignTarget => 'इकडे हलवा';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'सर्व $count रिमाइंडर हटवा';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'यामुळे $count रिमाइंडर कायमचे हटवले जातील. ही क्रिया पूर्ववत करता येणार नाही.';
  }

  @override
  String get categoryReorderHint => 'क्रम बदलण्यासाठी ड्रॅग करा';

  @override
  String get settingsTitle => 'सेटिंग्ज';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsDefaultReminderTime => 'डीफॉल्ट रिमाइंडर वेळ';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get settingsThemeSystem => 'सिस्टम';

  @override
  String get settingsThemeLight => 'लाइट';

  @override
  String get settingsThemeDark => 'डार्क';

  @override
  String get settingsBackupRestore => 'बॅकअप आणि रिस्टोअर';

  @override
  String get settingsExport => 'बॅकअप एक्सपोर्ट करा';

  @override
  String get settingsImport => 'बॅकअपमधून रिस्टोअर करा';

  @override
  String get settingsExportLocationHint =>
      'Android/data/com.ireminder.ireminder/files/backups मध्ये जतन केलं';

  @override
  String get settingsExportSuccess => 'बॅकअप जतन झालं';

  @override
  String get settingsImportNoneFound => 'कोणत्याही बॅकअप फाइल्स सापडल्या नाहीत';

  @override
  String get settingsImportPickFile => 'बॅकअप निवडा';

  @override
  String get settingsImportSuccess => 'बॅकअप रिस्टोअर झालं';

  @override
  String get settingsImportConfirmTitle => 'बॅकअप रिस्टोअर करायचं?';

  @override
  String get settingsImportConfirmBody =>
      'यामुळे सध्याचा सर्व डेटा बॅकअप फाइलमधील मजकुराने बदलला जाईल.';

  @override
  String get settingsAbout => 'अ‍ॅपबद्दल';

  @override
  String get settingsBatteryOptimizationTitle => 'सूचना वेळेवर येत नाहीत का?';

  @override
  String get settingsBatteryOptimizationBody =>
      'काही फोन कंपन्या (Samsung, Xiaomi, Oppo...) बॅकग्राउंड अ‍ॅप्सवर कडक निर्बंध घालतात. रिमाइंडर नेहमी वेळेवर येण्यासाठी तुमच्या फोनच्या सेटिंग्ज > बॅटरी मध्ये जाऊन iReminder साठी बॅटरी ऑप्टिमायझेशन बंद करा.';

  @override
  String get errorGeneric => 'काहीतरी चुकलं. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorLoadFailed => 'डेटा लोड करता आला नाही.';

  @override
  String get settingsAiSectionTitle => 'AI सहाय्यक';

  @override
  String get settingsAiEnable => 'AI सहाय्यक सुरू करा';

  @override
  String get settingsAiProvider => 'AI प्रोव्हायडर';

  @override
  String get settingsAiModel => 'मॉडेल';

  @override
  String get settingsAiApiKey => 'API की';

  @override
  String get settingsAiApiKeyHint => 'तुमची API की पेस्ट करा';

  @override
  String get settingsAiApiKeyHelp => 'की कुठे मिळेल?';

  @override
  String get settingsAiApiKeySaved => 'API की जतन झाली';

  @override
  String get settingsAiAllowedCategories => 'सहाय्यक वाचू शकेल अशा श्रेणी';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'वित्त वगळता सर्व श्रेण्या डीफॉल्टनुसार शेअर केल्या जातात — सहाय्यकाला दिसू नयेत असे वाटणाऱ्या बंद करा.';

  @override
  String get settingsAiClearHistory => 'चॅट इतिहास साफ करा';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'चॅट इतिहास साफ करायचा?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'यामुळे या डिव्हाइसवर साठवलेले सर्व प्रश्न आणि उत्तरं हटवली जातील. ही क्रिया पूर्ववत करता येणार नाही.';

  @override
  String get assistantTitle => 'सहाय्यक';

  @override
  String get assistantEmptyTitle => 'मला काहीही विचारा';

  @override
  String get assistantEmptyBody =>
      '\"या आठवड्यात मला काय करायचं आहे?\" किंवा \"माझ्या बाइक कर्जाचे किती हप्ते बाकी आहेत?\" असं विचारून पहा.';

  @override
  String get assistantInputHint => 'काहीतरी विचारा…';

  @override
  String get assistantSend => 'पाठवा';

  @override
  String get assistantDisabledTitle => 'सहाय्यक बंद आहे';

  @override
  String get assistantDisabledBody =>
      'गप्पा सुरू करण्यासाठी सेटिंग्जमध्ये तो सुरू करा आणि AI प्रोव्हायडर निवडा.';

  @override
  String get assistantOpenSettings => 'सेटिंग्ज उघडा';

  @override
  String get assistantThinking => 'विचार करत आहे…';

  @override
  String get validationRequired => 'आवश्यक';

  @override
  String get validationDayOfMonth => '1–31 मधील दिवस टाका';

  @override
  String get validationMonth => '1–12 मधील महिना टाका';

  @override
  String get validationPositiveNumber => '0 पेक्षा मोठी संख्या टाका';

  @override
  String get validationPositiveInteger => '0 पेक्षा मोठी पूर्ण संख्या टाका';

  @override
  String get settingsPermissionsSectionTitle => 'सूचना आणि अलार्म';

  @override
  String get settingsPermissionsNotificationLabel => 'सूचना परवानगी';

  @override
  String get settingsPermissionsExactAlarmLabel => 'अचूक अलार्म परवानगी';

  @override
  String get settingsPermissionsBatteryLabel =>
      'बॅटरी ऑप्टिमायझेशन दुर्लक्ष करा (शिफारस केलेले)';

  @override
  String get settingsTestNotificationAction => 'सूचना तपासा (10 सेकंद)';

  @override
  String get settingsTestNotificationScheduled =>
      'शेड्यूल केले. आता तुमची स्क्रीन लॉक करा किंवा अ‍ॅपमधून बाहेर पडा आणि सुमारे 10 सेकंद प्रतीक्षा करा.';

  @override
  String get settingsPermissionsGranted => 'मंजूर';

  @override
  String get settingsPermissionsDenied =>
      'मंजूर नाही — रिमाइंडर वेळेवर येणार नाहीत';

  @override
  String get settingsPermissionsGrantAction => 'मंजूर करा';

  @override
  String get settingsPermissionsOpenSettingsAction => 'सेटिंग्ज उघडा';

  @override
  String get onboardingExactAlarmRationaleTitle => 'आणखी एक परवानगी';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'पुढच्या स्क्रीनवर, तुम्ही ठरवलेल्या अचूक वेळी रिमाइंडर वाजण्यासाठी iReminder ला अचूक अलार्म शेड्यूल करण्याची परवानगी द्या.';

  @override
  String get loanMarkPaidSuccess => 'भरलं म्हणून चिन्हांकित केलं';

  @override
  String get settingsNotificationPrefsTitle => 'आवाज आणि व्हायब्रेशन';

  @override
  String get settingsNotificationSound => 'सूचना आवाज';

  @override
  String get settingsNotificationVibration => 'व्हायब्रेशन';

  @override
  String get settingsSnoozeDuration => 'स्नूझ कालावधी';

  @override
  String get snoozeDuration5Min => '5 मिनिटे';

  @override
  String get snoozeDuration10Min => '10 मिनिटे';

  @override
  String get snoozeDuration15Min => '15 मिनिटे';

  @override
  String get snoozeDuration30Min => '30 मिनिटे';

  @override
  String get snoozeDuration60Min => '1 तास';

  @override
  String get snoozeDuration120Min => '2 तास';

  @override
  String get defaultCategoryHomeAppliances => 'घर आणि उपकरणे';

  @override
  String get defaultCategoryVehicles => 'वाहने';

  @override
  String get defaultCategoryFamilyEvents => 'वाढदिवस आणि कुटुंब';

  @override
  String get defaultCategoryFinance => 'वित्त';

  @override
  String get defaultCategoryWork => 'काम';

  @override
  String get defaultCategoryFamily => 'कुटुंब';

  @override
  String get defaultCategoryOutdoorEvents => 'सहली आणि कार्यक्रम';

  @override
  String get defaultCategoryHealth => 'आरोग्य';

  @override
  String get defaultCategoryBirthday => 'वाढदिवस';
}
