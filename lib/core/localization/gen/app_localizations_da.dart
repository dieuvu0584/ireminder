// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'I dag';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navLoans => 'Lån';

  @override
  String get navCategories => 'Kategorier';

  @override
  String get navSettings => 'Indstillinger';

  @override
  String get onboardingTitle1 => 'Glem aldrig det, der betyder noget';

  @override
  String get onboardingBody1 =>
      'Hold styr på vedligeholdelse af enheder, bilservice, mærkedage og meget mere — alt sammen ét sted.';

  @override
  String get onboardingTitle2 => 'Gentagelser gjort enkle';

  @override
  String get onboardingBody2 =>
      'Dagligt, ugentligt, månedligt, årligt eller endda efter månekalenderen — indstil det én gang, så husker iReminder resten.';

  @override
  String get onboardingTitle3 => '100 % privat, 100 % offline';

  @override
  String get onboardingBody3 =>
      'Ingen konto, ingen sky, intet login. Alt bliver på din telefon.';

  @override
  String get onboardingSkip => 'Spring over';

  @override
  String get onboardingNext => 'Næste';

  @override
  String get onboardingGetStarted => 'Kom i gang';

  @override
  String get permissionCheckTitle => 'Tjek tilladelser';

  @override
  String get permissionCheckIntro =>
      'iReminder skal bruge disse 3 tilladelser for at kunne give dig pålidelige påmindelser præcis på det angivne tidspunkt. At give \"Præcis alarm\" kan åbne en systemindstillingsskærm — det er normalt.';

  @override
  String get permissionCheckContinueAction => 'Fortsæt';

  @override
  String get permissionCheckIncompleteTitle => 'Tilladelser er ufuldstændige';

  @override
  String get permissionCheckIncompleteBody =>
      'Påmindelser udløses muligvis ikke pålideligt uden disse tilladelser. Du kan give dem senere i Indstillinger, men det er let at glemme.';

  @override
  String get permissionCheckIncompleteStay => 'Gå tilbage og giv';

  @override
  String get permissionCheckIncompleteContinue => 'Fortsæt alligevel';

  @override
  String get homeSectionOverdue => 'Overskredet';

  @override
  String get homeSectionToday => 'I dag';

  @override
  String get homeSectionThisWeek => 'Denne uge';

  @override
  String get homeSectionUpcoming => 'Kommende';

  @override
  String get homeEmptyTitle => 'Her er tomt endnu';

  @override
  String get homeEmptyBody =>
      'Tryk på + for at tilføje din første påmindelse eller dit første afdragslån.';

  @override
  String get fabAddReminder => 'Påmindelse';

  @override
  String get fabAddLoan => 'Afdragslån';

  @override
  String get actionDone => 'Udført';

  @override
  String get actionSnooze => 'Udsæt';

  @override
  String get actionEdit => 'Rediger';

  @override
  String get actionDelete => 'Slet';

  @override
  String get actionSave => 'Gem';

  @override
  String get actionCancel => 'Annuller';

  @override
  String get actionConfirm => 'Bekræft';

  @override
  String get actionYes => 'Ja';

  @override
  String get actionNo => 'Nej';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Tilføj';

  @override
  String get actionClose => 'Luk';

  @override
  String get reminderFormTitleNew => 'Ny påmindelse';

  @override
  String get reminderFormTitleEdit => 'Rediger påmindelse';

  @override
  String get reminderFieldTitle => 'Titel';

  @override
  String get reminderFieldTitleRequired => 'Titel er påkrævet';

  @override
  String get reminderFieldDescription => 'Beskrivelse (valgfrit)';

  @override
  String get reminderFieldCategory => 'Kategori';

  @override
  String get reminderFieldRecurrence => 'Gentages';

  @override
  String get reminderFieldStartDate => 'Startdato';

  @override
  String get reminderFieldTime => 'Påmindelsestidspunkt';

  @override
  String get reminderFieldAdvanceNotice => 'Giv besked på forhånd';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Dage';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Timer';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minutter';

  @override
  String get reminderFieldRecurrenceDay => 'Dag i måneden';

  @override
  String get reminderFieldRecurrenceMonth => 'Måned';

  @override
  String get reminderFieldRecurrenceWeekday => 'Ugedag';

  @override
  String get reminderFieldIntervalDays => 'Hver N. dag';

  @override
  String get reminderFieldLunarDay => 'Månekalenderdag';

  @override
  String get reminderFieldLunarMonth => 'Månekalendermåned';

  @override
  String get reminderFieldLunarToggle => 'Månekalender';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (måne)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Slet denne påmindelse?';

  @override
  String get reminderDeleteConfirmBody => 'Dette kan ikke fortrydes.';

  @override
  String get reminderCompletedFeedback => 'Markeret som udført';

  @override
  String get reminderScheduleWarning =>
      'Påmindelsen blev gemt, men underretningen kunne ikke planlægges. Tjek dine underretningsindstillinger.';

  @override
  String get recurrenceNone => 'Én gang';

  @override
  String get recurrenceDaily => 'Dagligt';

  @override
  String get recurrenceWeekly => 'Ugentligt';

  @override
  String get recurrenceMonthly => 'Månedligt';

  @override
  String get recurrenceYearly => 'Årligt';

  @override
  String get recurrenceCustomIntervalDays => 'Hver N. dag';

  @override
  String get recurrenceLunarYearly => 'Årligt (månekalender)';

  @override
  String get weekdayMonday => 'Mandag';

  @override
  String get weekdayTuesday => 'Tirsdag';

  @override
  String get weekdayWednesday => 'Onsdag';

  @override
  String get weekdayThursday => 'Torsdag';

  @override
  String get weekdayFriday => 'Fredag';

  @override
  String get weekdaySaturday => 'Lørdag';

  @override
  String get weekdaySunday => 'Søndag';

  @override
  String get loanListTitle => 'Lån & afdrag';

  @override
  String get loanFormTitleNew => 'Nyt afdragslån';

  @override
  String get loanFormTitleEdit => 'Rediger lån';

  @override
  String get loanFieldName => 'Navn';

  @override
  String get loanFieldCategory => 'Kategori';

  @override
  String get loanFieldTotalAmount => 'Samlet beløb (valgfrit)';

  @override
  String get loanFieldInstallmentAmount => 'Beløb pr. afdrag';

  @override
  String get loanFieldTotalInstallments => 'Antal afdrag';

  @override
  String get loanFieldFrequency => 'Hyppighed';

  @override
  String get loanFieldDueDayOfMonth => 'Forfaldsdag i måneden';

  @override
  String get loanFieldStartDate => 'Startdato';

  @override
  String get loanFieldReminderAdvanceDays => 'Påmind N dage før forfald';

  @override
  String get loanFieldNotes => 'Noter (valgfrit)';

  @override
  String get loanFrequencyMonthly => 'Månedligt';

  @override
  String get loanFrequencyWeekly => 'Ugentligt';

  @override
  String get loanFrequencyBiweekly => 'Hver 14. dag';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total betalt';
  }

  @override
  String get loanMarkPaid => 'Marker som betalt';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Marker $count afdrag som betalt';
  }

  @override
  String get loanStatusPending => 'Afventer';

  @override
  String get loanStatusPaid => 'Betalt';

  @override
  String get loanStatusOverdue => 'Forfalden';

  @override
  String loanInstallmentNumber(int number) {
    return 'Afdrag #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Slet dette lån?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Alle $count afdrag bliver også fjernet.';
  }

  @override
  String get categoryManagerTitle => 'Kategorier';

  @override
  String get categoryFormTitleNew => 'Ny kategori';

  @override
  String get categoryFormTitleEdit => 'Rediger kategori';

  @override
  String get categoryFieldName => 'Navn';

  @override
  String get categoryFieldNameRequired => 'Navn er påkrævet';

  @override
  String get categoryFieldIcon => 'Ikon';

  @override
  String get categoryFieldColor => 'Farve';

  @override
  String get categoryDeleteSimpleTitle => 'Slet denne kategori?';

  @override
  String get categoryDeleteSimpleBody =>
      'Denne kategori indeholder ingen påmindelser.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Denne kategori har stadig påmindelser';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count påmindelser bruger denne kategori. Vælg, hvad der skal ske med dem.';
  }

  @override
  String get categoryDeleteReassign => 'Flyt til en anden kategori';

  @override
  String get categoryDeleteReassignTarget => 'Flyt til';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Slet alle $count påmindelser';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Dette sletter $count påmindelser permanent. Dette kan ikke fortrydes.';
  }

  @override
  String get categoryReorderHint => 'Træk for at ændre rækkefølgen';

  @override
  String get settingsTitle => 'Indstillinger';

  @override
  String get settingsLanguage => 'Sprog';

  @override
  String get settingsDefaultReminderTime => 'Standard påmindelsestidspunkt';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Lyst';

  @override
  String get settingsThemeDark => 'Mørkt';

  @override
  String get settingsBackupRestore => 'Sikkerhedskopi & gendannelse';

  @override
  String get settingsExport => 'Eksporter sikkerhedskopi';

  @override
  String get settingsImport => 'Gendan fra sikkerhedskopi';

  @override
  String get settingsExportLocationHint =>
      'Gemt i Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Sikkerhedskopi gemt';

  @override
  String get settingsImportNoneFound => 'Ingen sikkerhedskopier fundet';

  @override
  String get settingsImportPickFile => 'Vælg en sikkerhedskopi';

  @override
  String get settingsImportSuccess => 'Sikkerhedskopi gendannet';

  @override
  String get settingsImportConfirmTitle => 'Gendan sikkerhedskopi?';

  @override
  String get settingsImportConfirmBody =>
      'Dette erstatter alle nuværende data med indholdet af sikkerhedskopien.';

  @override
  String get settingsAbout => 'Om';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Kommer notifikationer ikke til tiden?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Nogle telefonproducenter (Samsung, Xiaomi, Oppo...) begrænser baggrundsapps meget aggressivt. Slå batterioptimering fra for iReminder under Indstillinger > Batteri på din telefon, så påmindelser altid kommer til tiden.';

  @override
  String get errorGeneric => 'Noget gik galt. Prøv igen.';

  @override
  String get errorLoadFailed => 'Kunne ikke indlæse data.';

  @override
  String get validationRequired => 'Påkrævet';

  @override
  String get validationDayOfMonth => 'Indtast en dag fra 1–31';

  @override
  String get validationMonth => 'Indtast en måned fra 1–12';

  @override
  String get validationPositiveNumber => 'Indtast et tal større end 0';

  @override
  String get validationPositiveInteger => 'Indtast et helt tal større end 0';

  @override
  String get settingsPermissionsSectionTitle => 'Notifikationer & alarmer';

  @override
  String get settingsPermissionsNotificationLabel => 'Notifikationstilladelse';

  @override
  String get settingsPermissionsExactAlarmLabel =>
      'Tilladelse til præcise alarmer';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ignorer batterioptimering (anbefales)';

  @override
  String get settingsTestNotificationAction => 'Test underretning (10 sek.)';

  @override
  String get settingsTestNotificationScheduled =>
      'Planlagt. Lås din skærm, eller forlad appen nu, og vent ca. 10 sekunder.';

  @override
  String get settingsPermissionsGranted => 'Givet';

  @override
  String get settingsPermissionsDenied =>
      'Ikke givet — påmindelser kan udeblive';

  @override
  String get settingsPermissionsGrantAction => 'Giv tilladelse';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Åbn indstillinger';

  @override
  String get loanMarkPaidSuccess => 'Markeret som betalt';

  @override
  String get settingsNotificationPrefsTitle => 'Lyd og vibration';

  @override
  String get settingsNotificationSound => 'Notifikationslyd';

  @override
  String get settingsNotificationVibration => 'Vibration';

  @override
  String get settingsSnoozeDuration => 'Udsættelsestid';

  @override
  String get snoozeDuration5Min => '5 minutter';

  @override
  String get snoozeDuration10Min => '10 minutter';

  @override
  String get snoozeDuration15Min => '15 minutter';

  @override
  String get snoozeDuration30Min => '30 minutter';

  @override
  String get snoozeDuration60Min => '1 time';

  @override
  String get snoozeDuration120Min => '2 timer';

  @override
  String get defaultCategoryHomeAppliances => 'Hjem og apparater';

  @override
  String get defaultCategoryVehicles => 'Køretøjer';

  @override
  String get defaultCategoryFamilyEvents => 'Mærkedage og familie';

  @override
  String get defaultCategoryFinance => 'Økonomi';

  @override
  String get defaultCategoryWork => 'Arbejde';

  @override
  String get defaultCategoryFamily => 'Familie';

  @override
  String get defaultCategoryOutdoorEvents => 'Udflugter og events';

  @override
  String get defaultCategoryHealth => 'Sundhed';

  @override
  String get defaultCategoryBirthday => 'Fødselsdage';
}
