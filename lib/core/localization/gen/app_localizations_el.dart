// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Λίστα εργασιών';

  @override
  String get navCalendar => 'Ημερολόγιο';

  @override
  String get navLoans => 'Δόσεις';

  @override
  String get navCategories => 'Κατηγορίες';

  @override
  String get navSettings => 'Ρυθμίσεις';

  @override
  String get onboardingTitle1 => 'Μην ξεχνάς ό,τι έχει σημασία';

  @override
  String get onboardingBody1 =>
      'Παρακολούθησε τη συντήρηση συσκευών, το σέρβις του αυτοκινήτου, επετείους και πολλά άλλα — όλα σε ένα μέρος.';

  @override
  String get onboardingTitle2 => 'Η επανάληψη έγινε απλή';

  @override
  String get onboardingBody2 =>
      'Καθημερινά, εβδομαδιαία, μηνιαία, ετήσια, ακόμα και με το σεληνιακό ημερολόγιο — ρύθμισέ το μία φορά και το iReminder θα το θυμάται.';

  @override
  String get onboardingTitle3 => '100% ιδιωτικό, 100% εκτός σύνδεσης';

  @override
  String get onboardingBody3 =>
      'Χωρίς λογαριασμό, χωρίς cloud, χωρίς σύνδεση. Όλα μένουν στο κινητό σου.';

  @override
  String get onboardingSkip => 'Παράλειψη';

  @override
  String get onboardingNext => 'Επόμενο';

  @override
  String get onboardingGetStarted => 'Ξεκίνα τώρα';

  @override
  String get permissionCheckTitle => 'Έλεγχος δικαιωμάτων';

  @override
  String get permissionCheckIntro =>
      'Το iReminder χρειάζεται αυτές τις 3 άδειες για να σας ειδοποιεί αξιόπιστα την ακριβή ώρα. Η παραχώρηση του \"Ακριβές ξυπνητήρι\" ενδέχεται να ανοίξει μια οθόνη ρυθμίσεων συστήματος — αυτό είναι φυσιολογικό.';

  @override
  String get permissionCheckContinueAction => 'Συνέχεια';

  @override
  String get permissionCheckIncompleteTitle => 'Ελλιπή δικαιώματα';

  @override
  String get permissionCheckIncompleteBody =>
      'Οι υπενθυμίσεις ενδέχεται να μην ενεργοποιούνται αξιόπιστα χωρίς αυτά τα δικαιώματα. Μπορείτε να τα παραχωρήσετε αργότερα από τις Ρυθμίσεις, αλλά είναι εύκολο να το ξεχάσετε.';

  @override
  String get permissionCheckIncompleteStay => 'Επιστροφή και παραχώρηση';

  @override
  String get permissionCheckIncompleteContinue => 'Συνέχεια όπως και να \'χει';

  @override
  String get homeSectionOverdue => 'Ληξιπρόθεσμα';

  @override
  String get homeSectionToday => 'Σήμερα';

  @override
  String get homeSectionThisWeek => 'Αυτή την εβδομάδα';

  @override
  String get homeSectionUpcoming => 'Προσεχώς';

  @override
  String get homeEmptyTitle => 'Δεν υπάρχει τίποτα εδώ ακόμα';

  @override
  String get homeEmptyBody =>
      'Πάτησε το + για να προσθέσεις την πρώτη σου υπενθύμιση ή δόση.';

  @override
  String get fabAddReminder => 'Υπενθύμιση';

  @override
  String get fabAddLoan => 'Δόση δανείου';

  @override
  String get actionDone => 'Ολοκληρώθηκε';

  @override
  String get actionSnooze => 'Αναβολή';

  @override
  String get actionEdit => 'Επεξεργασία';

  @override
  String get actionDelete => 'Διαγραφή';

  @override
  String get actionSave => 'Αποθήκευση';

  @override
  String get actionCancel => 'Ακύρωση';

  @override
  String get actionConfirm => 'Επιβεβαίωση';

  @override
  String get actionYes => 'Ναι';

  @override
  String get actionNo => 'Όχι';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Προσθήκη';

  @override
  String get actionClose => 'Κλείσιμο';

  @override
  String get reminderFormTitleNew => 'Νέα υπενθύμιση';

  @override
  String get reminderFormTitleEdit => 'Επεξεργασία υπενθύμισης';

  @override
  String get reminderFieldTitle => 'Τίτλος';

  @override
  String get reminderFieldTitleRequired => 'Ο τίτλος είναι υποχρεωτικός';

  @override
  String get reminderFieldDescription => 'Περιγραφή (προαιρετικό)';

  @override
  String get reminderFieldCategory => 'Κατηγορία';

  @override
  String get reminderFieldRecurrence => 'Επανάληψη';

  @override
  String get reminderFieldStartDate => 'Ημερομηνία έναρξης';

  @override
  String get reminderFieldTime => 'Ώρα υπενθύμισης';

  @override
  String get reminderFieldAdvanceNotice => 'Ειδοποίηση εκ των προτέρων';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Ημέρες';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Ώρες';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Λεπτά';

  @override
  String get reminderFieldRecurrenceDay => 'Ημέρα του μήνα';

  @override
  String get reminderFieldRecurrenceMonth => 'Μήνας';

  @override
  String get reminderFieldRecurrenceWeekday => 'Ημέρα της εβδομάδας';

  @override
  String get reminderFieldIntervalDays => 'Κάθε N ημέρες';

  @override
  String get reminderFieldLunarDay => 'Σεληνιακή ημέρα';

  @override
  String get reminderFieldLunarMonth => 'Σεληνιακός μήνας';

  @override
  String get reminderFieldLunarToggle => 'Σεληνιακό ημερολόγιο';

  @override
  String get reminderFieldDailyExclusionToggle => 'Εξαίρεση ημερών';

  @override
  String get reminderFieldDailyExclusionKind => 'Τύπος εξαίρεσης';

  @override
  String get dailyExclusionKindWeekdays => 'Κατά ημέρα εβδομάδας';

  @override
  String get dailyExclusionKindEvenOdd => 'Ζυγές/μονές ημέρες';

  @override
  String get dailyExclusionKindSpecificDay => 'Συγκεκριμένη ημέρα του μήνα';

  @override
  String get dailyExclusionEvenDays => 'Ζυγή';

  @override
  String get dailyExclusionOddDays => 'Μονή';

  @override
  String get reminderFieldDailyExclusionDay => 'Ημέρα προς εξαίρεση';

  @override
  String get validationDailyExclusionWeekdays =>
      'Πρέπει να παραμείνει τουλάχιστον μία ημέρα της εβδομάδας';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Μη έγκυρη μορφή. Χρησιμοποιήστε κόμματα και παύλες, π.χ. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (σεληνιακό)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Διαγραφή αυτής της υπενθύμισης;';

  @override
  String get reminderDeleteConfirmBody =>
      'Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String get reminderScheduleWarning =>
      'Η υπενθύμιση αποθηκεύτηκε, αλλά η ειδοποίηση δεν προγραμματίστηκε. Ελέγξτε τις ρυθμίσεις ειδοποιήσεων.';

  @override
  String get recurrenceNone => 'Μία φορά';

  @override
  String get recurrenceDaily => 'Καθημερινά';

  @override
  String get recurrenceWeekly => 'Εβδομαδιαία';

  @override
  String get recurrenceMonthly => 'Μηνιαία';

  @override
  String get recurrenceYearly => 'Ετήσια';

  @override
  String get recurrenceCustomIntervalDays => 'Κάθε N ημέρες';

  @override
  String get recurrenceLunarYearly => 'Ετήσια (σεληνιακό ημερολόγιο)';

  @override
  String get recurrenceLunarMonthly => 'Μηνιαία (σεληνιακό ημερολόγιο)';

  @override
  String get weekdayMonday => 'Δευτέρα';

  @override
  String get weekdayTuesday => 'Τρίτη';

  @override
  String get weekdayWednesday => 'Τετάρτη';

  @override
  String get weekdayThursday => 'Πέμπτη';

  @override
  String get weekdayFriday => 'Παρασκευή';

  @override
  String get weekdaySaturday => 'Σάββατο';

  @override
  String get weekdaySunday => 'Κυριακή';

  @override
  String get loanListTitle => 'Δάνεια & δόσεις';

  @override
  String get loanFormTitleNew => 'Νέο δάνειο με δόσεις';

  @override
  String get loanFormTitleEdit => 'Επεξεργασία δανείου';

  @override
  String get loanFieldName => 'Όνομα';

  @override
  String get loanFieldCategory => 'Κατηγορία';

  @override
  String get loanFieldTotalAmount => 'Συνολικό ποσό (προαιρετικό)';

  @override
  String get loanFieldInstallmentAmount => 'Ποσό ανά δόση';

  @override
  String get loanFieldTotalInstallments => 'Αριθμός δόσεων';

  @override
  String get loanFieldFrequency => 'Συχνότητα';

  @override
  String get loanFieldDueDayOfMonth => 'Ημέρα λήξης στον μήνα';

  @override
  String get loanFieldStartDate => 'Ημερομηνία έναρξης';

  @override
  String get loanFieldReminderAdvanceDays => 'Υπενθύμιση N ημέρες πριν τη λήξη';

  @override
  String get loanFieldNotes => 'Σημειώσεις (προαιρετικό)';

  @override
  String get loanFrequencyMonthly => 'Μηνιαία';

  @override
  String get loanFrequencyWeekly => 'Εβδομαδιαία';

  @override
  String get loanFrequencyBiweekly => 'Ανά δεκαπενθήμερο';

  @override
  String get loanFrequencyQuarterly => 'Τριμηνιαία';

  @override
  String get loanFrequencySemiAnnually => 'Κάθε 6 μήνες';

  @override
  String get loanFrequencyYearly => 'Ετησίως';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total πληρωμένες';
  }

  @override
  String get loanMarkPaid => 'Σήμανση ως πληρωμένη';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Σήμανση $count δόσεων ως πληρωμένων';
  }

  @override
  String get loanStatusPending => 'Εκκρεμεί';

  @override
  String get loanStatusPaid => 'Πληρωμένη';

  @override
  String get loanStatusOverdue => 'Ληξιπρόθεσμη';

  @override
  String loanInstallmentNumber(int number) {
    return 'Δόση #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Διαγραφή αυτού του δανείου;';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Θα διαγραφούν και οι $count δόσεις.';
  }

  @override
  String get categoryManagerTitle => 'Κατηγορίες';

  @override
  String get categoryFormTitleNew => 'Νέα κατηγορία';

  @override
  String get categoryFormTitleEdit => 'Επεξεργασία κατηγορίας';

  @override
  String get categoryFieldName => 'Όνομα';

  @override
  String get categoryFieldNameRequired => 'Το όνομα είναι υποχρεωτικό';

  @override
  String get categoryFieldIcon => 'Εικονίδιο';

  @override
  String get categoryFieldColor => 'Χρώμα';

  @override
  String get categoryDeleteSimpleTitle => 'Διαγραφή αυτής της κατηγορίας;';

  @override
  String get categoryDeleteSimpleBody =>
      'Αυτή η κατηγορία δεν περιέχει υπενθυμίσεις.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Αυτή η κατηγορία περιέχει ακόμα υπενθυμίσεις';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count υπενθυμίσεις χρησιμοποιούν αυτή την κατηγορία. Επίλεξε τι θέλεις να κάνεις με αυτές.';
  }

  @override
  String get categoryDeleteReassign => 'Μετακίνηση σε άλλη κατηγορία';

  @override
  String get categoryDeleteReassignTarget => 'Μετακίνηση σε';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Διαγραφή και των $count υπενθυμίσεων';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Αυτό θα διαγράψει οριστικά $count υπενθυμίσεις. Η ενέργεια δεν μπορεί να αναιρεθεί.';
  }

  @override
  String get categoryReorderHint => 'Σύρε για αναδιάταξη';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get settingsLanguage => 'Γλώσσα';

  @override
  String get settingsDefaultReminderTime => 'Προεπιλεγμένη ώρα υπενθύμισης';

  @override
  String get settingsTheme => 'Θέμα';

  @override
  String get settingsThemeSystem => 'Σύστημα';

  @override
  String get settingsThemeLight => 'Φωτεινό';

  @override
  String get settingsThemeDark => 'Σκοτεινό';

  @override
  String get settingsBackupRestore => 'Αντίγραφο ασφαλείας & επαναφορά';

  @override
  String get settingsExport => 'Εξαγωγή αντιγράφου ασφαλείας';

  @override
  String get settingsImport => 'Επαναφορά από αντίγραφο ασφαλείας';

  @override
  String get settingsExportLocationHint =>
      'Αποθηκεύτηκε στο Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Το αντίγραφο ασφαλείας αποθηκεύτηκε';

  @override
  String get settingsImportNoneFound =>
      'Δεν βρέθηκαν αρχεία αντιγράφων ασφαλείας';

  @override
  String get settingsImportPickFile => 'Επίλεξε αντίγραφο ασφαλείας';

  @override
  String get settingsImportSuccess => 'Το αντίγραφο ασφαλείας επαναφέρθηκε';

  @override
  String get settingsImportConfirmTitle => 'Επαναφορά αντιγράφου ασφαλείας;';

  @override
  String get settingsImportConfirmBody =>
      'Αυτό θα αντικαταστήσει όλα τα τρέχοντα δεδομένα με το περιεχόμενο του αρχείου αντιγράφου ασφαλείας.';

  @override
  String get settingsAbout => 'Σχετικά';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Οι ειδοποιήσεις δεν εμφανίζονται στην ώρα τους;';

  @override
  String get settingsBatteryOptimizationBody =>
      'Ορισμένοι κατασκευαστές (Samsung, Xiaomi, Oppo...) περιορίζουν έντονα τις εφαρμογές παρασκηνίου. Απενεργοποίησε τη βελτιστοποίηση μπαταρίας για το iReminder από Ρυθμίσεις > Μπαταρία, ώστε οι υπενθυμίσεις να φτάνουν πάντα στην ώρα τους.';

  @override
  String get errorGeneric => 'Κάτι πήγε στραβά. Δοκίμασε ξανά.';

  @override
  String get errorLoadFailed => 'Δεν ήταν δυνατή η φόρτωση των δεδομένων.';

  @override
  String get validationRequired => 'Υποχρεωτικό';

  @override
  String get validationDayOfMonth => 'Εισάγετε μια ημέρα από 1–31';

  @override
  String get validationMonth => 'Εισάγετε έναν μήνα από 1–12';

  @override
  String get validationPositiveNumber =>
      'Εισάγετε έναν αριθμό μεγαλύτερο από 0';

  @override
  String get validationPositiveInteger =>
      'Εισάγετε έναν ακέραιο αριθμό μεγαλύτερο από 0';

  @override
  String get settingsPermissionsSectionTitle => 'Ειδοποιήσεις & Ξυπνητήρια';

  @override
  String get settingsPermissionsNotificationLabel => 'Άδεια ειδοποιήσεων';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Άδεια ακριβών ξυπνητηριών';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Παράβλεψη βελτιστοποίησης μπαταρίας (προτείνεται)';

  @override
  String get settingsTestNotificationAction => 'Δοκιμή ειδοποίησης (10 δ)';

  @override
  String get settingsTestNotificationScheduled =>
      'Προγραμματίστηκε. Κλειδώστε την οθόνη ή κλείστε την εφαρμογή τώρα και περιμένετε περίπου 10 δευτερόλεπτα.';

  @override
  String get settingsPermissionsGranted => 'Παραχωρήθηκε';

  @override
  String get settingsPermissionsDenied =>
      'Δεν έχει παραχωρηθεί — οι υπενθυμίσεις ενδέχεται να μην εμφανίζονται στην ώρα τους';

  @override
  String get settingsPermissionsGrantAction => 'Παραχώρηση';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Άνοιγμα ρυθμίσεων';

  @override
  String get loanMarkPaidSuccess => 'Σημειώθηκε ως πληρωμένη';

  @override
  String get settingsNotificationPrefsTitle => 'Ήχος & δόνηση';

  @override
  String get settingsNotificationSound => 'Ήχος ειδοποίησης';

  @override
  String get settingsNotificationVibration => 'Δόνηση';

  @override
  String get settingsSnoozeDuration => 'Διάρκεια αναβολής';

  @override
  String get snoozeDuration5Min => '5 λεπτά';

  @override
  String get snoozeDuration10Min => '10 λεπτά';

  @override
  String get snoozeDuration15Min => '15 λεπτά';

  @override
  String get snoozeDuration30Min => '30 λεπτά';

  @override
  String get snoozeDuration60Min => '1 ώρα';

  @override
  String get snoozeDuration120Min => '2 ώρες';

  @override
  String get defaultCategoryHomeAppliances => 'Σπίτι & συσκευές';

  @override
  String get defaultCategoryVehicles => 'Οχήματα';

  @override
  String get defaultCategoryFamilyEvents => 'Επέτειοι & οικογένεια';

  @override
  String get defaultCategoryFinance => 'Οικονομικά';

  @override
  String get defaultCategoryWork => 'Εργασία';

  @override
  String get defaultCategoryFamily => 'Οικογένεια';

  @override
  String get defaultCategoryOutdoorEvents => 'Εκδρομές & εκδηλώσεις';

  @override
  String get defaultCategoryHealth => 'Υγεία';

  @override
  String get defaultCategoryBirthday => 'Γενέθλια';

  @override
  String get defaultCategoryFood => 'Φαγητό';
}
