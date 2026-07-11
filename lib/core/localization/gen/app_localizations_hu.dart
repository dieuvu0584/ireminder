// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Ma';

  @override
  String get navCalendar => 'Naptár';

  @override
  String get navLoans => 'Részletek';

  @override
  String get navCategories => 'Kategóriák';

  @override
  String get navSettings => 'Beállítások';

  @override
  String get navAssistant => 'Asszisztens';

  @override
  String get onboardingTitle1 => 'Soha ne felejtsd el, ami fontos';

  @override
  String get onboardingBody1 =>
      'Kövesd nyomon a készülékek karbantartását, az autó szervizét, az évfordulókat és még sok mást — mindezt egy helyen.';

  @override
  String get onboardingTitle2 => 'Az ismétlődés egyszerűvé vált';

  @override
  String get onboardingBody2 =>
      'Naponta, hetente, havonta, évente, vagy akár holdnaptár szerint — állítsd be egyszer, és az iReminder emlékezni fog rá.';

  @override
  String get onboardingTitle3 => '100% privát, 100% offline';

  @override
  String get onboardingBody3 =>
      'Nincs fiók, nincs felhő, nincs bejelentkezés. Minden a telefonodon marad.';

  @override
  String get onboardingSkip => 'Kihagyás';

  @override
  String get onboardingNext => 'Tovább';

  @override
  String get onboardingGetStarted => 'Kezdjük';

  @override
  String get notificationPermissionTitle => 'Ne csússz le semmiről';

  @override
  String get notificationPermissionBody =>
      'Az iReminder engedélyt kér, hogy értesítést küldhessen, amikor valami esedékessé válik.';

  @override
  String get notificationPermissionAllow => 'Értesítések engedélyezése';

  @override
  String get notificationPermissionLater => 'Most nem';

  @override
  String get homeSectionOverdue => 'Lejárt';

  @override
  String get homeSectionToday => 'Ma';

  @override
  String get homeSectionThisWeek => 'Ezen a héten';

  @override
  String get homeSectionUpcoming => 'Közelgő';

  @override
  String get homeEmptyTitle => 'Még nincs itt semmi';

  @override
  String get homeEmptyBody =>
      'Koppints a + gombra az első emlékeztető vagy részletfizetés hozzáadásához.';

  @override
  String get fabAddReminder => 'Emlékeztető';

  @override
  String get fabAddLoan => 'Részletfizetés';

  @override
  String get actionDone => 'Kész';

  @override
  String get actionSnooze => 'Szundi';

  @override
  String get actionEdit => 'Szerkesztés';

  @override
  String get actionDelete => 'Törlés';

  @override
  String get actionSave => 'Mentés';

  @override
  String get actionCancel => 'Mégse';

  @override
  String get actionConfirm => 'Megerősítés';

  @override
  String get actionYes => 'Igen';

  @override
  String get actionNo => 'Nem';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Hozzáadás';

  @override
  String get actionClose => 'Bezárás';

  @override
  String get reminderFormTitleNew => 'Új emlékeztető';

  @override
  String get reminderFormTitleEdit => 'Emlékeztető szerkesztése';

  @override
  String get reminderFieldTitle => 'Cím';

  @override
  String get reminderFieldTitleRequired => 'A cím megadása kötelező';

  @override
  String get reminderFieldDescription => 'Leírás (opcionális)';

  @override
  String get reminderFieldCategory => 'Kategória';

  @override
  String get reminderFieldRecurrence => 'Ismétlődés';

  @override
  String get reminderFieldStartDate => 'Kezdő dátum';

  @override
  String get reminderFieldTime => 'Emlékeztető ideje';

  @override
  String get reminderFieldAdvanceNotice => 'Értesítés N nappal korábban';

  @override
  String get reminderFieldRecurrenceDay => 'Hónap napja';

  @override
  String get reminderFieldRecurrenceMonth => 'Hónap';

  @override
  String get reminderFieldRecurrenceWeekday => 'Hét napja';

  @override
  String get reminderFieldIntervalDays => 'Minden N. napon';

  @override
  String get reminderFieldLunarDay => 'Holdnaptári nap';

  @override
  String get reminderFieldLunarMonth => 'Holdnaptári hónap';

  @override
  String get reminderFieldLunarToggle => 'Holdnaptár';

  @override
  String get reminderDeleteConfirmTitle => 'Törlöd ezt az emlékeztetőt?';

  @override
  String get reminderDeleteConfirmBody => 'Ez a művelet nem vonható vissza.';

  @override
  String get recurrenceNone => 'Egyszeri';

  @override
  String get recurrenceDaily => 'Naponta';

  @override
  String get recurrenceWeekly => 'Hetente';

  @override
  String get recurrenceMonthly => 'Havonta';

  @override
  String get recurrenceYearly => 'Évente';

  @override
  String get recurrenceCustomIntervalDays => 'Minden N. napon';

  @override
  String get recurrenceLunarYearly => 'Évente (holdnaptár szerint)';

  @override
  String get weekdayMonday => 'Hétfő';

  @override
  String get weekdayTuesday => 'Kedd';

  @override
  String get weekdayWednesday => 'Szerda';

  @override
  String get weekdayThursday => 'Csütörtök';

  @override
  String get weekdayFriday => 'Péntek';

  @override
  String get weekdaySaturday => 'Szombat';

  @override
  String get weekdaySunday => 'Vasárnap';

  @override
  String get loanListTitle => 'Hitelek és részletfizetések';

  @override
  String get loanFormTitleNew => 'Új részletfizetés';

  @override
  String get loanFormTitleEdit => 'Hitel szerkesztése';

  @override
  String get loanFieldName => 'Név';

  @override
  String get loanFieldCategory => 'Kategória';

  @override
  String get loanFieldTotalAmount => 'Teljes összeg (opcionális)';

  @override
  String get loanFieldInstallmentAmount => 'Részlet összege';

  @override
  String get loanFieldTotalInstallments => 'Részletek száma';

  @override
  String get loanFieldFrequency => 'Gyakoriság';

  @override
  String get loanFieldDueDayOfMonth => 'Esedékesség napja a hónapban';

  @override
  String get loanFieldStartDate => 'Kezdő dátum';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Emlékeztetés N nappal a fizetési határidő előtt';

  @override
  String get loanFieldNotes => 'Megjegyzések (opcionális)';

  @override
  String get loanFrequencyMonthly => 'Havonta';

  @override
  String get loanFrequencyWeekly => 'Hetente';

  @override
  String get loanFrequencyBiweekly => 'Kéthetente';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total részlet kifizetve';
  }

  @override
  String get loanMarkPaid => 'Megjelölés kifizetettként';

  @override
  String loanMarkPaidBatch(int count) {
    return '$count részlet megjelölése kifizetettként';
  }

  @override
  String get loanStatusPending => 'Függőben';

  @override
  String get loanStatusPaid => 'Kifizetve';

  @override
  String get loanStatusOverdue => 'Lejárt';

  @override
  String loanInstallmentNumber(int number) {
    return '$number. részlet';
  }

  @override
  String get loanDeleteConfirmTitle => 'Törlöd ezt a hitelt?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Mind a(z) $count részlet is törlésre kerül.';
  }

  @override
  String get categoryManagerTitle => 'Kategóriák';

  @override
  String get categoryFormTitleNew => 'Új kategória';

  @override
  String get categoryFormTitleEdit => 'Kategória szerkesztése';

  @override
  String get categoryFieldName => 'Név';

  @override
  String get categoryFieldNameRequired => 'A név megadása kötelező';

  @override
  String get categoryFieldIcon => 'Ikon';

  @override
  String get categoryFieldColor => 'Szín';

  @override
  String get categoryDeleteSimpleTitle => 'Törlöd ezt a kategóriát?';

  @override
  String get categoryDeleteSimpleBody =>
      'Ebben a kategóriában nincs egyetlen emlékeztető sem.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Ez a kategória még tartalmaz emlékeztetőket';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count emlékeztető használja ezt a kategóriát. Válaszd ki, mit szeretnél tenni velük.';
  }

  @override
  String get categoryDeleteReassign => 'Áthelyezés másik kategóriába';

  @override
  String get categoryDeleteReassignTarget => 'Áthelyezés ide';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Mind a(z) $count emlékeztető törlése';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Ez véglegesen törli $count emlékeztetőt. Ez a művelet nem vonható vissza.';
  }

  @override
  String get categoryReorderHint => 'Húzással rendezheted át';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get settingsLanguage => 'Nyelv';

  @override
  String get settingsDefaultReminderTime =>
      'Alapértelmezett emlékeztető időpont';

  @override
  String get settingsTheme => 'Téma';

  @override
  String get settingsThemeSystem => 'Rendszer';

  @override
  String get settingsThemeLight => 'Világos';

  @override
  String get settingsThemeDark => 'Sötét';

  @override
  String get settingsBackupRestore => 'Biztonsági mentés és visszaállítás';

  @override
  String get settingsExport => 'Biztonsági mentés exportálása';

  @override
  String get settingsImport => 'Visszaállítás biztonsági mentésből';

  @override
  String get settingsExportLocationHint =>
      'Mentve ide: Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'A biztonsági mentés elkészült';

  @override
  String get settingsImportNoneFound => 'Nem található biztonsági mentés fájl';

  @override
  String get settingsImportPickFile => 'Válassz egy biztonsági mentést';

  @override
  String get settingsImportSuccess => 'A biztonsági mentés visszaállítva';

  @override
  String get settingsImportConfirmTitle =>
      'Visszaállítod a biztonsági mentést?';

  @override
  String get settingsImportConfirmBody =>
      'Ez lecseréli az összes jelenlegi adatot a biztonsági mentés fájl tartalmára.';

  @override
  String get settingsAbout => 'Névjegy';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Nem érkeznek időben az értesítések?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Egyes telefongyártók (Samsung, Xiaomi, Oppo...) agresszívan korlátozzák a háttérben futó alkalmazásokat. Kapcsold ki az akkumulátor-optimalizálást az iReminder számára a telefon Beállítások > Akkumulátor menüjében, hogy az emlékeztetők mindig időben megérkezzenek.';

  @override
  String get errorGeneric => 'Valami hiba történt. Kérjük, próbáld újra.';

  @override
  String get errorLoadFailed => 'Az adatok betöltése nem sikerült.';

  @override
  String get settingsAiSectionTitle => 'AI asszisztens';

  @override
  String get settingsAiEnable => 'AI asszisztens engedélyezése';

  @override
  String get settingsAiProvider => 'AI szolgáltató';

  @override
  String get settingsAiModel => 'Modell';

  @override
  String get settingsAiApiKey => 'API kulcs';

  @override
  String get settingsAiApiKeyHint => 'Illeszd be az API kulcsodat';

  @override
  String get settingsAiApiKeyHelp => 'Honnan szerezhetek kulcsot?';

  @override
  String get settingsAiApiKeySaved => 'Az API kulcs elmentve';

  @override
  String get settingsAiAllowedCategories =>
      'Az asszisztens által olvasható kategóriák';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Alapértelmezés szerint minden kategória megosztásra kerül a Pénzügyek kivételével — kapcsold ki, amit nem szeretnél, hogy az asszisztens lásson.';

  @override
  String get settingsAiClearHistory => 'Beszélgetési előzmények törlése';

  @override
  String get settingsAiClearHistoryConfirmTitle =>
      'Törlöd a beszélgetési előzményeket?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Ez törli az összes ezen az eszközön tárolt kérdést és választ. Ez a művelet nem vonható vissza.';

  @override
  String get assistantTitle => 'Asszisztens';

  @override
  String get assistantEmptyTitle => 'Kérdezz bármit';

  @override
  String get assistantEmptyBody =>
      'Próbáld ki: „Mit kell tennem ezen a héten?” vagy „Hány részlet van még hátra a motorhitelemből?”';

  @override
  String get assistantInputHint => 'Kérdezz valamit…';

  @override
  String get assistantSend => 'Küldés';

  @override
  String get assistantDisabledTitle => 'Az asszisztens ki van kapcsolva';

  @override
  String get assistantDisabledBody =>
      'Kapcsold be a Beállításokban, és válassz egy AI szolgáltatót a beszélgetés megkezdéséhez.';

  @override
  String get assistantOpenSettings => 'Beállítások megnyitása';

  @override
  String get assistantThinking => 'Gondolkodik…';

  @override
  String get validationRequired => 'Kötelező';

  @override
  String get validationDayOfMonth => 'Adj meg egy napot 1 és 31 között';

  @override
  String get validationMonth => 'Adj meg egy hónapot 1 és 12 között';

  @override
  String get validationPositiveNumber => 'Adj meg egy 0-nál nagyobb számot';

  @override
  String get validationPositiveInteger =>
      'Adj meg egy 0-nál nagyobb egész számot';

  @override
  String get settingsPermissionsSectionTitle => 'Értesítések és riasztások';

  @override
  String get settingsPermissionsNotificationLabel => 'Értesítési engedély';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Pontos riasztás engedélye';

  @override
  String get settingsPermissionsGranted => 'Megadva';

  @override
  String get settingsPermissionsDenied =>
      'Nincs megadva — előfordulhat, hogy az emlékeztetők nem időben jelennek meg';

  @override
  String get settingsPermissionsGrantAction => 'Engedélyezés';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Beállítások megnyitása';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Még egy engedély';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'A következő képernyőn engedélyezd, hogy az iReminder pontos riasztásokat ütemezzen, hogy az emlékeztetők pontosan a beállított időpontban jelenjenek meg.';

  @override
  String get loanMarkPaidSuccess => 'Kifizetettként megjelölve';

  @override
  String get settingsNotificationPrefsTitle => 'Hang és rezgés';

  @override
  String get settingsNotificationSound => 'Értesítési hang';

  @override
  String get settingsNotificationVibration => 'Rezgés';

  @override
  String get settingsSnoozeDuration => 'Szundi időtartama';

  @override
  String get snoozeDuration5Min => '5 perc';

  @override
  String get snoozeDuration10Min => '10 perc';

  @override
  String get snoozeDuration15Min => '15 perc';

  @override
  String get snoozeDuration30Min => '30 perc';

  @override
  String get snoozeDuration60Min => '1 óra';

  @override
  String get snoozeDuration120Min => '2 óra';

  @override
  String get defaultCategoryHomeAppliances => 'Otthon és készülékek';

  @override
  String get defaultCategoryVehicles => 'Járművek';

  @override
  String get defaultCategoryFamilyEvents => 'Évfordulók és család';

  @override
  String get defaultCategoryFinance => 'Pénzügyek';

  @override
  String get defaultCategoryWork => 'Munka';

  @override
  String get defaultCategoryFamily => 'Család';

  @override
  String get defaultCategoryOutdoorEvents => 'Kirándulások és események';

  @override
  String get defaultCategoryHealth => 'Egészség';
}
