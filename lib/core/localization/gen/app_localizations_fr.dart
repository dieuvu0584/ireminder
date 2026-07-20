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
  String get navToday => 'Liste des tâches';

  @override
  String get navCalendar => 'Calendrier';

  @override
  String get navLoans => 'Échéances';

  @override
  String get navCategories => 'Catégories';

  @override
  String get navSettings => 'Paramètres';

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
  String get permissionCheckTitle => 'Vérifier les autorisations';

  @override
  String get permissionCheckIntro =>
      'iReminder a besoin de ces 3 autorisations pour vous notifier de façon fiable à l\'heure exacte. Autoriser \"Alarme exacte\" peut ouvrir un écran des paramètres système — c\'est normal.';

  @override
  String get permissionCheckContinueAction => 'Continuer';

  @override
  String get permissionCheckIncompleteTitle => 'Autorisations incomplètes';

  @override
  String get permissionCheckIncompleteBody =>
      'Les rappels risquent de ne pas se déclencher de façon fiable sans ces autorisations. Vous pourrez les accorder plus tard dans les Paramètres, mais on l\'oublie facilement.';

  @override
  String get permissionCheckIncompleteStay => 'Retour et autoriser';

  @override
  String get permissionCheckIncompleteContinue => 'Continuer quand même';

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
  String get reminderFieldAdvanceNotice => 'Notifier à l\'avance';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Jours';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Heures';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minutes';

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
  String get reminderFieldLunarToggle => 'Calendrier lunaire';

  @override
  String get reminderFieldDailyExclusionToggle => 'Exclure des jours';

  @override
  String get reminderFieldDailyExclusionKind => 'Type d\'exclusion';

  @override
  String get dailyExclusionKindWeekdays => 'Par jour de la semaine';

  @override
  String get dailyExclusionKindEvenOdd => 'Jours pairs/impairs';

  @override
  String get dailyExclusionKindSpecificDay => 'Jour précis du mois';

  @override
  String get dailyExclusionEvenDays => 'Pair';

  @override
  String get dailyExclusionOddDays => 'Impair';

  @override
  String get reminderFieldDailyExclusionDay => 'Jour à exclure';

  @override
  String get validationDailyExclusionWeekdays =>
      'Au moins un jour de la semaine doit rester';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Format invalide. Utilisez des virgules et des tirets, ex. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (lunaire)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Supprimer ce rappel ?';

  @override
  String get reminderDeleteConfirmBody => 'Cette action est irréversible.';

  @override
  String get reminderScheduleWarning =>
      'Rappel enregistré, mais la notification n\'a pas pu être planifiée. Vérifiez les paramètres de notification.';

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
  String get recurrenceLunarMonthly => 'Mensuel (calendrier lunaire)';

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
  String get loanFrequencyQuarterly => 'Trimestriel';

  @override
  String get loanFrequencySemiAnnually => 'Tous les 6 mois';

  @override
  String get loanFrequencyYearly => 'Annuel';

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
      'Enregistré dans Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Sauvegarde enregistrée';

  @override
  String get settingsImportNoneFound => 'Aucune sauvegarde trouvée';

  @override
  String get settingsImportPickFile => 'Choisir une sauvegarde';

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
  String get validationRequired => 'Champ requis';

  @override
  String get validationDayOfMonth => 'Entrez un jour de 1 à 31';

  @override
  String get validationMonth => 'Entrez un mois de 1 à 12';

  @override
  String get validationPositiveNumber => 'Entrez un nombre supérieur à 0';

  @override
  String get validationPositiveInteger => 'Entrez un entier supérieur à 0';

  @override
  String get settingsPermissionsSectionTitle => 'Notifications et alarmes';

  @override
  String get settingsPermissionsNotificationLabel =>
      'Autorisation de notification';

  @override
  String get settingsPermissionsExactAlarmLabel =>
      'Autorisation d\'alarme exacte';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ignorer l\'optimisation de la batterie (recommandé)';

  @override
  String get settingsTestNotificationAction => 'Tester la notification (10 s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Planifié. Verrouillez votre écran ou quittez l\'appli maintenant et attendez environ 10 secondes.';

  @override
  String get settingsPermissionsGranted => 'Accordée';

  @override
  String get settingsPermissionsDenied =>
      'Non accordée — les rappels risquent de ne pas sonner à l\'heure';

  @override
  String get settingsPermissionsGrantAction => 'Autoriser';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Ouvrir les réglages';

  @override
  String get loanMarkPaidSuccess => 'Marqué comme payé';

  @override
  String get settingsNotificationPrefsTitle => 'Son et vibration';

  @override
  String get settingsNotificationSound => 'Son de notification';

  @override
  String get settingsNotificationVibration => 'Vibration';

  @override
  String get settingsSnoozeDuration => 'Durée du rappel';

  @override
  String get snoozeDuration5Min => '5 minutes';

  @override
  String get snoozeDuration10Min => '10 minutes';

  @override
  String get snoozeDuration15Min => '15 minutes';

  @override
  String get snoozeDuration30Min => '30 minutes';

  @override
  String get snoozeDuration60Min => '1 heure';

  @override
  String get snoozeDuration120Min => '2 heures';

  @override
  String get defaultCategoryHomeAppliances => 'Maison et appareils';

  @override
  String get defaultCategoryVehicles => 'Véhicules';

  @override
  String get defaultCategoryFamilyEvents => 'Anniversaires et famille';

  @override
  String get defaultCategoryFinance => 'Finances';

  @override
  String get defaultCategoryWork => 'Travail';

  @override
  String get defaultCategoryFamily => 'Famille';

  @override
  String get defaultCategoryOutdoorEvents => 'Sorties et événements';

  @override
  String get defaultCategoryHealth => 'Santé';

  @override
  String get defaultCategoryBirthday => 'Anniversaires';

  @override
  String get defaultCategoryFood => 'Repas';
}
