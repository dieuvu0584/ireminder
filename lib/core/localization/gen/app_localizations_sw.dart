// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Leo';

  @override
  String get navCalendar => 'Kalenda';

  @override
  String get navLoans => 'Mikopo';

  @override
  String get navCategories => 'Jamii';

  @override
  String get navSettings => 'Mipangilio';

  @override
  String get onboardingTitle1 => 'Usisahau tena mambo muhimu';

  @override
  String get onboardingBody1 =>
      'Fuatilia matengenezo ya vifaa, huduma za gari, kumbukumbu za maadhimisho, na mengine mengi — yote mahali pamoja.';

  @override
  String get onboardingTitle2 => 'Urudiaji uliorahisishwa';

  @override
  String get onboardingBody2 =>
      'Kila siku, kila wiki, kila mwezi, kila mwaka, au hata kwa kalenda ya mwezi — weka mara moja na iReminder itakukumbusha.';

  @override
  String get onboardingTitle3 => 'Faragha 100%, bila mtandao 100%';

  @override
  String get onboardingBody3 =>
      'Hakuna akaunti, hakuna wingu, hakuna kuingia. Kila kitu kinabaki kwenye simu yako.';

  @override
  String get onboardingSkip => 'Ruka';

  @override
  String get onboardingNext => 'Endelea';

  @override
  String get onboardingGetStarted => 'Anza';

  @override
  String get permissionCheckTitle => 'Angalia ruhusa';

  @override
  String get permissionCheckIntro =>
      'iReminder inahitaji ruhusa hizi 3 ili kukukumbusha kwa uhakika kwa wakati halisi uliopanga. Kutoa ruhusa ya \"Kengele sahihi\" kunaweza kufungua skrini ya Mipangilio ya mfumo — hilo ni la kawaida.';

  @override
  String get permissionCheckContinueAction => 'Endelea';

  @override
  String get permissionCheckIncompleteTitle => 'Ruhusa hazijakamilika';

  @override
  String get permissionCheckIncompleteBody =>
      'Vikumbusho vinaweza kutofanya kazi kwa uhakika bila ruhusa hizi. Unaweza kuzitoa baadaye kwenye Mipangilio, lakini ni rahisi kusahau.';

  @override
  String get permissionCheckIncompleteStay => 'Rudi na utoe';

  @override
  String get permissionCheckIncompleteContinue => 'Endelea hata hivyo';

  @override
  String get homeSectionOverdue => 'Zilizochelewa';

  @override
  String get homeSectionToday => 'Leo';

  @override
  String get homeSectionThisWeek => 'Wiki hii';

  @override
  String get homeSectionUpcoming => 'Zinazokuja';

  @override
  String get homeEmptyTitle => 'Bado hakuna kitu hapa';

  @override
  String get homeEmptyBody =>
      'Gusa + kuongeza kikumbusho chako cha kwanza au mkopo wa awamu.';

  @override
  String get fabAddReminder => 'Kikumbusho';

  @override
  String get fabAddLoan => 'Mkopo wa awamu';

  @override
  String get actionDone => 'Imekamilika';

  @override
  String get actionSnooze => 'Ahirisha';

  @override
  String get actionEdit => 'Hariri';

  @override
  String get actionDelete => 'Futa';

  @override
  String get actionSave => 'Hifadhi';

  @override
  String get actionCancel => 'Ghairi';

  @override
  String get actionConfirm => 'Thibitisha';

  @override
  String get actionYes => 'Ndiyo';

  @override
  String get actionNo => 'Hapana';

  @override
  String get actionOk => 'Sawa';

  @override
  String get actionAdd => 'Ongeza';

  @override
  String get actionClose => 'Funga';

  @override
  String get reminderFormTitleNew => 'Kikumbusho kipya';

  @override
  String get reminderFormTitleEdit => 'Hariri kikumbusho';

  @override
  String get reminderFieldTitle => 'Kichwa';

  @override
  String get reminderFieldTitleRequired => 'Kichwa kinahitajika';

  @override
  String get reminderFieldDescription => 'Maelezo (hiari)';

  @override
  String get reminderFieldCategory => 'Jamii';

  @override
  String get reminderFieldRecurrence => 'Marudio';

  @override
  String get reminderFieldStartDate => 'Tarehe ya kuanza';

  @override
  String get reminderFieldTime => 'Muda wa kikumbusho';

  @override
  String get reminderFieldAdvanceNotice => 'Arifu mapema';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Siku';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Masaa';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Dakika';

  @override
  String get reminderFieldRecurrenceDay => 'Siku ya mwezi';

  @override
  String get reminderFieldRecurrenceMonth => 'Mwezi';

  @override
  String get reminderFieldRecurrenceWeekday => 'Siku ya wiki';

  @override
  String get reminderFieldIntervalDays => 'Kila siku N';

  @override
  String get reminderFieldLunarDay => 'Siku ya kalenda ya mwezi';

  @override
  String get reminderFieldLunarMonth => 'Mwezi wa kalenda ya mwezi';

  @override
  String get reminderFieldLunarToggle => 'Kalenda ya mwezi';

  @override
  String get reminderFieldDailyExclusionToggle => 'Ondoa siku';

  @override
  String get reminderFieldDailyExclusionKind => 'Aina ya kuondoa';

  @override
  String get dailyExclusionKindWeekdays => 'Kwa siku ya wiki';

  @override
  String get dailyExclusionKindEvenOdd => 'Siku za namba sawa/isiyo sawa';

  @override
  String get dailyExclusionKindSpecificDay => 'Siku maalum ya mwezi';

  @override
  String get dailyExclusionEvenDays => 'Sawa';

  @override
  String get dailyExclusionOddDays => 'Isiyo sawa';

  @override
  String get reminderFieldDailyExclusionDay => 'Siku ya kuondoa';

  @override
  String get validationDailyExclusionWeekdays =>
      'Angalau siku moja ya wiki lazima ibaki';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (mwezi)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Futa kikumbusho hiki?';

  @override
  String get reminderDeleteConfirmBody => 'Hatua hii haiwezi kutenduliwa.';

  @override
  String get reminderScheduleWarning =>
      'Ukumbusho umehifadhiwa, lakini arifa haikuweza kupangwa. Angalia mipangilio ya arifa.';

  @override
  String get recurrenceNone => 'Mara moja';

  @override
  String get recurrenceDaily => 'Kila siku';

  @override
  String get recurrenceWeekly => 'Kila wiki';

  @override
  String get recurrenceMonthly => 'Kila mwezi';

  @override
  String get recurrenceYearly => 'Kila mwaka';

  @override
  String get recurrenceCustomIntervalDays => 'Kila siku N';

  @override
  String get recurrenceLunarYearly => 'Kila mwaka (kalenda ya mwezi)';

  @override
  String get weekdayMonday => 'Jumatatu';

  @override
  String get weekdayTuesday => 'Jumanne';

  @override
  String get weekdayWednesday => 'Jumatano';

  @override
  String get weekdayThursday => 'Alhamisi';

  @override
  String get weekdayFriday => 'Ijumaa';

  @override
  String get weekdaySaturday => 'Jumamosi';

  @override
  String get weekdaySunday => 'Jumapili';

  @override
  String get loanListTitle => 'Mikopo na awamu';

  @override
  String get loanFormTitleNew => 'Mkopo mpya wa awamu';

  @override
  String get loanFormTitleEdit => 'Hariri mkopo';

  @override
  String get loanFieldName => 'Jina';

  @override
  String get loanFieldCategory => 'Jamii';

  @override
  String get loanFieldTotalAmount => 'Kiasi cha jumla (hiari)';

  @override
  String get loanFieldInstallmentAmount => 'Kiasi kwa kila awamu';

  @override
  String get loanFieldTotalInstallments => 'Idadi ya awamu';

  @override
  String get loanFieldFrequency => 'Marudio';

  @override
  String get loanFieldDueDayOfMonth => 'Siku ya malipo kwa mwezi';

  @override
  String get loanFieldStartDate => 'Tarehe ya kuanza';

  @override
  String get loanFieldReminderAdvanceDays => 'Kumbusha siku N kabla ya malipo';

  @override
  String get loanFieldNotes => 'Vidokezo (hiari)';

  @override
  String get loanFrequencyMonthly => 'Kila mwezi';

  @override
  String get loanFrequencyWeekly => 'Kila wiki';

  @override
  String get loanFrequencyBiweekly => 'Kila baada ya wiki mbili';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total zimelipwa';
  }

  @override
  String get loanMarkPaid => 'Weka alama kuwa imelipwa';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Weka alama kwa awamu $count kuwa zimelipwa';
  }

  @override
  String get loanStatusPending => 'Inasubiri';

  @override
  String get loanStatusPaid => 'Imelipwa';

  @override
  String get loanStatusOverdue => 'Imechelewa';

  @override
  String loanInstallmentNumber(int number) {
    return 'Awamu #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Futa mkopo huu?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Awamu zote $count pia zitaondolewa.';
  }

  @override
  String get categoryManagerTitle => 'Jamii';

  @override
  String get categoryFormTitleNew => 'Jamii mpya';

  @override
  String get categoryFormTitleEdit => 'Hariri jamii';

  @override
  String get categoryFieldName => 'Jina';

  @override
  String get categoryFieldNameRequired => 'Jina linahitajika';

  @override
  String get categoryFieldIcon => 'Aikoni';

  @override
  String get categoryFieldColor => 'Rangi';

  @override
  String get categoryDeleteSimpleTitle => 'Futa jamii hii?';

  @override
  String get categoryDeleteSimpleBody => 'Jamii hii haina vikumbusho vyovyote.';

  @override
  String get categoryDeleteHasRemindersTitle => 'Jamii hii bado ina vikumbusho';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return 'Vikumbusho $count vinatumia jamii hii. Chagua utakalofanya navyo.';
  }

  @override
  String get categoryDeleteReassign => 'Hamishia jamii nyingine';

  @override
  String get categoryDeleteReassignTarget => 'Hamishia';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Futa vikumbusho vyote $count';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Hatua hii itafuta kabisa vikumbusho $count. Haiwezi kutenduliwa.';
  }

  @override
  String get categoryReorderHint => 'Buruta ili kupanga upya';

  @override
  String get settingsTitle => 'Mipangilio';

  @override
  String get settingsLanguage => 'Lugha';

  @override
  String get settingsDefaultReminderTime => 'Muda chaguo-msingi wa kikumbusho';

  @override
  String get settingsTheme => 'Mandhari';

  @override
  String get settingsThemeSystem => 'Mfumo';

  @override
  String get settingsThemeLight => 'Nyepesi';

  @override
  String get settingsThemeDark => 'Giza';

  @override
  String get settingsBackupRestore => 'Hifadhi nakala na urejeshe';

  @override
  String get settingsExport => 'Hamisha nakala rudufu';

  @override
  String get settingsImport => 'Rejesha kutoka nakala rudufu';

  @override
  String get settingsExportLocationHint =>
      'Imehifadhiwa katika Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Nakala rudufu imehifadhiwa';

  @override
  String get settingsImportNoneFound =>
      'Hakuna faili za nakala rudufu zilizopatikana';

  @override
  String get settingsImportPickFile => 'Chagua nakala rudufu';

  @override
  String get settingsImportSuccess => 'Nakala rudufu imerejeshwa';

  @override
  String get settingsImportConfirmTitle => 'Rejesha nakala rudufu?';

  @override
  String get settingsImportConfirmBody =>
      'Hii itabadilisha data zote za sasa na maudhui ya faili la nakala rudufu.';

  @override
  String get settingsAbout => 'Kuhusu';

  @override
  String get settingsBatteryOptimizationTitle => 'Arifa hazifiki kwa wakati?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Watengenezaji wa simu wengine (Samsung, Xiaomi, Oppo...) huzuia sana programu zinazoendesha nyuma. Zima uboreshaji wa betri kwa iReminder katika Mipangilio ya simu yako > Betri ili kuhakikisha vikumbusho vinafika kwa wakati kila mara.';

  @override
  String get errorGeneric => 'Hitilafu imetokea. Tafadhali jaribu tena.';

  @override
  String get errorLoadFailed => 'Imeshindwa kupakia data.';

  @override
  String get validationRequired => 'Inahitajika';

  @override
  String get validationDayOfMonth => 'Weka siku kutoka 1–31';

  @override
  String get validationMonth => 'Weka mwezi kutoka 1–12';

  @override
  String get validationPositiveNumber => 'Weka namba kubwa kuliko 0';

  @override
  String get validationPositiveInteger => 'Weka namba kamili kubwa kuliko 0';

  @override
  String get settingsPermissionsSectionTitle => 'Arifa na Kengele';

  @override
  String get settingsPermissionsNotificationLabel => 'Ruhusa ya arifa';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Ruhusa ya kengele sahihi';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Puuza uboreshaji wa betri (inapendekezwa)';

  @override
  String get settingsTestNotificationAction => 'Jaribu arifa (sekunde 10)';

  @override
  String get settingsTestNotificationScheduled =>
      'Imepangwa. Funga skrini yako au ondoka kwenye programu sasa na subiri sekunde 10 hivi.';

  @override
  String get settingsPermissionsGranted => 'Imeruhusiwa';

  @override
  String get settingsPermissionsDenied =>
      'Haijaruhusiwa — vikumbusho vinaweza visifike kwa wakati';

  @override
  String get settingsPermissionsGrantAction => 'Ruhusu';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Fungua mipangilio';

  @override
  String get loanMarkPaidSuccess => 'Imewekwa alama kuwa imelipwa';

  @override
  String get settingsNotificationPrefsTitle => 'Sauti na mtetemo';

  @override
  String get settingsNotificationSound => 'Sauti ya arifa';

  @override
  String get settingsNotificationVibration => 'Mtetemo';

  @override
  String get settingsSnoozeDuration => 'Muda wa kuahirisha';

  @override
  String get snoozeDuration5Min => 'Dakika 5';

  @override
  String get snoozeDuration10Min => 'Dakika 10';

  @override
  String get snoozeDuration15Min => 'Dakika 15';

  @override
  String get snoozeDuration30Min => 'Dakika 30';

  @override
  String get snoozeDuration60Min => 'Saa 1';

  @override
  String get snoozeDuration120Min => 'Saa 2';

  @override
  String get defaultCategoryHomeAppliances => 'Nyumba na vifaa';

  @override
  String get defaultCategoryVehicles => 'Magari';

  @override
  String get defaultCategoryFamilyEvents => 'Kumbukumbu na familia';

  @override
  String get defaultCategoryFinance => 'Fedha';

  @override
  String get defaultCategoryWork => 'Kazi';

  @override
  String get defaultCategoryFamily => 'Familia';

  @override
  String get defaultCategoryOutdoorEvents => 'Matembezi na matukio';

  @override
  String get defaultCategoryHealth => 'Afya';

  @override
  String get defaultCategoryBirthday => 'Siku za Kuzaliwa';
}
