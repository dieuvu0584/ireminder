// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Aujourd\'hui';

  @override
  String get navCalendar => 'Calendrier';

  @override
  String get navLoans => 'Échéances';

  @override
  String get navCategories => 'Catégories';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get navAssistant => 'Assistant';

  @override
  String get onboardingTitle1 => 'N\'oubliez plus jamais l\'essentiel';

  @override
  String get onboardingBody1 =>
      'Suivez l\'entretien des appareils, la révision du véhicule, les anniversaires et bien plus encore, le tout au même endroit.';

  @override
  String get onboardingTitle2 => 'La récurrence en toute simplicité';

  @override
  String get onboardingBody2 =>
      'Quotidienne, hebdomadaire, mensuelle, annuelle, ou même selon le calendrier lunaire — configurez une fois, iReminder s\'occupe du reste.';

  @override
  String get onboardingTitle3 => '100 % privé, 100 % hors ligne';

  @override
  String get onboardingBody3 =>
      'Pas de compte, pas de cloud, pas de connexion. Tout reste sur votre téléphone.';

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get notificationPermissionTitle => 'Ne manquez rien';

  @override
  String get notificationPermissionBody =>
      'iReminder a besoin de l\'autorisation d\'envoyer des notifications pour vous prévenir à temps.';

  @override
  String get notificationPermissionAllow => 'Autoriser les notifications';

  @override
  String get notificationPermissionLater => 'Plus tard';

  @override
  String get homeSectionOverdue => 'En retard';

  @override
  String get homeSectionToday => 'Aujourd\'hui';

  @override
  String get homeSectionThisWeek => 'Cette semaine';

  @override
  String get homeSectionUpcoming => 'À venir';

  @override
  String get homeEmptyTitle => 'Rien pour l\'instant';

  @override
  String get homeEmptyBody =>
      'Appuyez sur + pour ajouter votre premier rappel ou échéancier.';

  @override
  String get fabAddReminder => 'Rappel';

  @override
  String get fabAddLoan => 'Échéancier';

  @override
  String get actionDone => 'Terminé';

  @override
  String get actionSnooze => 'Reporter';

  @override
  String get actionEdit => 'Modifier';

  @override
  String get actionDelete => 'Supprimer';

  @override
  String get actionSave => 'Enregistrer';

  @override
  String get actionCancel => 'Annuler';

  @override
  String get actionConfirm => 'Confirmer';

  @override
  String get actionYes => 'Oui';

  @override
  String get actionNo => 'Non';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Ajouter';

  @override
  String get actionClose => 'Fermer';

  @override
  String get reminderFormTitleNew => 'Nouveau rappel';

  @override
  String get reminderFormTitleEdit => 'Modifier le rappel';

  @override
  String get reminderFieldTitle => 'Titre';

  @override
  String get reminderFieldTitleRequired => 'Le titre est requis';

  @override
  String get reminderFieldDescription => 'Description (facultatif)';

  @override
  String get reminderFieldCategory => 'Catégorie';

  @override
  String get reminderFieldRecurrence => 'Répétition';

  @override
  String get reminderFieldStartDate => 'Date de début';

  @override
  String get reminderFieldTime => 'Heure du rappel';

  @override
  String get reminderFieldAdvanceNotice => 'Prévenir N jours à l\'avance';

  @override
  String get reminderFieldRecurrenceDay => 'Jour du mois';

  @override
  String get reminderFieldRecurrenceMonth => 'Mois';

  @override
  String get reminderFieldRecurrenceWeekday => 'Jour de la semaine';

  @override
  String get reminderFieldIntervalDays => 'Tous les N jours';

  @override
  String get reminderFieldLunarDay => 'Jour lunaire';

  @override
  String get reminderFieldLunarMonth => 'Mois lunaire';

  @override
  String get reminderDeleteConfirmTitle => 'Supprimer ce rappel ?';

  @override
  String get reminderDeleteConfirmBody => 'Cette action est irréversible.';

  @override
  String get recurrenceNone => 'Une seule fois';

  @override
  String get recurrenceDaily => 'Quotidien';

  @override
  String get recurrenceWeekly => 'Hebdomadaire';

  @override
  String get recurrenceMonthly => 'Mensuel';

  @override
  String get recurrenceYearly => 'Annuel';

  @override
  String get recurrenceCustomIntervalDays => 'Tous les N jours';

  @override
  String get recurrenceLunarYearly => 'Annuel (calendrier lunaire)';

  @override
  String get weekdayMonday => 'Lundi';

  @override
  String get weekdayTuesday => 'Mardi';

  @override
  String get weekdayWednesday => 'Mercredi';

  @override
  String get weekdayThursday => 'Jeudi';

  @override
  String get weekdayFriday => 'Vendredi';

  @override
  String get weekdaySaturday => 'Samedi';

  @override
  String get weekdaySunday => 'Dimanche';

  @override
  String get loanListTitle => 'Échéances & emprunts';

  @override
  String get loanFormTitleNew => 'Nouvel échéancier';

  @override
  String get loanFormTitleEdit => 'Modifier l\'échéancier';

  @override
  String get loanFieldName => 'Nom';

  @override
  String get loanFieldCategory => 'Catégorie';

  @override
  String get loanFieldTotalAmount => 'Montant total (facultatif)';

  @override
  String get loanFieldInstallmentAmount => 'Montant par échéance';

  @override
  String get loanFieldTotalInstallments => 'Nombre d\'échéances';

  @override
  String get loanFieldFrequency => 'Fréquence';

  @override
  String get loanFieldDueDayOfMonth => 'Jour d\'échéance du mois';

  @override
  String get loanFieldStartDate => 'Date de début';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Rappeler N jours avant l\'échéance';

  @override
  String get loanFieldNotes => 'Notes (facultatif)';

  @override
  String get loanFrequencyMonthly => 'Mensuelle';

  @override
  String get loanFrequencyWeekly => 'Hebdomadaire';

  @override
  String get loanFrequencyBiweekly => 'Toutes les deux semaines';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total échéances payées';
  }

  @override
  String get loanMarkPaid => 'Marquer comme payé';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Marquer $count échéances comme payées';
  }

  @override
  String get loanStatusPending => 'En attente';

  @override
  String get loanStatusPaid => 'Payé';

  @override
  String get loanStatusOverdue => 'En retard';

  @override
  String loanInstallmentNumber(int number) {
    return 'Échéance n° $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Supprimer cet échéancier ?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Les $count échéances seront également supprimées.';
  }

  @override
  String get categoryManagerTitle => 'Catégories';

  @override
  String get categoryFormTitleNew => 'Nouvelle catégorie';

  @override
  String get categoryFormTitleEdit => 'Modifier la catégorie';

  @override
  String get categoryFieldName => 'Nom';

  @override
  String get categoryFieldNameRequired => 'Le nom est requis';

  @override
  String get categoryFieldIcon => 'Icône';

  @override
  String get categoryFieldColor => 'Couleur';

  @override
  String get categoryDefaultBadge => 'Par défaut';

  @override
  String get categoryDeleteSimpleTitle => 'Supprimer cette catégorie ?';

  @override
  String get categoryDeleteSimpleBody =>
      'Cette catégorie ne contient aucun rappel.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Cette catégorie contient encore des rappels';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count rappels utilisent cette catégorie. Choisissez comment procéder.';
  }

  @override
  String get categoryDeleteReassign => 'Déplacer vers une autre catégorie';

  @override
  String get categoryDeleteReassignTarget => 'Déplacer vers';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Supprimer les $count rappels';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Cela supprimera définitivement $count rappels. Cette action est irréversible.';
  }

  @override
  String get categoryReorderHint => 'Glisser pour réorganiser';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsDefaultReminderTime => 'Heure de rappel par défaut';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get settingsThemeSystem => 'Système';

  @override
  String get settingsThemeLight => 'Clair';

  @override
  String get settingsThemeDark => 'Sombre';

  @override
  String get settingsBackupRestore => 'Sauvegarde & restauration';

  @override
  String get settingsExport => 'Exporter la sauvegarde';

  @override
  String get settingsImport => 'Restaurer une sauvegarde';

  @override
  String get settingsExportLocationHint =>
      'Saved to Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Sauvegarde enregistrée';

  @override
  String get settingsImportNoneFound => 'No backup files found';

  @override
  String get settingsImportPickFile => 'Choose a backup';

  @override
  String get settingsImportSuccess => 'Sauvegarde restaurée';

  @override
  String get settingsImportConfirmTitle => 'Restaurer la sauvegarde ?';

  @override
  String get settingsImportConfirmBody =>
      'Cela remplacera toutes les données actuelles par le contenu du fichier de sauvegarde.';

  @override
  String get settingsAbout => 'À propos';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Les notifications n\'arrivent pas à l\'heure ?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Certains fabricants (Samsung, Xiaomi, Oppo…) limitent fortement les applications en arrière-plan. Désactivez l\'optimisation de la batterie pour iReminder dans Paramètres > Batterie afin que les rappels arrivent toujours à l\'heure.';

  @override
  String get errorGeneric => 'Une erreur est survenue. Veuillez réessayer.';

  @override
  String get errorLoadFailed => 'Impossible de charger les données.';

  @override
  String get settingsAiSectionTitle => 'AI Assistant';

  @override
  String get settingsAiEnable => 'Enable AI Assistant';

  @override
  String get settingsAiProvider => 'AI provider';

  @override
  String get settingsAiModel => 'Model';

  @override
  String get settingsAiApiKey => 'API key';

  @override
  String get settingsAiApiKeyHint => 'Paste your API key';

  @override
  String get settingsAiApiKeyHelp => 'Where do I get a key?';

  @override
  String get settingsAiApiKeySaved => 'API key saved';

  @override
  String get settingsAiAllowedCategories => 'Categories the assistant can read';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Off by default. Turn on only the categories you want the assistant to see — nothing else is ever sent.';

  @override
  String get settingsAiClearHistory => 'Clear chat history';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Clear chat history?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'This deletes every question and answer stored on this device. This cannot be undone.';

  @override
  String get assistantTitle => 'Assistant';

  @override
  String get assistantEmptyTitle => 'Ask me anything';

  @override
  String get assistantEmptyBody =>
      'Try \"What do I need to do this week?\" or \"How many installments are left on my motorcycle loan?\"';

  @override
  String get assistantInputHint => 'Ask something…';

  @override
  String get assistantSend => 'Send';

  @override
  String get assistantDisabledTitle => 'Assistant is turned off';

  @override
  String get assistantDisabledBody =>
      'Enable it in Settings and pick an AI provider to start chatting.';

  @override
  String get assistantOpenSettings => 'Open Settings';

  @override
  String get assistantThinking => 'Thinking…';
}
