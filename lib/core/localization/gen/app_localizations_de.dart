// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Aufgabenliste';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navLoans => 'Raten';

  @override
  String get navCategories => 'Kategorien';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get onboardingTitle1 => 'Wichtiges nie mehr vergessen';

  @override
  String get onboardingBody1 =>
      'Behalte Gerätewartung, Fahrzeugservice, Jahrestage und mehr im Blick — alles an einem Ort.';

  @override
  String get onboardingTitle2 => 'Wiederholungen ganz einfach';

  @override
  String get onboardingBody2 =>
      'Täglich, wöchentlich, monatlich, jährlich oder sogar nach dem Mondkalender — einmal einrichten, iReminder behält den Überblick.';

  @override
  String get onboardingTitle3 => '100 % privat, 100 % offline';

  @override
  String get onboardingBody3 =>
      'Kein Konto, keine Cloud, kein Login. Alles bleibt auf deinem Telefon.';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingGetStarted => 'Los geht\'s';

  @override
  String get permissionCheckTitle => 'Berechtigungen prüfen';

  @override
  String get permissionCheckIntro =>
      'iReminder benötigt diese 3 Berechtigungen, um dich zuverlässig zur genauen Zeit zu benachrichtigen. Das Erteilen von \"Exakter Alarm\" kann zu einer Systemeinstellungen-Seite führen — das ist normal.';

  @override
  String get permissionCheckContinueAction => 'Weiter';

  @override
  String get permissionCheckIncompleteTitle => 'Berechtigungen unvollständig';

  @override
  String get permissionCheckIncompleteBody =>
      'Ohne diese Berechtigungen werden Erinnerungen möglicherweise nicht zuverlässig ausgelöst. Du kannst sie später in den Einstellungen erteilen, vergisst das aber leicht.';

  @override
  String get permissionCheckIncompleteStay => 'Zurück und erteilen';

  @override
  String get permissionCheckIncompleteContinue => 'Trotzdem fortfahren';

  @override
  String get homeSectionOverdue => 'Überfällig';

  @override
  String get homeSectionToday => 'Heute';

  @override
  String get homeSectionThisWeek => 'Diese Woche';

  @override
  String get homeSectionUpcoming => 'Demnächst';

  @override
  String get homeEmptyTitle => 'Noch nichts hier';

  @override
  String get homeEmptyBody =>
      'Tippe auf +, um deine erste Erinnerung oder Ratenzahlung hinzuzufügen.';

  @override
  String get fabAddReminder => 'Erinnerung';

  @override
  String get fabAddLoan => 'Ratenzahlung';

  @override
  String get actionDone => 'Erledigt';

  @override
  String get actionSnooze => 'Später erinnern';

  @override
  String get actionEdit => 'Bearbeiten';

  @override
  String get actionDelete => 'Löschen';

  @override
  String get actionSave => 'Speichern';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get actionConfirm => 'Bestätigen';

  @override
  String get actionYes => 'Ja';

  @override
  String get actionNo => 'Nein';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Hinzufügen';

  @override
  String get actionClose => 'Schließen';

  @override
  String get reminderFormTitleNew => 'Neue Erinnerung';

  @override
  String get reminderFormTitleEdit => 'Erinnerung bearbeiten';

  @override
  String get reminderFieldTitle => 'Titel';

  @override
  String get reminderFieldTitleRequired => 'Titel ist erforderlich';

  @override
  String get reminderFieldDescription => 'Beschreibung (optional)';

  @override
  String get reminderFieldCategory => 'Kategorie';

  @override
  String get reminderFieldRecurrence => 'Wiederholung';

  @override
  String get reminderFieldStartDate => 'Startdatum';

  @override
  String get reminderFieldTime => 'Erinnerungszeit';

  @override
  String get reminderFieldAdvanceNotice => 'Vorab benachrichtigen';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Tage';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Stunden';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minuten';

  @override
  String get reminderFieldRecurrenceDay => 'Tag des Monats';

  @override
  String get reminderFieldRecurrenceMonth => 'Monat';

  @override
  String get reminderFieldRecurrenceWeekday => 'Wochentag';

  @override
  String get reminderFieldIntervalDays => 'Alle N Tage';

  @override
  String get reminderFieldLunarDay => 'Mondtag';

  @override
  String get reminderFieldLunarMonth => 'Mondmonat';

  @override
  String get reminderFieldLunarToggle => 'Mondkalender';

  @override
  String get reminderFieldDailyExclusionToggle => 'Tage ausschließen';

  @override
  String get reminderFieldDailyExclusionKind => 'Ausschlusstyp';

  @override
  String get dailyExclusionKindWeekdays => 'Nach Wochentag';

  @override
  String get dailyExclusionKindEvenOdd => 'Gerade/ungerade Tage';

  @override
  String get dailyExclusionKindSpecificDay => 'Bestimmter Tag im Monat';

  @override
  String get dailyExclusionEvenDays => 'Gerade';

  @override
  String get dailyExclusionOddDays => 'Ungerade';

  @override
  String get reminderFieldDailyExclusionDay => 'Auszuschließender Tag';

  @override
  String get validationDailyExclusionWeekdays =>
      'Mindestens ein Wochentag muss bleiben';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Ungültiges Format. Verwende Kommas und Bindestriche, z. B. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (Mondkalender)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Diese Erinnerung löschen?';

  @override
  String get reminderDeleteConfirmBody =>
      'Dies kann nicht rückgängig gemacht werden.';

  @override
  String get reminderScheduleWarning =>
      'Erinnerung gespeichert, aber die Benachrichtigung konnte nicht geplant werden. Bitte Benachrichtigungseinstellungen prüfen.';

  @override
  String get recurrenceNone => 'Einmalig';

  @override
  String get recurrenceDaily => 'Täglich';

  @override
  String get recurrenceWeekly => 'Wöchentlich';

  @override
  String get recurrenceMonthly => 'Monatlich';

  @override
  String get recurrenceYearly => 'Jährlich';

  @override
  String get recurrenceCustomIntervalDays => 'Alle N Tage';

  @override
  String get recurrenceLunarYearly => 'Jährlich (Mondkalender)';

  @override
  String get recurrenceLunarMonthly => 'Monatlich (Mondkalender)';

  @override
  String get weekdayMonday => 'Montag';

  @override
  String get weekdayTuesday => 'Dienstag';

  @override
  String get weekdayWednesday => 'Mittwoch';

  @override
  String get weekdayThursday => 'Donnerstag';

  @override
  String get weekdayFriday => 'Freitag';

  @override
  String get weekdaySaturday => 'Samstag';

  @override
  String get weekdaySunday => 'Sonntag';

  @override
  String get loanListTitle => 'Raten & Kredite';

  @override
  String get loanFormTitleNew => 'Neue Ratenzahlung';

  @override
  String get loanFormTitleEdit => 'Ratenzahlung bearbeiten';

  @override
  String get loanFieldName => 'Name';

  @override
  String get loanFieldCategory => 'Kategorie';

  @override
  String get loanFieldTotalAmount => 'Gesamtbetrag (optional)';

  @override
  String get loanFieldInstallmentAmount => 'Betrag pro Rate';

  @override
  String get loanFieldTotalInstallments => 'Anzahl der Raten';

  @override
  String get loanFieldFrequency => 'Häufigkeit';

  @override
  String get loanFieldDueDayOfMonth => 'Fälligkeitstag im Monat';

  @override
  String get loanFieldStartDate => 'Startdatum';

  @override
  String get loanFieldReminderAdvanceDays => 'N Tage vor Fälligkeit erinnern';

  @override
  String get loanFieldNotes => 'Notizen (optional)';

  @override
  String get loanFrequencyMonthly => 'Monatlich';

  @override
  String get loanFrequencyWeekly => 'Wöchentlich';

  @override
  String get loanFrequencyBiweekly => 'Alle zwei Wochen';

  @override
  String get loanFrequencyQuarterly => 'Vierteljährlich';

  @override
  String get loanFrequencySemiAnnually => 'Alle 6 Monate';

  @override
  String get loanFrequencyYearly => 'Jährlich';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total Raten bezahlt';
  }

  @override
  String get loanMarkPaid => 'Als bezahlt markieren';

  @override
  String loanMarkPaidBatch(int count) {
    return '$count Raten als bezahlt markieren';
  }

  @override
  String get loanStatusPending => 'Ausstehend';

  @override
  String get loanStatusPaid => 'Bezahlt';

  @override
  String get loanStatusOverdue => 'Überfällig';

  @override
  String loanInstallmentNumber(int number) {
    return 'Rate Nr. $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Diese Ratenzahlung löschen?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Alle $count Raten werden ebenfalls gelöscht.';
  }

  @override
  String get categoryManagerTitle => 'Kategorien';

  @override
  String get categoryFormTitleNew => 'Neue Kategorie';

  @override
  String get categoryFormTitleEdit => 'Kategorie bearbeiten';

  @override
  String get categoryFieldName => 'Name';

  @override
  String get categoryFieldNameRequired => 'Name ist erforderlich';

  @override
  String get categoryFieldIcon => 'Symbol';

  @override
  String get categoryFieldColor => 'Farbe';

  @override
  String get categoryDeleteSimpleTitle => 'Diese Kategorie löschen?';

  @override
  String get categoryDeleteSimpleBody =>
      'Diese Kategorie enthält keine Erinnerungen.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Diese Kategorie enthält noch Erinnerungen';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count Erinnerungen nutzen diese Kategorie. Wähle, wie damit verfahren werden soll.';
  }

  @override
  String get categoryDeleteReassign => 'In andere Kategorie verschieben';

  @override
  String get categoryDeleteReassignTarget => 'Verschieben nach';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Alle $count Erinnerungen löschen';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Dadurch werden $count Erinnerungen dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get categoryReorderHint => 'Zum Sortieren ziehen';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsDefaultReminderTime => 'Standard-Erinnerungszeit';

  @override
  String get settingsTheme => 'Design';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Hell';

  @override
  String get settingsThemeDark => 'Dunkel';

  @override
  String get settingsBackupRestore => 'Sichern & Wiederherstellen';

  @override
  String get settingsExport => 'Backup exportieren';

  @override
  String get settingsImport => 'Aus Backup wiederherstellen';

  @override
  String get settingsExportLocationHint =>
      'Gespeichert unter Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Backup gespeichert';

  @override
  String get settingsImportNoneFound => 'Keine Sicherungsdateien gefunden';

  @override
  String get settingsImportPickFile => 'Sicherung auswählen';

  @override
  String get settingsImportSuccess => 'Backup wiederhergestellt';

  @override
  String get settingsImportConfirmTitle => 'Backup wiederherstellen?';

  @override
  String get settingsImportConfirmBody =>
      'Dadurch werden alle aktuellen Daten durch den Inhalt der Backup-Datei ersetzt.';

  @override
  String get settingsAbout => 'Über die App';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Benachrichtigungen kommen nicht pünktlich?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Manche Hersteller (Samsung, Xiaomi, Oppo …) schränken Hintergrund-Apps stark ein. Deaktiviere die Akkuoptimierung für iReminder unter Einstellungen > Akku, damit Erinnerungen immer pünktlich ankommen.';

  @override
  String get errorGeneric =>
      'Etwas ist schiefgelaufen. Bitte versuche es erneut.';

  @override
  String get errorLoadFailed => 'Daten konnten nicht geladen werden.';

  @override
  String get validationRequired => 'Erforderlich';

  @override
  String get validationDayOfMonth => 'Tag von 1–31 eingeben';

  @override
  String get validationMonth => 'Monat von 1–12 eingeben';

  @override
  String get validationPositiveNumber => 'Zahl größer als 0 eingeben';

  @override
  String get validationPositiveInteger => 'Ganze Zahl größer als 0 eingeben';

  @override
  String get settingsPermissionsSectionTitle => 'Benachrichtigungen & Alarme';

  @override
  String get settingsPermissionsNotificationLabel =>
      'Benachrichtigungsberechtigung';

  @override
  String get settingsPermissionsExactAlarmLabel =>
      'Berechtigung für exakte Alarme';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Akku-Optimierung ignorieren (empfohlen)';

  @override
  String get settingsTestNotificationAction =>
      'Benachrichtigung testen (10 Sek.)';

  @override
  String get settingsTestNotificationScheduled =>
      'Geplant. Sperre jetzt den Bildschirm oder verlasse die App und warte etwa 10 Sekunden.';

  @override
  String get settingsPermissionsGranted => 'Erteilt';

  @override
  String get settingsPermissionsDenied =>
      'Nicht erteilt — Erinnerungen werden möglicherweise nicht pünktlich angezeigt';

  @override
  String get settingsPermissionsGrantAction => 'Erteilen';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Einstellungen öffnen';

  @override
  String get loanMarkPaidSuccess => 'Als bezahlt markiert';

  @override
  String get settingsNotificationPrefsTitle => 'Ton & Vibration';

  @override
  String get settingsNotificationSound => 'Benachrichtigungston';

  @override
  String get settingsNotificationVibration => 'Vibration';

  @override
  String get settingsSnoozeDuration => 'Schlummerdauer';

  @override
  String get snoozeDuration5Min => '5 Minuten';

  @override
  String get snoozeDuration10Min => '10 Minuten';

  @override
  String get snoozeDuration15Min => '15 Minuten';

  @override
  String get snoozeDuration30Min => '30 Minuten';

  @override
  String get snoozeDuration60Min => '1 Stunde';

  @override
  String get snoozeDuration120Min => '2 Stunden';

  @override
  String get defaultCategoryHomeAppliances => 'Haus & Geräte';

  @override
  String get defaultCategoryVehicles => 'Fahrzeuge';

  @override
  String get defaultCategoryFamilyEvents => 'Jahrestage & Familie';

  @override
  String get defaultCategoryFinance => 'Finanzen';

  @override
  String get defaultCategoryWork => 'Arbeit';

  @override
  String get defaultCategoryFamily => 'Familie';

  @override
  String get defaultCategoryOutdoorEvents => 'Ausflüge & Events';

  @override
  String get defaultCategoryHealth => 'Gesundheit';

  @override
  String get defaultCategoryBirthday => 'Geburtstage';

  @override
  String get defaultCategoryFood => 'Essen';
}
