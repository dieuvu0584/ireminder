// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

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
  String get navSettings => 'Innstillinger';

  @override
  String get navAssistant => 'Assistent';

  @override
  String get onboardingTitle1 => 'Glem aldri det som betyr noe';

  @override
  String get onboardingBody1 =>
      'Hold styr på vedlikehold av enheter, bilservice, merkedager og mer — alt på ett sted.';

  @override
  String get onboardingTitle2 => 'Gjentakelser gjort enkelt';

  @override
  String get onboardingBody2 =>
      'Daglig, ukentlig, månedlig, årlig eller til og med etter månekalenderen — still inn én gang, så holder iReminder styr på resten.';

  @override
  String get onboardingTitle3 => '100 % privat, 100 % offline';

  @override
  String get onboardingBody3 =>
      'Ingen konto, ingen sky, ingen innlogging. Alt blir værende på telefonen din.';

  @override
  String get onboardingSkip => 'Hopp over';

  @override
  String get onboardingNext => 'Neste';

  @override
  String get onboardingGetStarted => 'Kom i gang';

  @override
  String get notificationPermissionTitle => 'Ikke gå glipp av noe';

  @override
  String get notificationPermissionBody =>
      'iReminder trenger tillatelse til å sende deg varsler når noe forfaller.';

  @override
  String get notificationPermissionAllow => 'Tillat varsler';

  @override
  String get notificationPermissionLater => 'Ikke nå';

  @override
  String get homeSectionOverdue => 'Forfalt';

  @override
  String get homeSectionToday => 'I dag';

  @override
  String get homeSectionThisWeek => 'Denne uken';

  @override
  String get homeSectionUpcoming => 'Kommende';

  @override
  String get homeEmptyTitle => 'Ingenting her ennå';

  @override
  String get homeEmptyBody =>
      'Trykk på + for å legge til din første påminnelse eller ditt første nedbetalingslån.';

  @override
  String get fabAddReminder => 'Påminnelse';

  @override
  String get fabAddLoan => 'Nedbetalingslån';

  @override
  String get actionDone => 'Utført';

  @override
  String get actionSnooze => 'Utsett';

  @override
  String get actionEdit => 'Rediger';

  @override
  String get actionDelete => 'Slett';

  @override
  String get actionSave => 'Lagre';

  @override
  String get actionCancel => 'Avbryt';

  @override
  String get actionConfirm => 'Bekreft';

  @override
  String get actionYes => 'Ja';

  @override
  String get actionNo => 'Nei';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Legg til';

  @override
  String get actionClose => 'Lukk';

  @override
  String get reminderFormTitleNew => 'Ny påminnelse';

  @override
  String get reminderFormTitleEdit => 'Rediger påminnelse';

  @override
  String get reminderFieldTitle => 'Tittel';

  @override
  String get reminderFieldTitleRequired => 'Tittel er påkrevd';

  @override
  String get reminderFieldDescription => 'Beskrivelse (valgfritt)';

  @override
  String get reminderFieldCategory => 'Kategori';

  @override
  String get reminderFieldRecurrence => 'Gjentas';

  @override
  String get reminderFieldStartDate => 'Startdato';

  @override
  String get reminderFieldTime => 'Påminnelsestidspunkt';

  @override
  String get reminderFieldAdvanceNotice => 'Varsle N dager i forveien';

  @override
  String get reminderFieldRecurrenceDay => 'Dag i måneden';

  @override
  String get reminderFieldRecurrenceMonth => 'Måned';

  @override
  String get reminderFieldRecurrenceWeekday => 'Ukedag';

  @override
  String get reminderFieldIntervalDays => 'Hver N. dag';

  @override
  String get reminderFieldLunarDay => 'Månekalenderdag';

  @override
  String get reminderFieldLunarMonth => 'Månekalendermåned';

  @override
  String get reminderDeleteConfirmTitle => 'Slette denne påminnelsen?';

  @override
  String get reminderDeleteConfirmBody => 'Dette kan ikke angres.';

  @override
  String get recurrenceNone => 'Én gang';

  @override
  String get recurrenceDaily => 'Daglig';

  @override
  String get recurrenceWeekly => 'Ukentlig';

  @override
  String get recurrenceMonthly => 'Månedlig';

  @override
  String get recurrenceYearly => 'Årlig';

  @override
  String get recurrenceCustomIntervalDays => 'Hver N. dag';

  @override
  String get recurrenceLunarYearly => 'Årlig (månekalender)';

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
  String get loanListTitle => 'Lån og nedbetalinger';

  @override
  String get loanFormTitleNew => 'Nytt nedbetalingslån';

  @override
  String get loanFormTitleEdit => 'Rediger lån';

  @override
  String get loanFieldName => 'Navn';

  @override
  String get loanFieldCategory => 'Kategori';

  @override
  String get loanFieldTotalAmount => 'Totalbeløp (valgfritt)';

  @override
  String get loanFieldInstallmentAmount => 'Beløp per avdrag';

  @override
  String get loanFieldTotalInstallments => 'Antall avdrag';

  @override
  String get loanFieldFrequency => 'Frekvens';

  @override
  String get loanFieldDueDayOfMonth => 'Forfallsdag i måneden';

  @override
  String get loanFieldStartDate => 'Startdato';

  @override
  String get loanFieldReminderAdvanceDays => 'Varsle N dager før forfall';

  @override
  String get loanFieldNotes => 'Notater (valgfritt)';

  @override
  String get loanFrequencyMonthly => 'Månedlig';

  @override
  String get loanFrequencyWeekly => 'Ukentlig';

  @override
  String get loanFrequencyBiweekly => 'Hver 14. dag';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total betalt';
  }

  @override
  String get loanMarkPaid => 'Merk som betalt';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Merk $count avdrag som betalt';
  }

  @override
  String get loanStatusPending => 'Venter';

  @override
  String get loanStatusPaid => 'Betalt';

  @override
  String get loanStatusOverdue => 'Forfalt';

  @override
  String loanInstallmentNumber(int number) {
    return 'Avdrag #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Slette dette lånet?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Alle $count avdrag fjernes også.';
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
  String get categoryFieldNameRequired => 'Navn er påkrevd';

  @override
  String get categoryFieldIcon => 'Ikon';

  @override
  String get categoryFieldColor => 'Farge';

  @override
  String get categoryDeleteSimpleTitle => 'Slette denne kategorien?';

  @override
  String get categoryDeleteSimpleBody =>
      'Denne kategorien har ingen påminnelser.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Denne kategorien har fortsatt påminnelser';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count påminnelser bruker denne kategorien. Velg hva som skal gjøres med dem.';
  }

  @override
  String get categoryDeleteReassign => 'Flytt til en annen kategori';

  @override
  String get categoryDeleteReassignTarget => 'Flytt til';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Slett alle $count påminnelser';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Dette sletter $count påminnelser permanent. Dette kan ikke angres.';
  }

  @override
  String get categoryReorderHint => 'Dra for å endre rekkefølge';

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get settingsLanguage => 'Språk';

  @override
  String get settingsDefaultReminderTime => 'Standard påminnelsestidspunkt';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Lyst';

  @override
  String get settingsThemeDark => 'Mørkt';

  @override
  String get settingsBackupRestore => 'Sikkerhetskopi og gjenoppretting';

  @override
  String get settingsExport => 'Eksporter sikkerhetskopi';

  @override
  String get settingsImport => 'Gjenopprett fra sikkerhetskopi';

  @override
  String get settingsExportLocationHint =>
      'Lagret i Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Sikkerhetskopi lagret';

  @override
  String get settingsImportNoneFound => 'Ingen sikkerhetskopier funnet';

  @override
  String get settingsImportPickFile => 'Velg en sikkerhetskopi';

  @override
  String get settingsImportSuccess => 'Sikkerhetskopi gjenopprettet';

  @override
  String get settingsImportConfirmTitle => 'Gjenopprette sikkerhetskopi?';

  @override
  String get settingsImportConfirmBody =>
      'Dette erstatter alle gjeldende data med innholdet i sikkerhetskopien.';

  @override
  String get settingsAbout => 'Om';

  @override
  String get settingsBatteryOptimizationTitle => 'Kommer ikke varsler i tide?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Enkelte telefonprodusenter (Samsung, Xiaomi, Oppo …) begrenser bakgrunnsapper aggressivt. Slå av batterioptimalisering for iReminder under Innstillinger > Batteri på telefonen din, slik at påminnelser alltid kommer i tide.';

  @override
  String get errorGeneric => 'Noe gikk galt. Prøv igjen.';

  @override
  String get errorLoadFailed => 'Kunne ikke laste inn data.';

  @override
  String get settingsAiSectionTitle => 'KI-assistent';

  @override
  String get settingsAiEnable => 'Slå på KI-assistent';

  @override
  String get settingsAiProvider => 'KI-leverandør';

  @override
  String get settingsAiModel => 'Modell';

  @override
  String get settingsAiApiKey => 'API-nøkkel';

  @override
  String get settingsAiApiKeyHint => 'Lim inn API-nøkkelen din';

  @override
  String get settingsAiApiKeyHelp => 'Hvor finner jeg en nøkkel?';

  @override
  String get settingsAiApiKeySaved => 'API-nøkkel lagret';

  @override
  String get settingsAiAllowedCategories => 'Kategorier assistenten kan lese';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Av som standard. Slå bare på kategoriene du vil at assistenten skal se — ingenting annet blir noensinne sendt.';

  @override
  String get settingsAiClearHistory => 'Slett samtalehistorikk';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Slette samtalehistorikk?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Dette sletter alle spørsmål og svar lagret på denne enheten. Dette kan ikke angres.';

  @override
  String get assistantTitle => 'Assistent';

  @override
  String get assistantEmptyTitle => 'Spør meg om hva som helst';

  @override
  String get assistantEmptyBody =>
      'Prøv «Hva må jeg gjøre denne uken?» eller «Hvor mange avdrag har jeg igjen på motorsykkellånet?»';

  @override
  String get assistantInputHint => 'Spør om noe …';

  @override
  String get assistantSend => 'Send';

  @override
  String get assistantDisabledTitle => 'Assistenten er slått av';

  @override
  String get assistantDisabledBody =>
      'Slå den på i Innstillinger og velg en KI-leverandør for å begynne å chatte.';

  @override
  String get assistantOpenSettings => 'Åpne innstillinger';

  @override
  String get assistantThinking => 'Tenker …';

  @override
  String get validationRequired => 'Påkrevd';

  @override
  String get validationDayOfMonth => 'Angi en dag fra 1–31';

  @override
  String get validationMonth => 'Angi en måned fra 1–12';

  @override
  String get validationPositiveNumber => 'Angi et tall større enn 0';

  @override
  String get validationPositiveInteger => 'Angi et heltall større enn 0';

  @override
  String get settingsPermissionsSectionTitle => 'Varsler og alarmer';

  @override
  String get settingsPermissionsNotificationLabel => 'Varslingstillatelse';

  @override
  String get settingsPermissionsExactAlarmLabel =>
      'Tillatelse til presise alarmer';

  @override
  String get settingsPermissionsGranted => 'Innvilget';

  @override
  String get settingsPermissionsDenied =>
      'Ikke innvilget — påminnelser kommer kanskje ikke i tide';

  @override
  String get settingsPermissionsGrantAction => 'Gi tillatelse';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Åpne innstillinger';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Én tillatelse til';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'På neste skjerm, la iReminder planlegge presise alarmer slik at påminnelser utløses akkurat på tidspunktet du har valgt.';

  @override
  String get loanMarkPaidSuccess => 'Merket som betalt';

  @override
  String get settingsNotificationPrefsTitle => 'Lyd og vibrasjon';

  @override
  String get settingsNotificationSound => 'Varslingslyd';

  @override
  String get settingsNotificationVibration => 'Vibrasjon';

  @override
  String get settingsSnoozeDuration => 'Utsettelsestid';

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
}
