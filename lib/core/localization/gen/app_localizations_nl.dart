// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Vandaag';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navLoans => 'Afbetalingen';

  @override
  String get navCategories => 'Categorieën';

  @override
  String get navSettings => 'Instellingen';

  @override
  String get onboardingTitle1 => 'Vergeet nooit meer wat belangrijk is';

  @override
  String get onboardingBody1 =>
      'Houd onderhoud van apparaten, autoservice, jubilea en meer bij — allemaal op één plek.';

  @override
  String get onboardingTitle2 => 'Herhalingen worden eenvoudig';

  @override
  String get onboardingBody2 =>
      'Dagelijks, wekelijks, maandelijks, jaarlijks of zelfs op basis van de maankalender — stel het één keer in en iReminder houdt het bij.';

  @override
  String get onboardingTitle3 => '100% privé, 100% offline';

  @override
  String get onboardingBody3 =>
      'Geen account, geen cloud, geen inloggen. Alles blijft op je telefoon.';

  @override
  String get onboardingSkip => 'Overslaan';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingGetStarted => 'Aan de slag';

  @override
  String get permissionCheckTitle => 'Machtigingen controleren';

  @override
  String get permissionCheckIntro =>
      'iReminder heeft deze 3 machtigingen nodig om je betrouwbaar op het exacte tijdstip te melden. Het verlenen van \"Exact alarm\" kan naar een systeeminstellingenscherm leiden — dat is normaal.';

  @override
  String get permissionCheckContinueAction => 'Doorgaan';

  @override
  String get permissionCheckIncompleteTitle => 'Machtigingen onvolledig';

  @override
  String get permissionCheckIncompleteBody =>
      'Herinneringen werken mogelijk niet betrouwbaar zonder deze machtigingen. Je kunt ze later alsnog verlenen via Instellingen, maar dat wordt makkelijk vergeten.';

  @override
  String get permissionCheckIncompleteStay => 'Terug en verlenen';

  @override
  String get permissionCheckIncompleteContinue => 'Toch doorgaan';

  @override
  String get homeSectionOverdue => 'Verlopen';

  @override
  String get homeSectionToday => 'Vandaag';

  @override
  String get homeSectionThisWeek => 'Deze week';

  @override
  String get homeSectionUpcoming => 'Binnenkort';

  @override
  String get homeEmptyTitle => 'Hier staat nog niets';

  @override
  String get homeEmptyBody =>
      'Tik op + om je eerste herinnering of afbetalingsplan toe te voegen.';

  @override
  String get fabAddReminder => 'Herinnering';

  @override
  String get fabAddLoan => 'Afbetalingsplan';

  @override
  String get actionDone => 'Klaar';

  @override
  String get actionSnooze => 'Uitstellen';

  @override
  String get actionEdit => 'Bewerken';

  @override
  String get actionDelete => 'Verwijderen';

  @override
  String get actionSave => 'Opslaan';

  @override
  String get actionCancel => 'Annuleren';

  @override
  String get actionConfirm => 'Bevestigen';

  @override
  String get actionYes => 'Ja';

  @override
  String get actionNo => 'Nee';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Toevoegen';

  @override
  String get actionClose => 'Sluiten';

  @override
  String get reminderFormTitleNew => 'Nieuwe herinnering';

  @override
  String get reminderFormTitleEdit => 'Herinnering bewerken';

  @override
  String get reminderFieldTitle => 'Titel';

  @override
  String get reminderFieldTitleRequired => 'Titel is verplicht';

  @override
  String get reminderFieldDescription => 'Omschrijving (optioneel)';

  @override
  String get reminderFieldCategory => 'Categorie';

  @override
  String get reminderFieldRecurrence => 'Herhaling';

  @override
  String get reminderFieldStartDate => 'Startdatum';

  @override
  String get reminderFieldTime => 'Herinneringstijd';

  @override
  String get reminderFieldAdvanceNotice => 'Vooraf melden';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Dagen';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Uren';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minuten';

  @override
  String get reminderFieldRecurrenceDay => 'Dag van de maand';

  @override
  String get reminderFieldRecurrenceMonth => 'Maand';

  @override
  String get reminderFieldRecurrenceWeekday => 'Dag van de week';

  @override
  String get reminderFieldIntervalDays => 'Elke N dagen';

  @override
  String get reminderFieldLunarDay => 'Maankalender dag';

  @override
  String get reminderFieldLunarMonth => 'Maankalender maand';

  @override
  String get reminderFieldLunarToggle => 'Maankalender';

  @override
  String get reminderFieldDailyExclusionToggle => 'Dagen uitsluiten';

  @override
  String get reminderFieldDailyExclusionKind => 'Type uitsluiting';

  @override
  String get dailyExclusionKindWeekdays => 'Op weekdag';

  @override
  String get dailyExclusionKindEvenOdd => 'Even/oneven dagen';

  @override
  String get dailyExclusionKindSpecificDay => 'Specifieke dag van de maand';

  @override
  String get dailyExclusionEvenDays => 'Even';

  @override
  String get dailyExclusionOddDays => 'Oneven';

  @override
  String get reminderFieldDailyExclusionDay => 'Uit te sluiten dag';

  @override
  String get validationDailyExclusionWeekdays =>
      'Er moet minstens één weekdag overblijven';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (maan)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Deze herinnering verwijderen?';

  @override
  String get reminderDeleteConfirmBody =>
      'Dit kan niet ongedaan worden gemaakt.';

  @override
  String get reminderScheduleWarning =>
      'Herinnering opgeslagen, maar de melding kon niet worden gepland. Controleer de meldingsinstellingen.';

  @override
  String get recurrenceNone => 'Eenmalig';

  @override
  String get recurrenceDaily => 'Dagelijks';

  @override
  String get recurrenceWeekly => 'Wekelijks';

  @override
  String get recurrenceMonthly => 'Maandelijks';

  @override
  String get recurrenceYearly => 'Jaarlijks';

  @override
  String get recurrenceCustomIntervalDays => 'Elke N dagen';

  @override
  String get recurrenceLunarYearly => 'Jaarlijks (maankalender)';

  @override
  String get weekdayMonday => 'Maandag';

  @override
  String get weekdayTuesday => 'Dinsdag';

  @override
  String get weekdayWednesday => 'Woensdag';

  @override
  String get weekdayThursday => 'Donderdag';

  @override
  String get weekdayFriday => 'Vrijdag';

  @override
  String get weekdaySaturday => 'Zaterdag';

  @override
  String get weekdaySunday => 'Zondag';

  @override
  String get loanListTitle => 'Leningen & afbetalingen';

  @override
  String get loanFormTitleNew => 'Nieuw afbetalingsplan';

  @override
  String get loanFormTitleEdit => 'Afbetalingsplan bewerken';

  @override
  String get loanFieldName => 'Naam';

  @override
  String get loanFieldCategory => 'Categorie';

  @override
  String get loanFieldTotalAmount => 'Totaalbedrag (optioneel)';

  @override
  String get loanFieldInstallmentAmount => 'Bedrag per termijn';

  @override
  String get loanFieldTotalInstallments => 'Aantal termijnen';

  @override
  String get loanFieldFrequency => 'Frequentie';

  @override
  String get loanFieldDueDayOfMonth => 'Vervaldag van de maand';

  @override
  String get loanFieldStartDate => 'Startdatum';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Herinner N dagen voor de vervaldatum';

  @override
  String get loanFieldNotes => 'Notities (optioneel)';

  @override
  String get loanFrequencyMonthly => 'Maandelijks';

  @override
  String get loanFrequencyWeekly => 'Wekelijks';

  @override
  String get loanFrequencyBiweekly => 'Tweewekelijks';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total betaald';
  }

  @override
  String get loanMarkPaid => 'Markeren als betaald';

  @override
  String loanMarkPaidBatch(int count) {
    return '$count termijnen markeren als betaald';
  }

  @override
  String get loanStatusPending => 'In afwachting';

  @override
  String get loanStatusPaid => 'Betaald';

  @override
  String get loanStatusOverdue => 'Verlopen';

  @override
  String loanInstallmentNumber(int number) {
    return 'Termijn #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Dit afbetalingsplan verwijderen?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Alle $count termijnen worden ook verwijderd.';
  }

  @override
  String get categoryManagerTitle => 'Categorieën';

  @override
  String get categoryFormTitleNew => 'Nieuwe categorie';

  @override
  String get categoryFormTitleEdit => 'Categorie bewerken';

  @override
  String get categoryFieldName => 'Naam';

  @override
  String get categoryFieldNameRequired => 'Naam is verplicht';

  @override
  String get categoryFieldIcon => 'Pictogram';

  @override
  String get categoryFieldColor => 'Kleur';

  @override
  String get categoryDeleteSimpleTitle => 'Deze categorie verwijderen?';

  @override
  String get categoryDeleteSimpleBody =>
      'Deze categorie bevat geen herinneringen.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Deze categorie bevat nog herinneringen';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count herinneringen gebruiken deze categorie. Kies wat ermee moet gebeuren.';
  }

  @override
  String get categoryDeleteReassign => 'Verplaatsen naar een andere categorie';

  @override
  String get categoryDeleteReassignTarget => 'Verplaatsen naar';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Alle $count herinneringen verwijderen';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Dit verwijdert $count herinneringen permanent. Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get categoryReorderHint => 'Sleep om te herschikken';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get settingsLanguage => 'Taal';

  @override
  String get settingsDefaultReminderTime => 'Standaard herinneringstijd';

  @override
  String get settingsTheme => 'Thema';

  @override
  String get settingsThemeSystem => 'Systeem';

  @override
  String get settingsThemeLight => 'Licht';

  @override
  String get settingsThemeDark => 'Donker';

  @override
  String get settingsBackupRestore => 'Back-up & herstel';

  @override
  String get settingsExport => 'Back-up exporteren';

  @override
  String get settingsImport => 'Herstellen vanaf back-up';

  @override
  String get settingsExportLocationHint =>
      'Opgeslagen in Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Back-up opgeslagen';

  @override
  String get settingsImportNoneFound => 'Geen back-upbestanden gevonden';

  @override
  String get settingsImportPickFile => 'Kies een back-up';

  @override
  String get settingsImportSuccess => 'Back-up hersteld';

  @override
  String get settingsImportConfirmTitle => 'Back-up herstellen?';

  @override
  String get settingsImportConfirmBody =>
      'Dit vervangt alle huidige gegevens door de inhoud van het back-upbestand.';

  @override
  String get settingsAbout => 'Over';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Komen meldingen niet op tijd binnen?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Sommige telefoonmerken (Samsung, Xiaomi, Oppo...) beperken achtergrondapps agressief. Schakel batterijoptimalisatie voor iReminder uit via Instellingen > Batterij op je telefoon zodat herinneringen altijd op tijd binnenkomen.';

  @override
  String get errorGeneric => 'Er is iets misgegaan. Probeer het opnieuw.';

  @override
  String get errorLoadFailed => 'Gegevens konden niet worden geladen.';

  @override
  String get validationRequired => 'Verplicht';

  @override
  String get validationDayOfMonth => 'Voer een dag in van 1–31';

  @override
  String get validationMonth => 'Voer een maand in van 1–12';

  @override
  String get validationPositiveNumber => 'Voer een getal groter dan 0 in';

  @override
  String get validationPositiveInteger =>
      'Voer een geheel getal groter dan 0 in';

  @override
  String get settingsPermissionsSectionTitle => 'Meldingen & alarmen';

  @override
  String get settingsPermissionsNotificationLabel => 'Meldingstoestemming';

  @override
  String get settingsPermissionsExactAlarmLabel =>
      'Toestemming voor exacte alarmen';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Batterijoptimalisatie negeren (aanbevolen)';

  @override
  String get settingsTestNotificationAction => 'Melding testen (10 sec)';

  @override
  String get settingsTestNotificationScheduled =>
      'Ingepland. Vergrendel je scherm of verlaat de app nu en wacht ongeveer 10 seconden.';

  @override
  String get settingsPermissionsGranted => 'Verleend';

  @override
  String get settingsPermissionsDenied =>
      'Niet verleend — herinneringen komen mogelijk niet op tijd binnen';

  @override
  String get settingsPermissionsGrantAction => 'Toestaan';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Instellingen openen';

  @override
  String get loanMarkPaidSuccess => 'Gemarkeerd als betaald';

  @override
  String get settingsNotificationPrefsTitle => 'Geluid en trilling';

  @override
  String get settingsNotificationSound => 'Meldingsgeluid';

  @override
  String get settingsNotificationVibration => 'Trillen';

  @override
  String get settingsSnoozeDuration => 'Snooze-duur';

  @override
  String get snoozeDuration5Min => '5 minuten';

  @override
  String get snoozeDuration10Min => '10 minuten';

  @override
  String get snoozeDuration15Min => '15 minuten';

  @override
  String get snoozeDuration30Min => '30 minuten';

  @override
  String get snoozeDuration60Min => '1 uur';

  @override
  String get snoozeDuration120Min => '2 uur';

  @override
  String get defaultCategoryHomeAppliances => 'Huis en apparaten';

  @override
  String get defaultCategoryVehicles => 'Voertuigen';

  @override
  String get defaultCategoryFamilyEvents => 'Jubilea en familie';

  @override
  String get defaultCategoryFinance => 'Financiën';

  @override
  String get defaultCategoryWork => 'Werk';

  @override
  String get defaultCategoryFamily => 'Familie';

  @override
  String get defaultCategoryOutdoorEvents => 'Uitjes en evenementen';

  @override
  String get defaultCategoryHealth => 'Gezondheid';

  @override
  String get defaultCategoryBirthday => 'Verjaardagen';
}
