// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Astăzi';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navLoans => 'Rate';

  @override
  String get navCategories => 'Categorii';

  @override
  String get navSettings => 'Setări';

  @override
  String get onboardingTitle1 => 'Nu mai uita ce contează';

  @override
  String get onboardingBody1 =>
      'Urmărește întreținerea aparatelor, service-ul mașinii, aniversările și multe altele — toate într-un singur loc.';

  @override
  String get onboardingTitle2 => 'Recurență simplă';

  @override
  String get onboardingBody2 =>
      'Zilnic, săptămânal, lunar, anual sau chiar după calendarul lunar — setezi o dată, iar iReminder ține evidența.';

  @override
  String get onboardingTitle3 => '100% privat, 100% offline';

  @override
  String get onboardingBody3 =>
      'Fără cont, fără cloud, fără autentificare. Totul rămâne pe telefonul tău.';

  @override
  String get onboardingSkip => 'Sari peste';

  @override
  String get onboardingNext => 'Următorul';

  @override
  String get onboardingGetStarted => 'Începe';

  @override
  String get permissionCheckTitle => 'Verifică permisiunile';

  @override
  String get permissionCheckIntro =>
      'iReminder are nevoie de aceste 3 permisiuni pentru a te anunța fiabil la ora exactă. Acordarea permisiunii \"Alarmă exactă\" poate deschide un ecran de setări de sistem — este normal.';

  @override
  String get permissionCheckContinueAction => 'Continuă';

  @override
  String get permissionCheckIncompleteTitle => 'Permisiuni incomplete';

  @override
  String get permissionCheckIncompleteBody =>
      'Fără aceste permisiuni, mementourile ar putea să nu se declanșeze fiabil. Le poți acorda mai târziu din Setări, dar e ușor să uiți.';

  @override
  String get permissionCheckIncompleteStay => 'Înapoi și acordă';

  @override
  String get permissionCheckIncompleteContinue => 'Continuă oricum';

  @override
  String get homeSectionOverdue => 'Restante';

  @override
  String get homeSectionToday => 'Astăzi';

  @override
  String get homeSectionThisWeek => 'Săptămâna aceasta';

  @override
  String get homeSectionUpcoming => 'Viitoare';

  @override
  String get homeEmptyTitle => 'Încă nimic aici';

  @override
  String get homeEmptyBody =>
      'Apasă + pentru a adăuga primul memento sau prima rată.';

  @override
  String get fabAddReminder => 'Memento';

  @override
  String get fabAddLoan => 'Rată';

  @override
  String get actionDone => 'Gata';

  @override
  String get actionSnooze => 'Amână';

  @override
  String get actionEdit => 'Editează';

  @override
  String get actionDelete => 'Șterge';

  @override
  String get actionSave => 'Salvează';

  @override
  String get actionCancel => 'Anulează';

  @override
  String get actionConfirm => 'Confirmă';

  @override
  String get actionYes => 'Da';

  @override
  String get actionNo => 'Nu';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Adaugă';

  @override
  String get actionClose => 'Închide';

  @override
  String get reminderFormTitleNew => 'Memento nou';

  @override
  String get reminderFormTitleEdit => 'Editează mementoul';

  @override
  String get reminderFieldTitle => 'Titlu';

  @override
  String get reminderFieldTitleRequired => 'Titlul este obligatoriu';

  @override
  String get reminderFieldDescription => 'Descriere (opțional)';

  @override
  String get reminderFieldCategory => 'Categorie';

  @override
  String get reminderFieldRecurrence => 'Se repetă';

  @override
  String get reminderFieldStartDate => 'Data de start';

  @override
  String get reminderFieldTime => 'Ora mementoului';

  @override
  String get reminderFieldAdvanceNotice => 'Anunță în avans';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Zile';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Ore';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minute';

  @override
  String get reminderFieldRecurrenceDay => 'Ziua din lună';

  @override
  String get reminderFieldRecurrenceMonth => 'Luna';

  @override
  String get reminderFieldRecurrenceWeekday => 'Ziua din săptămână';

  @override
  String get reminderFieldIntervalDays => 'La fiecare N zile';

  @override
  String get reminderFieldLunarDay => 'Ziua lunară';

  @override
  String get reminderFieldLunarMonth => 'Luna lunară';

  @override
  String get reminderFieldLunarToggle => 'Calendar lunar';

  @override
  String get reminderFieldDailyExclusionToggle => 'Excludere zile';

  @override
  String get reminderFieldDailyExclusionKind => 'Tip de excludere';

  @override
  String get dailyExclusionKindWeekdays => 'După ziua săptămânii';

  @override
  String get dailyExclusionKindEvenOdd => 'Zile pare/impare';

  @override
  String get dailyExclusionKindSpecificDay => 'Zi specifică din lună';

  @override
  String get dailyExclusionEvenDays => 'Pară';

  @override
  String get dailyExclusionOddDays => 'Impară';

  @override
  String get reminderFieldDailyExclusionDay => 'Ziua de exclus';

  @override
  String get validationDailyExclusionWeekdays =>
      'Trebuie să rămână cel puțin o zi a săptămânii';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Format invalid. Folosiți virgule și liniuțe, ex. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (lunar)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Ștergi acest memento?';

  @override
  String get reminderDeleteConfirmBody =>
      'Această acțiune nu poate fi anulată.';

  @override
  String get reminderScheduleWarning =>
      'Memento salvat, dar notificarea nu a putut fi programată. Verifică setările de notificare.';

  @override
  String get recurrenceNone => 'O singură dată';

  @override
  String get recurrenceDaily => 'Zilnic';

  @override
  String get recurrenceWeekly => 'Săptămânal';

  @override
  String get recurrenceMonthly => 'Lunar';

  @override
  String get recurrenceYearly => 'Anual';

  @override
  String get recurrenceCustomIntervalDays => 'La fiecare N zile';

  @override
  String get recurrenceLunarYearly => 'Anual (calendar lunar)';

  @override
  String get recurrenceLunarMonthly => 'Lunar (calendar lunar)';

  @override
  String get weekdayMonday => 'Luni';

  @override
  String get weekdayTuesday => 'Marți';

  @override
  String get weekdayWednesday => 'Miercuri';

  @override
  String get weekdayThursday => 'Joi';

  @override
  String get weekdayFriday => 'Vineri';

  @override
  String get weekdaySaturday => 'Sâmbătă';

  @override
  String get weekdaySunday => 'Duminică';

  @override
  String get loanListTitle => 'Rate și împrumuturi';

  @override
  String get loanFormTitleNew => 'Rată nouă';

  @override
  String get loanFormTitleEdit => 'Editează rata';

  @override
  String get loanFieldName => 'Nume';

  @override
  String get loanFieldCategory => 'Categorie';

  @override
  String get loanFieldTotalAmount => 'Sumă totală (opțional)';

  @override
  String get loanFieldInstallmentAmount => 'Sumă pe rată';

  @override
  String get loanFieldTotalInstallments => 'Număr de rate';

  @override
  String get loanFieldFrequency => 'Frecvență';

  @override
  String get loanFieldDueDayOfMonth => 'Ziua scadentă din lună';

  @override
  String get loanFieldStartDate => 'Data de start';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Amintește cu N zile înainte de scadență';

  @override
  String get loanFieldNotes => 'Note (opțional)';

  @override
  String get loanFrequencyMonthly => 'Lunar';

  @override
  String get loanFrequencyWeekly => 'Săptămânal';

  @override
  String get loanFrequencyBiweekly => 'La două săptămâni';

  @override
  String get loanFrequencyQuarterly => 'Trimestrial';

  @override
  String get loanFrequencySemiAnnually => 'La fiecare 6 luni';

  @override
  String get loanFrequencyYearly => 'Anual';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total plătite';
  }

  @override
  String get loanMarkPaid => 'Marchează ca plătită';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Marchează $count rate ca plătite';
  }

  @override
  String get loanStatusPending => 'În așteptare';

  @override
  String get loanStatusPaid => 'Plătită';

  @override
  String get loanStatusOverdue => 'Restantă';

  @override
  String loanInstallmentNumber(int number) {
    return 'Rata #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Ștergi această rată?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Toate cele $count rate vor fi eliminate și ele.';
  }

  @override
  String get categoryManagerTitle => 'Categorii';

  @override
  String get categoryFormTitleNew => 'Categorie nouă';

  @override
  String get categoryFormTitleEdit => 'Editează categoria';

  @override
  String get categoryFieldName => 'Nume';

  @override
  String get categoryFieldNameRequired => 'Numele este obligatoriu';

  @override
  String get categoryFieldIcon => 'Pictogramă';

  @override
  String get categoryFieldColor => 'Culoare';

  @override
  String get categoryDeleteSimpleTitle => 'Ștergi această categorie?';

  @override
  String get categoryDeleteSimpleBody =>
      'Această categorie nu conține niciun memento.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Această categorie încă are mementouri';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count mementouri folosesc această categorie. Alege ce vrei să faci cu ele.';
  }

  @override
  String get categoryDeleteReassign => 'Mută în altă categorie';

  @override
  String get categoryDeleteReassignTarget => 'Mută în';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Șterge toate cele $count mementouri';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Aceasta va șterge definitiv $count mementouri. Această acțiune nu poate fi anulată.';
  }

  @override
  String get categoryReorderHint => 'Trage pentru a reordona';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get settingsLanguage => 'Limbă';

  @override
  String get settingsDefaultReminderTime => 'Ora implicită a mementourilor';

  @override
  String get settingsTheme => 'Temă';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Deschisă';

  @override
  String get settingsThemeDark => 'Închisă';

  @override
  String get settingsBackupRestore => 'Backup și restaurare';

  @override
  String get settingsExport => 'Exportă backup';

  @override
  String get settingsImport => 'Restaurează din backup';

  @override
  String get settingsExportLocationHint =>
      'Salvat în Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Backup salvat';

  @override
  String get settingsImportNoneFound => 'Nu s-a găsit niciun fișier de backup';

  @override
  String get settingsImportPickFile => 'Alege un backup';

  @override
  String get settingsImportSuccess => 'Backup restaurat';

  @override
  String get settingsImportConfirmTitle => 'Restaurezi backupul?';

  @override
  String get settingsImportConfirmBody =>
      'Aceasta va înlocui toate datele curente cu conținutul fișierului de backup.';

  @override
  String get settingsAbout => 'Despre';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Notificările nu apar la timp?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Unii producători de telefoane (Samsung, Xiaomi, Oppo...) restricționează agresiv aplicațiile care rulează în fundal. Dezactivează optimizarea bateriei pentru iReminder din Setări > Baterie, ca să te asiguri că mementourile ajung mereu la timp.';

  @override
  String get errorGeneric =>
      'Ceva nu a mers bine. Te rugăm să încerci din nou.';

  @override
  String get errorLoadFailed => 'Datele nu au putut fi încărcate.';

  @override
  String get validationRequired => 'Obligatoriu';

  @override
  String get validationDayOfMonth => 'Introdu o zi între 1 și 31';

  @override
  String get validationMonth => 'Introdu o lună între 1 și 12';

  @override
  String get validationPositiveNumber => 'Introdu un număr mai mare decât 0';

  @override
  String get validationPositiveInteger =>
      'Introdu un număr întreg mai mare decât 0';

  @override
  String get settingsPermissionsSectionTitle => 'Notificări și alarme';

  @override
  String get settingsPermissionsNotificationLabel => 'Permisiune notificări';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Permisiune alarme exacte';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ignoră optimizarea bateriei (recomandat)';

  @override
  String get settingsTestNotificationAction => 'Testează notificarea (10 s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Programat. Blochează ecranul sau părăsește aplicația acum și așteaptă aproximativ 10 secunde.';

  @override
  String get settingsPermissionsGranted => 'Acordată';

  @override
  String get settingsPermissionsDenied =>
      'Neacordată — mementourile ar putea să nu apară la timp';

  @override
  String get settingsPermissionsGrantAction => 'Acordă';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Deschide setările';

  @override
  String get loanMarkPaidSuccess => 'Marcat ca plătit';

  @override
  String get settingsNotificationPrefsTitle => 'Sunet și vibrații';

  @override
  String get settingsNotificationSound => 'Sunet notificare';

  @override
  String get settingsNotificationVibration => 'Vibrații';

  @override
  String get settingsSnoozeDuration => 'Durata amânării';

  @override
  String get snoozeDuration5Min => '5 minute';

  @override
  String get snoozeDuration10Min => '10 minute';

  @override
  String get snoozeDuration15Min => '15 minute';

  @override
  String get snoozeDuration30Min => '30 minute';

  @override
  String get snoozeDuration60Min => '1 oră';

  @override
  String get snoozeDuration120Min => '2 ore';

  @override
  String get defaultCategoryHomeAppliances => 'Casă și electrocasnice';

  @override
  String get defaultCategoryVehicles => 'Vehicule';

  @override
  String get defaultCategoryFamilyEvents => 'Aniversări și familie';

  @override
  String get defaultCategoryFinance => 'Finanțe';

  @override
  String get defaultCategoryWork => 'Muncă';

  @override
  String get defaultCategoryFamily => 'Familie';

  @override
  String get defaultCategoryOutdoorEvents => 'Ieșiri și evenimente';

  @override
  String get defaultCategoryHealth => 'Sănătate';

  @override
  String get defaultCategoryBirthday => 'Zile de naștere';

  @override
  String get defaultCategoryFood => 'Mâncare';
}
