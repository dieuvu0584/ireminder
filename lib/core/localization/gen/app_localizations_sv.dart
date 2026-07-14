// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Idag';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navLoans => 'Avbetalningar';

  @override
  String get navCategories => 'Kategorier';

  @override
  String get navSettings => 'Inställningar';

  @override
  String get onboardingTitle1 => 'Glöm aldrig det som spelar roll';

  @override
  String get onboardingBody1 =>
      'Håll koll på apparatunderhåll, bilservice, årsdagar och mycket mer — allt på ett ställe.';

  @override
  String get onboardingTitle2 => 'Återkommande händelser gjorda enkla';

  @override
  String get onboardingBody2 =>
      'Dagligen, veckovis, månadsvis, årligen eller till och med enligt månkalendern — ställ in det en gång så håller iReminder koll.';

  @override
  String get onboardingTitle3 => '100 % privat, 100 % offline';

  @override
  String get onboardingBody3 =>
      'Inget konto, inget moln, ingen inloggning. Allt stannar på din telefon.';

  @override
  String get onboardingSkip => 'Hoppa över';

  @override
  String get onboardingNext => 'Nästa';

  @override
  String get onboardingGetStarted => 'Kom igång';

  @override
  String get permissionCheckTitle => 'Kontrollera behörigheter';

  @override
  String get permissionCheckIntro =>
      'iReminder behöver dessa 3 behörigheter för att kunna påminna dig pålitligt exakt vid inställd tid. Att bevilja \"Exakt alarm\" kan öppna en systeminställningsskärm — det är normalt.';

  @override
  String get permissionCheckContinueAction => 'Fortsätt';

  @override
  String get permissionCheckIncompleteTitle => 'Behörigheter är ofullständiga';

  @override
  String get permissionCheckIncompleteBody =>
      'Påminnelser kanske inte utlöses pålitligt utan dessa behörigheter. Du kan bevilja dem senare i Inställningar, men det är lätt att glömma.';

  @override
  String get permissionCheckIncompleteStay => 'Gå tillbaka och bevilja';

  @override
  String get permissionCheckIncompleteContinue => 'Fortsätt ändå';

  @override
  String get homeSectionOverdue => 'Försenat';

  @override
  String get homeSectionToday => 'Idag';

  @override
  String get homeSectionThisWeek => 'Denna vecka';

  @override
  String get homeSectionUpcoming => 'Kommande';

  @override
  String get homeEmptyTitle => 'Inget här än';

  @override
  String get homeEmptyBody =>
      'Tryck på + för att lägga till din första påminnelse eller avbetalning.';

  @override
  String get fabAddReminder => 'Påminnelse';

  @override
  String get fabAddLoan => 'Avbetalningslån';

  @override
  String get actionDone => 'Klar';

  @override
  String get actionSnooze => 'Snooza';

  @override
  String get actionEdit => 'Redigera';

  @override
  String get actionDelete => 'Ta bort';

  @override
  String get actionSave => 'Spara';

  @override
  String get actionCancel => 'Avbryt';

  @override
  String get actionConfirm => 'Bekräfta';

  @override
  String get actionYes => 'Ja';

  @override
  String get actionNo => 'Nej';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Lägg till';

  @override
  String get actionClose => 'Stäng';

  @override
  String get reminderFormTitleNew => 'Ny påminnelse';

  @override
  String get reminderFormTitleEdit => 'Redigera påminnelse';

  @override
  String get reminderFieldTitle => 'Titel';

  @override
  String get reminderFieldTitleRequired => 'Titel krävs';

  @override
  String get reminderFieldDescription => 'Beskrivning (valfritt)';

  @override
  String get reminderFieldCategory => 'Kategori';

  @override
  String get reminderFieldRecurrence => 'Upprepas';

  @override
  String get reminderFieldStartDate => 'Startdatum';

  @override
  String get reminderFieldTime => 'Påminnelsetid';

  @override
  String get reminderFieldAdvanceNotice => 'Meddela i förväg';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Dagar';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Timmar';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minuter';

  @override
  String get reminderFieldRecurrenceDay => 'Dag i månaden';

  @override
  String get reminderFieldRecurrenceMonth => 'Månad';

  @override
  String get reminderFieldRecurrenceWeekday => 'Veckodag';

  @override
  String get reminderFieldIntervalDays => 'Var N:e dag';

  @override
  String get reminderFieldLunarDay => 'Dag i månkalendern';

  @override
  String get reminderFieldLunarMonth => 'Månad i månkalendern';

  @override
  String get reminderFieldLunarToggle => 'Månkalender';

  @override
  String get reminderFieldDailyExclusionToggle => 'Uteslut dagar';

  @override
  String get reminderFieldDailyExclusionKind => 'Uteslutningstyp';

  @override
  String get dailyExclusionKindWeekdays => 'Efter veckodag';

  @override
  String get dailyExclusionKindEvenOdd => 'Jämna/udda dagar';

  @override
  String get dailyExclusionKindSpecificDay => 'Viss dag i månaden';

  @override
  String get dailyExclusionEvenDays => 'Jämn';

  @override
  String get dailyExclusionOddDays => 'Udda';

  @override
  String get reminderFieldDailyExclusionDay => 'Dag att utesluta';

  @override
  String get validationDailyExclusionWeekdays =>
      'Minst en veckodag måste finnas kvar';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Ogiltigt format. Använd kommatecken och bindestreck, t.ex. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (mån)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Ta bort denna påminnelse?';

  @override
  String get reminderDeleteConfirmBody => 'Detta kan inte ångras.';

  @override
  String get reminderScheduleWarning =>
      'Påminnelsen sparades, men aviseringen kunde inte schemaläggas. Kontrollera aviseringsinställningarna.';

  @override
  String get recurrenceNone => 'En gång';

  @override
  String get recurrenceDaily => 'Dagligen';

  @override
  String get recurrenceWeekly => 'Varje vecka';

  @override
  String get recurrenceMonthly => 'Varje månad';

  @override
  String get recurrenceYearly => 'Varje år';

  @override
  String get recurrenceCustomIntervalDays => 'Var N:e dag';

  @override
  String get recurrenceLunarYearly => 'Årligen (månkalender)';

  @override
  String get recurrenceLunarMonthly => 'Varje månad (månkalender)';

  @override
  String get weekdayMonday => 'Måndag';

  @override
  String get weekdayTuesday => 'Tisdag';

  @override
  String get weekdayWednesday => 'Onsdag';

  @override
  String get weekdayThursday => 'Torsdag';

  @override
  String get weekdayFriday => 'Fredag';

  @override
  String get weekdaySaturday => 'Lördag';

  @override
  String get weekdaySunday => 'Söndag';

  @override
  String get loanListTitle => 'Lån och avbetalningar';

  @override
  String get loanFormTitleNew => 'Nytt avbetalningslån';

  @override
  String get loanFormTitleEdit => 'Redigera lån';

  @override
  String get loanFieldName => 'Namn';

  @override
  String get loanFieldCategory => 'Kategori';

  @override
  String get loanFieldTotalAmount => 'Totalt belopp (valfritt)';

  @override
  String get loanFieldInstallmentAmount => 'Belopp per avbetalning';

  @override
  String get loanFieldTotalInstallments => 'Antal avbetalningar';

  @override
  String get loanFieldFrequency => 'Frekvens';

  @override
  String get loanFieldDueDayOfMonth => 'Förfallodag i månaden';

  @override
  String get loanFieldStartDate => 'Startdatum';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Påminn N dagar innan förfallodagen';

  @override
  String get loanFieldNotes => 'Anteckningar (valfritt)';

  @override
  String get loanFrequencyMonthly => 'Varje månad';

  @override
  String get loanFrequencyWeekly => 'Varje vecka';

  @override
  String get loanFrequencyBiweekly => 'Varannan vecka';

  @override
  String get loanFrequencyQuarterly => 'Kvartalsvis';

  @override
  String get loanFrequencySemiAnnually => 'Var 6:e månad';

  @override
  String get loanFrequencyYearly => 'Årligen';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total betalda';
  }

  @override
  String get loanMarkPaid => 'Markera som betald';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Markera $count avbetalningar som betalda';
  }

  @override
  String get loanStatusPending => 'Väntande';

  @override
  String get loanStatusPaid => 'Betald';

  @override
  String get loanStatusOverdue => 'Försenad';

  @override
  String loanInstallmentNumber(int number) {
    return 'Avbetalning nr $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Ta bort detta lån?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Alla $count avbetalningar tas också bort.';
  }

  @override
  String get categoryManagerTitle => 'Kategorier';

  @override
  String get categoryFormTitleNew => 'Ny kategori';

  @override
  String get categoryFormTitleEdit => 'Redigera kategori';

  @override
  String get categoryFieldName => 'Namn';

  @override
  String get categoryFieldNameRequired => 'Namn krävs';

  @override
  String get categoryFieldIcon => 'Ikon';

  @override
  String get categoryFieldColor => 'Färg';

  @override
  String get categoryDeleteSimpleTitle => 'Ta bort denna kategori?';

  @override
  String get categoryDeleteSimpleBody =>
      'Den här kategorin har inga påminnelser i sig.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Den här kategorin har fortfarande påminnelser';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count påminnelser använder den här kategorin. Välj vad som ska hända med dem.';
  }

  @override
  String get categoryDeleteReassign => 'Flytta till en annan kategori';

  @override
  String get categoryDeleteReassignTarget => 'Flytta till';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Ta bort alla $count påminnelser';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Detta tar bort $count påminnelser permanent. Detta kan inte ångras.';
  }

  @override
  String get categoryReorderHint => 'Dra för att ändra ordning';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get settingsLanguage => 'Språk';

  @override
  String get settingsDefaultReminderTime => 'Standardtid för påminnelser';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Ljust';

  @override
  String get settingsThemeDark => 'Mörkt';

  @override
  String get settingsBackupRestore => 'Säkerhetskopiering och återställning';

  @override
  String get settingsExport => 'Exportera säkerhetskopia';

  @override
  String get settingsImport => 'Återställ från säkerhetskopia';

  @override
  String get settingsExportLocationHint =>
      'Sparad i Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Säkerhetskopia sparad';

  @override
  String get settingsImportNoneFound => 'Inga säkerhetskopior hittades';

  @override
  String get settingsImportPickFile => 'Välj en säkerhetskopia';

  @override
  String get settingsImportSuccess => 'Säkerhetskopia återställd';

  @override
  String get settingsImportConfirmTitle => 'Återställa säkerhetskopia?';

  @override
  String get settingsImportConfirmBody =>
      'Detta ersätter all aktuell data med innehållet i säkerhetskopian.';

  @override
  String get settingsAbout => 'Om';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Kommer aviseringarna inte i tid?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Vissa telefontillverkare (Samsung, Xiaomi, Oppo...) begränsar bakgrundsappar aggressivt. Stäng av batterioptimering för iReminder under telefonens Inställningar > Batteri för att säkerställa att påminnelser alltid kommer i tid.';

  @override
  String get errorGeneric => 'Något gick fel. Försök igen.';

  @override
  String get errorLoadFailed => 'Det gick inte att läsa in data.';

  @override
  String get validationRequired => 'Obligatoriskt';

  @override
  String get validationDayOfMonth => 'Ange en dag mellan 1 och 31';

  @override
  String get validationMonth => 'Ange en månad mellan 1 och 12';

  @override
  String get validationPositiveNumber => 'Ange ett tal större än 0';

  @override
  String get validationPositiveInteger => 'Ange ett heltal större än 0';

  @override
  String get settingsPermissionsSectionTitle => 'Aviseringar och alarm';

  @override
  String get settingsPermissionsNotificationLabel => 'Aviseringstillstånd';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Tillstånd för exakta alarm';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ignorera batterioptimering (rekommenderas)';

  @override
  String get settingsTestNotificationAction => 'Testa avisering (10 s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Schemalagt. Lås skärmen eller lämna appen nu och vänta cirka 10 sekunder.';

  @override
  String get settingsPermissionsGranted => 'Beviljat';

  @override
  String get settingsPermissionsDenied =>
      'Inte beviljat — påminnelser kanske inte utlöses i tid';

  @override
  String get settingsPermissionsGrantAction => 'Bevilja';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Öppna inställningar';

  @override
  String get loanMarkPaidSuccess => 'Markerad som betald';

  @override
  String get settingsNotificationPrefsTitle => 'Ljud och vibration';

  @override
  String get settingsNotificationSound => 'Aviseringsljud';

  @override
  String get settingsNotificationVibration => 'Vibration';

  @override
  String get settingsSnoozeDuration => 'Snoozetid';

  @override
  String get snoozeDuration5Min => '5 minuter';

  @override
  String get snoozeDuration10Min => '10 minuter';

  @override
  String get snoozeDuration15Min => '15 minuter';

  @override
  String get snoozeDuration30Min => '30 minuter';

  @override
  String get snoozeDuration60Min => '1 timme';

  @override
  String get snoozeDuration120Min => '2 timmar';

  @override
  String get defaultCategoryHomeAppliances => 'Hem och apparater';

  @override
  String get defaultCategoryVehicles => 'Fordon';

  @override
  String get defaultCategoryFamilyEvents => 'Årsdagar och familj';

  @override
  String get defaultCategoryFinance => 'Ekonomi';

  @override
  String get defaultCategoryWork => 'Arbete';

  @override
  String get defaultCategoryFamily => 'Familj';

  @override
  String get defaultCategoryOutdoorEvents => 'Utflykter och event';

  @override
  String get defaultCategoryHealth => 'Hälsa';

  @override
  String get defaultCategoryBirthday => 'Födelsedagar';

  @override
  String get defaultCategoryFood => 'Mat';
}
