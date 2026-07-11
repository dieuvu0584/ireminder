// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Dziś';

  @override
  String get navCalendar => 'Kalendarz';

  @override
  String get navLoans => 'Raty';

  @override
  String get navCategories => 'Kategorie';

  @override
  String get navSettings => 'Ustawienia';

  @override
  String get navAssistant => 'Asystent';

  @override
  String get onboardingTitle1 => 'Nigdy nie zapomnij o ważnych sprawach';

  @override
  String get onboardingBody1 =>
      'Śledź konserwację urządzeń, przeglądy samochodu, rocznice i wiele więcej — wszystko w jednym miejscu.';

  @override
  String get onboardingTitle2 => 'Powtarzanie w prosty sposób';

  @override
  String get onboardingBody2 =>
      'Codziennie, co tydzień, co miesiąc, co rok, a nawet według kalendarza księżycowego — ustaw raz, a iReminder zapamięta za Ciebie.';

  @override
  String get onboardingTitle3 => '100% prywatności, 100% offline';

  @override
  String get onboardingBody3 =>
      'Bez konta, bez chmury, bez logowania. Wszystko zostaje na Twoim telefonie.';

  @override
  String get onboardingSkip => 'Pomiń';

  @override
  String get onboardingNext => 'Dalej';

  @override
  String get onboardingGetStarted => 'Zaczynajmy';

  @override
  String get notificationPermissionTitle => 'Nie przegap terminu';

  @override
  String get notificationPermissionBody =>
      'iReminder potrzebuje zgody na wysyłanie powiadomień, gdy zbliża się termin.';

  @override
  String get notificationPermissionAllow => 'Zezwól na powiadomienia';

  @override
  String get notificationPermissionLater => 'Nie teraz';

  @override
  String get homeSectionOverdue => 'Zaległe';

  @override
  String get homeSectionToday => 'Dziś';

  @override
  String get homeSectionThisWeek => 'W tym tygodniu';

  @override
  String get homeSectionUpcoming => 'Nadchodzące';

  @override
  String get homeEmptyTitle => 'Nic tu jeszcze nie ma';

  @override
  String get homeEmptyBody =>
      'Stuknij +, aby dodać pierwsze przypomnienie lub ratę.';

  @override
  String get fabAddReminder => 'Przypomnienie';

  @override
  String get fabAddLoan => 'Rata';

  @override
  String get actionDone => 'Gotowe';

  @override
  String get actionSnooze => 'Przełóż';

  @override
  String get actionEdit => 'Edytuj';

  @override
  String get actionDelete => 'Usuń';

  @override
  String get actionSave => 'Zapisz';

  @override
  String get actionCancel => 'Anuluj';

  @override
  String get actionConfirm => 'Potwierdź';

  @override
  String get actionYes => 'Tak';

  @override
  String get actionNo => 'Nie';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Dodaj';

  @override
  String get actionClose => 'Zamknij';

  @override
  String get reminderFormTitleNew => 'Nowe przypomnienie';

  @override
  String get reminderFormTitleEdit => 'Edytuj przypomnienie';

  @override
  String get reminderFieldTitle => 'Tytuł';

  @override
  String get reminderFieldTitleRequired => 'Tytuł jest wymagany';

  @override
  String get reminderFieldDescription => 'Opis (opcjonalnie)';

  @override
  String get reminderFieldCategory => 'Kategoria';

  @override
  String get reminderFieldRecurrence => 'Powtarzanie';

  @override
  String get reminderFieldStartDate => 'Data rozpoczęcia';

  @override
  String get reminderFieldTime => 'Godzina przypomnienia';

  @override
  String get reminderFieldAdvanceNotice => 'Powiadom N dni wcześniej';

  @override
  String get reminderFieldRecurrenceDay => 'Dzień miesiąca';

  @override
  String get reminderFieldRecurrenceMonth => 'Miesiąc';

  @override
  String get reminderFieldRecurrenceWeekday => 'Dzień tygodnia';

  @override
  String get reminderFieldIntervalDays => 'Co N dni';

  @override
  String get reminderFieldLunarDay => 'Dzień księżycowy';

  @override
  String get reminderFieldLunarMonth => 'Miesiąc księżycowy';

  @override
  String get reminderFieldLunarToggle => 'Kalendarz księżycowy';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (księżycowy)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Usunąć to przypomnienie?';

  @override
  String get reminderDeleteConfirmBody => 'Tej operacji nie można cofnąć.';

  @override
  String get reminderCompletedFeedback => 'Oznaczono jako wykonane';

  @override
  String get reminderScheduleWarning =>
      'Przypomnienie zapisane, ale nie udało się zaplanować powiadomienia. Sprawdź ustawienia powiadomień.';

  @override
  String get recurrenceNone => 'Jednorazowo';

  @override
  String get recurrenceDaily => 'Codziennie';

  @override
  String get recurrenceWeekly => 'Co tydzień';

  @override
  String get recurrenceMonthly => 'Co miesiąc';

  @override
  String get recurrenceYearly => 'Co rok';

  @override
  String get recurrenceCustomIntervalDays => 'Co N dni';

  @override
  String get recurrenceLunarYearly => 'Co rok (kalendarz księżycowy)';

  @override
  String get weekdayMonday => 'Poniedziałek';

  @override
  String get weekdayTuesday => 'Wtorek';

  @override
  String get weekdayWednesday => 'Środa';

  @override
  String get weekdayThursday => 'Czwartek';

  @override
  String get weekdayFriday => 'Piątek';

  @override
  String get weekdaySaturday => 'Sobota';

  @override
  String get weekdaySunday => 'Niedziela';

  @override
  String get loanListTitle => 'Raty i pożyczki';

  @override
  String get loanFormTitleNew => 'Nowa rata';

  @override
  String get loanFormTitleEdit => 'Edytuj ratę';

  @override
  String get loanFieldName => 'Nazwa';

  @override
  String get loanFieldCategory => 'Kategoria';

  @override
  String get loanFieldTotalAmount => 'Kwota całkowita (opcjonalnie)';

  @override
  String get loanFieldInstallmentAmount => 'Kwota jednej raty';

  @override
  String get loanFieldTotalInstallments => 'Liczba rat';

  @override
  String get loanFieldFrequency => 'Częstotliwość';

  @override
  String get loanFieldDueDayOfMonth => 'Dzień płatności w miesiącu';

  @override
  String get loanFieldStartDate => 'Data rozpoczęcia';

  @override
  String get loanFieldReminderAdvanceDays => 'Przypomnij N dni przed terminem';

  @override
  String get loanFieldNotes => 'Notatki (opcjonalnie)';

  @override
  String get loanFrequencyMonthly => 'Co miesiąc';

  @override
  String get loanFrequencyWeekly => 'Co tydzień';

  @override
  String get loanFrequencyBiweekly => 'Co dwa tygodnie';

  @override
  String loanProgress(int paid, int total) {
    return 'Spłacono $paid / $total';
  }

  @override
  String get loanMarkPaid => 'Oznacz jako spłacone';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Oznacz $count rat jako spłacone';
  }

  @override
  String get loanStatusPending => 'Oczekująca';

  @override
  String get loanStatusPaid => 'Spłacona';

  @override
  String get loanStatusOverdue => 'Zaległa';

  @override
  String loanInstallmentNumber(int number) {
    return 'Rata nr $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Usunąć tę ratę?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Wszystkie $count rat zostaną również usunięte.';
  }

  @override
  String get categoryManagerTitle => 'Kategorie';

  @override
  String get categoryFormTitleNew => 'Nowa kategoria';

  @override
  String get categoryFormTitleEdit => 'Edytuj kategorię';

  @override
  String get categoryFieldName => 'Nazwa';

  @override
  String get categoryFieldNameRequired => 'Nazwa jest wymagana';

  @override
  String get categoryFieldIcon => 'Ikona';

  @override
  String get categoryFieldColor => 'Kolor';

  @override
  String get categoryDeleteSimpleTitle => 'Usunąć tę kategorię?';

  @override
  String get categoryDeleteSimpleBody =>
      'Ta kategoria nie zawiera żadnych przypomnień.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Ta kategoria wciąż zawiera przypomnienia';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return 'Ta kategoria jest używana przez $count przypomnień. Wybierz, co z nimi zrobić.';
  }

  @override
  String get categoryDeleteReassign => 'Przenieś do innej kategorii';

  @override
  String get categoryDeleteReassignTarget => 'Przenieś do';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Usuń wszystkie $count przypomnień';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Ta operacja trwale usunie $count przypomnień. Nie można jej cofnąć.';
  }

  @override
  String get categoryReorderHint => 'Przeciągnij, aby zmienić kolejność';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsLanguage => 'Język';

  @override
  String get settingsDefaultReminderTime => 'Domyślna godzina przypomnienia';

  @override
  String get settingsTheme => 'Motyw';

  @override
  String get settingsThemeSystem => 'Systemowy';

  @override
  String get settingsThemeLight => 'Jasny';

  @override
  String get settingsThemeDark => 'Ciemny';

  @override
  String get settingsBackupRestore => 'Kopia zapasowa i przywracanie';

  @override
  String get settingsExport => 'Eksportuj kopię zapasową';

  @override
  String get settingsImport => 'Przywróć z kopii zapasowej';

  @override
  String get settingsExportLocationHint =>
      'Zapisano w Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Kopia zapasowa zapisana';

  @override
  String get settingsImportNoneFound => 'Nie znaleziono plików kopii zapasowej';

  @override
  String get settingsImportPickFile => 'Wybierz kopię zapasową';

  @override
  String get settingsImportSuccess => 'Kopia zapasowa przywrócona';

  @override
  String get settingsImportConfirmTitle => 'Przywrócić kopię zapasową?';

  @override
  String get settingsImportConfirmBody =>
      'Spowoduje to zastąpienie wszystkich bieżących danych zawartością pliku kopii zapasowej.';

  @override
  String get settingsAbout => 'O aplikacji';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Powiadomienia nie przychodzą na czas?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Niektórzy producenci telefonów (Samsung, Xiaomi, Oppo...) mocno ograniczają działanie aplikacji w tle. Wyłącz optymalizację baterii dla iReminder w Ustawieniach telefonu > Bateria, aby przypomnienia zawsze docierały na czas.';

  @override
  String get errorGeneric => 'Coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get errorLoadFailed => 'Nie udało się wczytać danych.';

  @override
  String get settingsAiSectionTitle => 'Asystent AI';

  @override
  String get settingsAiEnable => 'Włącz Asystenta AI';

  @override
  String get settingsAiProvider => 'Dostawca AI';

  @override
  String get settingsAiModel => 'Model';

  @override
  String get settingsAiApiKey => 'Klucz API';

  @override
  String get settingsAiApiKeyHint => 'Wklej swój klucz API';

  @override
  String get settingsAiApiKeyHelp => 'Skąd wziąć klucz?';

  @override
  String get settingsAiApiKeySaved => 'Klucz API zapisany';

  @override
  String get settingsAiAllowedCategories => 'Kategorie widoczne dla asystenta';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Domyślnie udostępnione są wszystkie kategorie oprócz Finansów — wyłącz te, których asystent nie powinien widzieć.';

  @override
  String get settingsAiClearHistory => 'Wyczyść historię czatu';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Wyczyścić historię czatu?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Spowoduje to usunięcie wszystkich pytań i odpowiedzi zapisanych na tym urządzeniu. Nie można tego cofnąć.';

  @override
  String get assistantTitle => 'Asystent';

  @override
  String get assistantEmptyTitle => 'Zapytaj mnie o cokolwiek';

  @override
  String get assistantEmptyBody =>
      'Spróbuj zapytać „Co muszę zrobić w tym tygodniu?” albo „Ile rat zostało do spłaty za motocykl?”';

  @override
  String get assistantInputHint => 'Zapytaj o coś…';

  @override
  String get assistantSend => 'Wyślij';

  @override
  String get assistantDisabledTitle => 'Asystent jest wyłączony';

  @override
  String get assistantDisabledBody =>
      'Włącz go w Ustawieniach i wybierz dostawcę AI, aby zacząć rozmowę.';

  @override
  String get assistantOpenSettings => 'Otwórz Ustawienia';

  @override
  String get assistantThinking => 'Myślę…';

  @override
  String get validationRequired => 'Wymagane';

  @override
  String get validationDayOfMonth => 'Podaj dzień od 1 do 31';

  @override
  String get validationMonth => 'Podaj miesiąc od 1 do 12';

  @override
  String get validationPositiveNumber => 'Podaj liczbę większą od 0';

  @override
  String get validationPositiveInteger => 'Podaj liczbę całkowitą większą od 0';

  @override
  String get settingsPermissionsSectionTitle => 'Powiadomienia i alarmy';

  @override
  String get settingsPermissionsNotificationLabel => 'Zgoda na powiadomienia';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Zgoda na precyzyjne alarmy';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ignoruj optymalizację baterii (zalecane)';

  @override
  String get settingsTestNotificationAction => 'Testuj powiadomienie (10 s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Zaplanowano. Zablokuj ekran lub opuść aplikację i poczekaj około 10 sekund.';

  @override
  String get settingsPermissionsGranted => 'Przyznano';

  @override
  String get settingsPermissionsDenied =>
      'Brak zgody — przypomnienia mogą nie pojawiać się na czas';

  @override
  String get settingsPermissionsGrantAction => 'Przyznaj';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Otwórz ustawienia';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Jeszcze jedna zgoda';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'Na następnym ekranie zezwól iReminder na ustawianie precyzyjnych alarmów, aby przypomnienia pojawiały się dokładnie o ustawionej godzinie.';

  @override
  String get loanMarkPaidSuccess => 'Oznaczono jako spłacone';

  @override
  String get settingsNotificationPrefsTitle => 'Dźwięk i wibracje';

  @override
  String get settingsNotificationSound => 'Dźwięk powiadomienia';

  @override
  String get settingsNotificationVibration => 'Wibracje';

  @override
  String get settingsSnoozeDuration => 'Czas drzemki';

  @override
  String get snoozeDuration5Min => '5 minut';

  @override
  String get snoozeDuration10Min => '10 minut';

  @override
  String get snoozeDuration15Min => '15 minut';

  @override
  String get snoozeDuration30Min => '30 minut';

  @override
  String get snoozeDuration60Min => '1 godzina';

  @override
  String get snoozeDuration120Min => '2 godziny';

  @override
  String get defaultCategoryHomeAppliances => 'Dom i sprzęty';

  @override
  String get defaultCategoryVehicles => 'Pojazdy';

  @override
  String get defaultCategoryFamilyEvents => 'Rocznice i rodzina';

  @override
  String get defaultCategoryFinance => 'Finanse';

  @override
  String get defaultCategoryWork => 'Praca';

  @override
  String get defaultCategoryFamily => 'Rodzina';

  @override
  String get defaultCategoryOutdoorEvents => 'Wycieczki i wydarzenia';

  @override
  String get defaultCategoryHealth => 'Zdrowie';

  @override
  String get defaultCategoryBirthday => 'Urodziny';
}
