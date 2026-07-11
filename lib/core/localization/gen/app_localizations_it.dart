// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Oggi';

  @override
  String get navCalendar => 'Calendario';

  @override
  String get navLoans => 'Rate';

  @override
  String get navCategories => 'Categorie';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get navAssistant => 'Assistente';

  @override
  String get onboardingTitle1 => 'Non dimenticare mai ciò che conta';

  @override
  String get onboardingBody1 =>
      'Tieni traccia di manutenzioni, tagliandi, anniversari e molto altro — tutto in un unico posto.';

  @override
  String get onboardingTitle2 => 'Le ricorrenze diventano semplici';

  @override
  String get onboardingBody2 =>
      'Giornaliera, settimanale, mensile, annuale o anche secondo il calendario lunare — impostala una volta e iReminder se ne occupa.';

  @override
  String get onboardingTitle3 => '100% privato, 100% offline';

  @override
  String get onboardingBody3 =>
      'Nessun account, nessun cloud, nessun accesso. Tutto resta sul tuo telefono.';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingNext => 'Avanti';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get notificationPermissionTitle => 'Non perdere le scadenze';

  @override
  String get notificationPermissionBody =>
      'iReminder ha bisogno del permesso di inviarti notifiche quando qualcosa è in scadenza.';

  @override
  String get notificationPermissionAllow => 'Consenti notifiche';

  @override
  String get notificationPermissionLater => 'Non ora';

  @override
  String get homeSectionOverdue => 'Scaduti';

  @override
  String get homeSectionToday => 'Oggi';

  @override
  String get homeSectionThisWeek => 'Questa settimana';

  @override
  String get homeSectionUpcoming => 'Prossimi';

  @override
  String get homeEmptyTitle => 'Ancora nulla qui';

  @override
  String get homeEmptyBody =>
      'Tocca + per aggiungere il tuo primo promemoria o piano rateale.';

  @override
  String get fabAddReminder => 'Promemoria';

  @override
  String get fabAddLoan => 'Piano rateale';

  @override
  String get actionDone => 'Fatto';

  @override
  String get actionSnooze => 'Rimanda';

  @override
  String get actionEdit => 'Modifica';

  @override
  String get actionDelete => 'Elimina';

  @override
  String get actionSave => 'Salva';

  @override
  String get actionCancel => 'Annulla';

  @override
  String get actionConfirm => 'Conferma';

  @override
  String get actionYes => 'Sì';

  @override
  String get actionNo => 'No';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Aggiungi';

  @override
  String get actionClose => 'Chiudi';

  @override
  String get reminderFormTitleNew => 'Nuovo promemoria';

  @override
  String get reminderFormTitleEdit => 'Modifica promemoria';

  @override
  String get reminderFieldTitle => 'Titolo';

  @override
  String get reminderFieldTitleRequired => 'Il titolo è obbligatorio';

  @override
  String get reminderFieldDescription => 'Descrizione (facoltativa)';

  @override
  String get reminderFieldCategory => 'Categoria';

  @override
  String get reminderFieldRecurrence => 'Ripeti';

  @override
  String get reminderFieldStartDate => 'Data di inizio';

  @override
  String get reminderFieldTime => 'Orario promemoria';

  @override
  String get reminderFieldAdvanceNotice => 'Avvisa N giorni prima';

  @override
  String get reminderFieldRecurrenceDay => 'Giorno del mese';

  @override
  String get reminderFieldRecurrenceMonth => 'Mese';

  @override
  String get reminderFieldRecurrenceWeekday => 'Giorno della settimana';

  @override
  String get reminderFieldIntervalDays => 'Ogni N giorni';

  @override
  String get reminderFieldLunarDay => 'Giorno lunare';

  @override
  String get reminderFieldLunarMonth => 'Mese lunare';

  @override
  String get reminderFieldLunarToggle => 'Calendario lunare';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (lunare)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Eliminare questo promemoria?';

  @override
  String get reminderDeleteConfirmBody => 'Non potrai annullare l\'operazione.';

  @override
  String get reminderScheduleWarning =>
      'Promemoria salvato, ma non è stato possibile pianificare la notifica. Controlla le impostazioni delle notifiche.';

  @override
  String get recurrenceNone => 'Una volta';

  @override
  String get recurrenceDaily => 'Giornaliera';

  @override
  String get recurrenceWeekly => 'Settimanale';

  @override
  String get recurrenceMonthly => 'Mensile';

  @override
  String get recurrenceYearly => 'Annuale';

  @override
  String get recurrenceCustomIntervalDays => 'Ogni N giorni';

  @override
  String get recurrenceLunarYearly => 'Annuale (calendario lunare)';

  @override
  String get weekdayMonday => 'Lunedì';

  @override
  String get weekdayTuesday => 'Martedì';

  @override
  String get weekdayWednesday => 'Mercoledì';

  @override
  String get weekdayThursday => 'Giovedì';

  @override
  String get weekdayFriday => 'Venerdì';

  @override
  String get weekdaySaturday => 'Sabato';

  @override
  String get weekdaySunday => 'Domenica';

  @override
  String get loanListTitle => 'Rate e finanziamenti';

  @override
  String get loanFormTitleNew => 'Nuovo piano rateale';

  @override
  String get loanFormTitleEdit => 'Modifica piano rateale';

  @override
  String get loanFieldName => 'Nome';

  @override
  String get loanFieldCategory => 'Categoria';

  @override
  String get loanFieldTotalAmount => 'Importo totale (facoltativo)';

  @override
  String get loanFieldInstallmentAmount => 'Importo per rata';

  @override
  String get loanFieldTotalInstallments => 'Numero di rate';

  @override
  String get loanFieldFrequency => 'Frequenza';

  @override
  String get loanFieldDueDayOfMonth => 'Giorno di scadenza del mese';

  @override
  String get loanFieldStartDate => 'Data di inizio';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Ricorda N giorni prima della scadenza';

  @override
  String get loanFieldNotes => 'Note (facoltative)';

  @override
  String get loanFrequencyMonthly => 'Mensile';

  @override
  String get loanFrequencyWeekly => 'Settimanale';

  @override
  String get loanFrequencyBiweekly => 'Bisettimanale';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total pagate';
  }

  @override
  String get loanMarkPaid => 'Segna come pagata';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Segna $count rate come pagate';
  }

  @override
  String get loanStatusPending => 'In attesa';

  @override
  String get loanStatusPaid => 'Pagata';

  @override
  String get loanStatusOverdue => 'Scaduta';

  @override
  String loanInstallmentNumber(int number) {
    return 'Rata n. $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Eliminare questo piano rateale?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Anche tutte le $count rate verranno rimosse.';
  }

  @override
  String get categoryManagerTitle => 'Categorie';

  @override
  String get categoryFormTitleNew => 'Nuova categoria';

  @override
  String get categoryFormTitleEdit => 'Modifica categoria';

  @override
  String get categoryFieldName => 'Nome';

  @override
  String get categoryFieldNameRequired => 'Il nome è obbligatorio';

  @override
  String get categoryFieldIcon => 'Icona';

  @override
  String get categoryFieldColor => 'Colore';

  @override
  String get categoryDeleteSimpleTitle => 'Eliminare questa categoria?';

  @override
  String get categoryDeleteSimpleBody =>
      'Questa categoria non contiene promemoria.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Questa categoria contiene ancora promemoria';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count promemoria usano questa categoria. Scegli cosa fare.';
  }

  @override
  String get categoryDeleteReassign => 'Sposta in un\'altra categoria';

  @override
  String get categoryDeleteReassignTarget => 'Sposta in';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Elimina tutti i $count promemoria';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Questa operazione eliminerà definitivamente $count promemoria. Non potrai annullarla.';
  }

  @override
  String get categoryReorderHint => 'Trascina per riordinare';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsDefaultReminderTime => 'Orario promemoria predefinito';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Chiaro';

  @override
  String get settingsThemeDark => 'Scuro';

  @override
  String get settingsBackupRestore => 'Backup e ripristino';

  @override
  String get settingsExport => 'Esporta backup';

  @override
  String get settingsImport => 'Ripristina da backup';

  @override
  String get settingsExportLocationHint =>
      'Salvato in Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Backup salvato';

  @override
  String get settingsImportNoneFound => 'Nessun file di backup trovato';

  @override
  String get settingsImportPickFile => 'Scegli un backup';

  @override
  String get settingsImportSuccess => 'Backup ripristinato';

  @override
  String get settingsImportConfirmTitle => 'Ripristinare il backup?';

  @override
  String get settingsImportConfirmBody =>
      'Questa operazione sostituirà tutti i dati attuali con quelli del file di backup.';

  @override
  String get settingsAbout => 'Informazioni';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Le notifiche non arrivano in orario?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Alcuni produttori (Samsung, Xiaomi, Oppo...) limitano molto le app in background. Disattiva l\'ottimizzazione della batteria per iReminder in Impostazioni > Batteria del telefono per assicurarti che i promemoria arrivino sempre in tempo.';

  @override
  String get errorGeneric => 'Qualcosa è andato storto. Riprova.';

  @override
  String get errorLoadFailed => 'Impossibile caricare i dati.';

  @override
  String get settingsAiSectionTitle => 'Assistente AI';

  @override
  String get settingsAiEnable => 'Attiva l\'Assistente AI';

  @override
  String get settingsAiProvider => 'Provider AI';

  @override
  String get settingsAiModel => 'Modello';

  @override
  String get settingsAiApiKey => 'Chiave API';

  @override
  String get settingsAiApiKeyHint => 'Incolla la tua chiave API';

  @override
  String get settingsAiApiKeyHelp => 'Dove trovo una chiave?';

  @override
  String get settingsAiApiKeySaved => 'Chiave API salvata';

  @override
  String get settingsAiAllowedCategories =>
      'Categorie leggibili dall\'assistente';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Tutte le categorie tranne Finanze sono condivise per impostazione predefinita — disattiva quelle che non vuoi che l\'assistente veda.';

  @override
  String get settingsAiClearHistory => 'Cancella cronologia chat';

  @override
  String get settingsAiClearHistoryConfirmTitle =>
      'Cancellare la cronologia chat?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Verranno eliminate tutte le domande e risposte salvate su questo dispositivo. Non potrai annullare l\'operazione.';

  @override
  String get assistantTitle => 'Assistente';

  @override
  String get assistantEmptyTitle => 'Chiedimi qualsiasi cosa';

  @override
  String get assistantEmptyBody =>
      'Prova a chiedere \"Cosa devo fare questa settimana?\" oppure \"Quante rate mancano sul mio prestito per la moto?\"';

  @override
  String get assistantInputHint => 'Scrivi qualcosa…';

  @override
  String get assistantSend => 'Invia';

  @override
  String get assistantDisabledTitle => 'L\'assistente è disattivato';

  @override
  String get assistantDisabledBody =>
      'Attivalo nelle Impostazioni e scegli un provider AI per iniziare a chattare.';

  @override
  String get assistantOpenSettings => 'Apri Impostazioni';

  @override
  String get assistantThinking => 'Sto pensando…';

  @override
  String get validationRequired => 'Obbligatorio';

  @override
  String get validationDayOfMonth => 'Inserisci un giorno da 1 a 31';

  @override
  String get validationMonth => 'Inserisci un mese da 1 a 12';

  @override
  String get validationPositiveNumber => 'Inserisci un numero maggiore di 0';

  @override
  String get validationPositiveInteger =>
      'Inserisci un numero intero maggiore di 0';

  @override
  String get settingsPermissionsSectionTitle => 'Notifiche e allarmi';

  @override
  String get settingsPermissionsNotificationLabel => 'Permesso notifiche';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Permesso allarmi precisi';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ignora ottimizzazione batteria (consigliato)';

  @override
  String get settingsTestNotificationAction => 'Prova notifica (10 s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Pianificato. Blocca lo schermo o esci dall\'app ora e attendi circa 10 secondi.';

  @override
  String get settingsPermissionsGranted => 'Concesso';

  @override
  String get settingsPermissionsDenied =>
      'Non concesso — i promemoria potrebbero non arrivare in orario';

  @override
  String get settingsPermissionsGrantAction => 'Concedi';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Apri impostazioni';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Un ultimo permesso';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'Nella prossima schermata, consenti a iReminder di programmare allarmi precisi affinché i promemoria arrivino esattamente all\'ora impostata.';

  @override
  String get loanMarkPaidSuccess => 'Segnata come pagata';

  @override
  String get settingsNotificationPrefsTitle => 'Suono e vibrazione';

  @override
  String get settingsNotificationSound => 'Suono di notifica';

  @override
  String get settingsNotificationVibration => 'Vibrazione';

  @override
  String get settingsSnoozeDuration => 'Durata posticipo';

  @override
  String get snoozeDuration5Min => '5 minuti';

  @override
  String get snoozeDuration10Min => '10 minuti';

  @override
  String get snoozeDuration15Min => '15 minuti';

  @override
  String get snoozeDuration30Min => '30 minuti';

  @override
  String get snoozeDuration60Min => '1 ora';

  @override
  String get snoozeDuration120Min => '2 ore';

  @override
  String get defaultCategoryHomeAppliances => 'Casa ed elettrodomestici';

  @override
  String get defaultCategoryVehicles => 'Veicoli';

  @override
  String get defaultCategoryFamilyEvents => 'Anniversari e famiglia';

  @override
  String get defaultCategoryFinance => 'Finanze';

  @override
  String get defaultCategoryWork => 'Lavoro';

  @override
  String get defaultCategoryFamily => 'Famiglia';

  @override
  String get defaultCategoryOutdoorEvents => 'Gite ed eventi';

  @override
  String get defaultCategoryHealth => 'Salute';

  @override
  String get defaultCategoryBirthday => 'Compleanni';
}
