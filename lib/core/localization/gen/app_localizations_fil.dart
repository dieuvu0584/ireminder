// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Ngayon';

  @override
  String get navCalendar => 'Kalendaryo';

  @override
  String get navLoans => 'Utang';

  @override
  String get navCategories => 'Mga Kategorya';

  @override
  String get navSettings => 'Mga Setting';

  @override
  String get onboardingTitle1 => 'Huwag nang makalimot sa mahalaga';

  @override
  String get onboardingBody1 =>
      'I-track ang maintenance ng gamit, serbisyo ng sasakyan, anibersaryo, at marami pa — lahat sa iisang app.';

  @override
  String get onboardingTitle2 => 'Ginawang simple ang pag-uulit';

  @override
  String get onboardingBody2 =>
      'Araw-araw, lingguhan, buwanan, taunan, o kahit ayon sa kalendaryong lunar — i-set mo isang beses lang at aalalahanin ka na ni iReminder.';

  @override
  String get onboardingTitle3 => '100% pribado, 100% offline';

  @override
  String get onboardingBody3 =>
      'Walang account, walang cloud, walang login. Nananatili ang lahat sa iyong telepono.';

  @override
  String get onboardingSkip => 'Laktawan';

  @override
  String get onboardingNext => 'Susunod';

  @override
  String get onboardingGetStarted => 'Simulan na';

  @override
  String get permissionCheckTitle => 'Suriin ang mga pahintulot';

  @override
  String get permissionCheckIntro =>
      'Kailangan ng iReminder ang 3 pahintulot na ito para maaasahan kang paalalahanan sa eksaktong oras na itinakda mo. Ang pagbibigay ng \"Eksaktong alarm\" ay maaaring magbukas ng screen ng Mga Setting ng system — normal lang ito.';

  @override
  String get permissionCheckContinueAction => 'Magpatuloy';

  @override
  String get permissionCheckIncompleteTitle =>
      'Hindi kumpleto ang mga pahintulot';

  @override
  String get permissionCheckIncompleteBody =>
      'Maaaring hindi maaasahan ang mga paalala nang wala ang mga pahintulot na ito. Puwede mo itong ibigay sa Settings sa ibang pagkakataon, pero madaling makalimutan.';

  @override
  String get permissionCheckIncompleteStay => 'Bumalik at bigyan';

  @override
  String get permissionCheckIncompleteContinue => 'Magpatuloy pa rin';

  @override
  String get homeSectionOverdue => 'Overdue';

  @override
  String get homeSectionToday => 'Ngayon';

  @override
  String get homeSectionThisWeek => 'Ngayong linggo';

  @override
  String get homeSectionUpcoming => 'Paparating';

  @override
  String get homeEmptyTitle => 'Wala pang laman dito';

  @override
  String get homeEmptyBody =>
      'Pindutin ang + para idagdag ang una mong paalala o utang na hulugan.';

  @override
  String get fabAddReminder => 'Paalala';

  @override
  String get fabAddLoan => 'Utang na hulugan';

  @override
  String get actionDone => 'Tapos na';

  @override
  String get actionSnooze => 'I-snooze';

  @override
  String get actionEdit => 'I-edit';

  @override
  String get actionDelete => 'Tanggalin';

  @override
  String get actionSave => 'I-save';

  @override
  String get actionCancel => 'Kanselahin';

  @override
  String get actionConfirm => 'Kumpirmahin';

  @override
  String get actionYes => 'Oo';

  @override
  String get actionNo => 'Hindi';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Idagdag';

  @override
  String get actionClose => 'Isara';

  @override
  String get reminderFormTitleNew => 'Bagong paalala';

  @override
  String get reminderFormTitleEdit => 'I-edit ang paalala';

  @override
  String get reminderFieldTitle => 'Pamagat';

  @override
  String get reminderFieldTitleRequired => 'Kailangan ang pamagat';

  @override
  String get reminderFieldDescription => 'Deskripsyon (opsyonal)';

  @override
  String get reminderFieldCategory => 'Kategorya';

  @override
  String get reminderFieldRecurrence => 'Pag-uulit';

  @override
  String get reminderFieldStartDate => 'Petsa ng simula';

  @override
  String get reminderFieldTime => 'Oras ng paalala';

  @override
  String get reminderFieldAdvanceNotice => 'Ipaalam nang maaga';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Araw';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Oras';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minuto';

  @override
  String get reminderFieldRecurrenceDay => 'Araw ng buwan';

  @override
  String get reminderFieldRecurrenceMonth => 'Buwan';

  @override
  String get reminderFieldRecurrenceWeekday => 'Araw ng linggo';

  @override
  String get reminderFieldIntervalDays => 'Bawat N araw';

  @override
  String get reminderFieldLunarDay => 'Araw sa lunar calendar';

  @override
  String get reminderFieldLunarMonth => 'Buwan sa lunar calendar';

  @override
  String get reminderFieldLunarToggle => 'Kalendaryong lunar';

  @override
  String get reminderFieldDailyExclusionToggle => 'Ibukod ang mga araw';

  @override
  String get reminderFieldDailyExclusionKind => 'Uri ng pagbubukod';

  @override
  String get dailyExclusionKindWeekdays => 'Ayon sa araw ng linggo';

  @override
  String get dailyExclusionKindEvenOdd => 'Even/odd na araw';

  @override
  String get dailyExclusionKindSpecificDay => 'Tiyak na araw ng buwan';

  @override
  String get dailyExclusionEvenDays => 'Even';

  @override
  String get dailyExclusionOddDays => 'Odd';

  @override
  String get reminderFieldDailyExclusionDay => 'Araw na ibubukod';

  @override
  String get validationDailyExclusionWeekdays =>
      'Dapat mag-iwan ng kahit isang araw ng linggo';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (lunar)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Tanggalin ang paalalang ito?';

  @override
  String get reminderDeleteConfirmBody => 'Hindi na ito maaaring bawiin.';

  @override
  String get reminderScheduleWarning =>
      'Na-save ang paalala, ngunit hindi ma-schedule ang notification. Suriin ang mga setting ng notification.';

  @override
  String get recurrenceNone => 'Isang beses';

  @override
  String get recurrenceDaily => 'Araw-araw';

  @override
  String get recurrenceWeekly => 'Lingguhan';

  @override
  String get recurrenceMonthly => 'Buwanan';

  @override
  String get recurrenceYearly => 'Taunan';

  @override
  String get recurrenceCustomIntervalDays => 'Bawat N araw';

  @override
  String get recurrenceLunarYearly => 'Taunan (lunar calendar)';

  @override
  String get weekdayMonday => 'Lunes';

  @override
  String get weekdayTuesday => 'Martes';

  @override
  String get weekdayWednesday => 'Miyerkules';

  @override
  String get weekdayThursday => 'Huwebes';

  @override
  String get weekdayFriday => 'Biyernes';

  @override
  String get weekdaySaturday => 'Sabado';

  @override
  String get weekdaySunday => 'Linggo';

  @override
  String get loanListTitle => 'Mga utang at hulugan';

  @override
  String get loanFormTitleNew => 'Bagong utang na hulugan';

  @override
  String get loanFormTitleEdit => 'I-edit ang utang';

  @override
  String get loanFieldName => 'Pangalan';

  @override
  String get loanFieldCategory => 'Kategorya';

  @override
  String get loanFieldTotalAmount => 'Kabuuang halaga (opsyonal)';

  @override
  String get loanFieldInstallmentAmount => 'Halaga bawat hulog';

  @override
  String get loanFieldTotalInstallments => 'Bilang ng hulog';

  @override
  String get loanFieldFrequency => 'Dalas';

  @override
  String get loanFieldDueDayOfMonth => 'Araw ng deadline sa buwan';

  @override
  String get loanFieldStartDate => 'Petsa ng simula';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Paalalahanan N araw bago ang deadline';

  @override
  String get loanFieldNotes => 'Mga tala (opsyonal)';

  @override
  String get loanFrequencyMonthly => 'Buwanan';

  @override
  String get loanFrequencyWeekly => 'Lingguhan';

  @override
  String get loanFrequencyBiweekly => 'Tuwing ikalawang linggo';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total nabayaran na';
  }

  @override
  String get loanMarkPaid => 'Markahang bayad na';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Markahang bayad na ang $count hulog';
  }

  @override
  String get loanStatusPending => 'Nakabinbin';

  @override
  String get loanStatusPaid => 'Bayad na';

  @override
  String get loanStatusOverdue => 'Overdue';

  @override
  String loanInstallmentNumber(int number) {
    return 'Hulog #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Tanggalin ang utang na ito?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Matatanggal din ang lahat ng $count hulog.';
  }

  @override
  String get categoryManagerTitle => 'Mga Kategorya';

  @override
  String get categoryFormTitleNew => 'Bagong kategorya';

  @override
  String get categoryFormTitleEdit => 'I-edit ang kategorya';

  @override
  String get categoryFieldName => 'Pangalan';

  @override
  String get categoryFieldNameRequired => 'Kailangan ang pangalan';

  @override
  String get categoryFieldIcon => 'Icon';

  @override
  String get categoryFieldColor => 'Kulay';

  @override
  String get categoryDeleteSimpleTitle => 'Tanggalin ang kategoryang ito?';

  @override
  String get categoryDeleteSimpleBody =>
      'Walang paalalang gumagamit sa kategoryang ito.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'May mga paalala pa ang kategoryang ito';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return 'May $count paalalang gumagamit ng kategoryang ito. Piliin kung ano ang gagawin sa mga ito.';
  }

  @override
  String get categoryDeleteReassign => 'Ilipat sa ibang kategorya';

  @override
  String get categoryDeleteReassignTarget => 'Ilipat sa';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Tanggalin ang lahat ng $count paalala';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Permanenteng matatanggal ang $count paalala. Hindi na ito maaaring bawiin.';
  }

  @override
  String get categoryReorderHint => 'I-drag para ayusin';

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get settingsLanguage => 'Wika';

  @override
  String get settingsDefaultReminderTime => 'Default na oras ng paalala';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsBackupRestore => 'Backup at restore';

  @override
  String get settingsExport => 'I-export ang backup';

  @override
  String get settingsImport => 'I-restore mula sa backup';

  @override
  String get settingsExportLocationHint =>
      'Naka-save sa Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Na-save ang backup';

  @override
  String get settingsImportNoneFound => 'Walang nahanap na backup file';

  @override
  String get settingsImportPickFile => 'Pumili ng backup';

  @override
  String get settingsImportSuccess => 'Na-restore ang backup';

  @override
  String get settingsImportConfirmTitle => 'I-restore ang backup?';

  @override
  String get settingsImportConfirmBody =>
      'Papalitan nito ang lahat ng kasalukuyang datos ng laman ng backup file.';

  @override
  String get settingsAbout => 'Tungkol sa App';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Hindi tumutunog ang notification sa tamang oras?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Mahigpit na pinipigilan ng ilang gumagawa ng telepono (Samsung, Xiaomi, Oppo...) ang mga app na tumatakbo sa background. Alisin ang battery optimization para sa iReminder sa Settings > Battery ng iyong telepono para siguraduhing dumarating ang mga paalala sa tamang oras.';

  @override
  String get errorGeneric => 'May naganap na error. Pakisubukang muli.';

  @override
  String get errorLoadFailed => 'Hindi ma-load ang datos.';

  @override
  String get validationRequired => 'Kailangan';

  @override
  String get validationDayOfMonth => 'Maglagay ng araw mula 1–31';

  @override
  String get validationMonth => 'Maglagay ng buwan mula 1–12';

  @override
  String get validationPositiveNumber => 'Maglagay ng numerong higit sa 0';

  @override
  String get validationPositiveInteger =>
      'Maglagay ng buong numerong higit sa 0';

  @override
  String get settingsPermissionsSectionTitle => 'Mga Notification at Alarm';

  @override
  String get settingsPermissionsNotificationLabel =>
      'Pahintulot sa notification';

  @override
  String get settingsPermissionsExactAlarmLabel =>
      'Pahintulot sa eksaktong alarm';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Balewalain ang pag-optimize ng baterya (inirerekomenda)';

  @override
  String get settingsTestNotificationAction => 'I-test ang notification (10s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Na-schedule na. I-lock ang iyong screen o umalis sa app ngayon at maghintay ng humigit-kumulang 10 segundo.';

  @override
  String get settingsPermissionsGranted => 'Naipagkaloob na';

  @override
  String get settingsPermissionsDenied =>
      'Hindi pa naipagkakaloob — maaaring hindi tumunog ang mga paalala sa tamang oras';

  @override
  String get settingsPermissionsGrantAction => 'Ipagkaloob';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Buksan ang settings';

  @override
  String get loanMarkPaidSuccess => 'Namarkahang bayad na';

  @override
  String get settingsNotificationPrefsTitle => 'Tunog at pag-vibrate';

  @override
  String get settingsNotificationSound => 'Tunog ng abiso';

  @override
  String get settingsNotificationVibration => 'Pag-vibrate';

  @override
  String get settingsSnoozeDuration => 'Tagal ng pag-snooze';

  @override
  String get snoozeDuration5Min => '5 minuto';

  @override
  String get snoozeDuration10Min => '10 minuto';

  @override
  String get snoozeDuration15Min => '15 minuto';

  @override
  String get snoozeDuration30Min => '30 minuto';

  @override
  String get snoozeDuration60Min => '1 oras';

  @override
  String get snoozeDuration120Min => '2 oras';

  @override
  String get defaultCategoryHomeAppliances => 'Bahay at kagamitan';

  @override
  String get defaultCategoryVehicles => 'Mga sasakyan';

  @override
  String get defaultCategoryFamilyEvents => 'Anibersaryo at pamilya';

  @override
  String get defaultCategoryFinance => 'Pananalapi';

  @override
  String get defaultCategoryWork => 'Trabaho';

  @override
  String get defaultCategoryFamily => 'Pamilya';

  @override
  String get defaultCategoryOutdoorEvents => 'Paglalakbay at mga kaganapan';

  @override
  String get defaultCategoryHealth => 'Kalusugan';

  @override
  String get defaultCategoryBirthday => 'Kaarawan';
}
