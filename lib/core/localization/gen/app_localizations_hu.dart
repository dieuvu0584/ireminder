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
  String get navToday => 'Feladatlista';

  @override
  String get navCalendar => 'Naptár';

  @override
  String get navLoans => 'Részletek';

  @override
  String get navCategories => 'Kategóriák';

  @override
  String get navSettings => 'Beállítások';

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
  String get permissionCheckTitle => 'Engedélyek ellenőrzése';

  @override
  String get permissionCheckIntro =>
      'Az iReminder-nek erre a 3 engedélyre van szüksége ahhoz, hogy pontosan a beállított időpontban megbízhatóan értesítsen. A \"Pontos ébresztő\" engedélyezése rendszerbeállítások képernyőre irányíthat — ez normális.';

  @override
  String get permissionCheckContinueAction => 'Folytatás';

  @override
  String get permissionCheckIncompleteTitle => 'Az engedélyek hiányosak';

  @override
  String get permissionCheckIncompleteBody =>
      'Ezen engedélyek nélkül előfordulhat, hogy az emlékeztetők nem indulnak el megbízhatóan. Később a Beállításokban is megadhatod őket, de könnyű elfelejteni.';

  @override
  String get permissionCheckIncompleteStay => 'Vissza és engedélyezés';

  @override
  String get permissionCheckIncompleteContinue => 'Folytatás mindenképp';

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
  String get reminderFieldAdvanceNotice => 'Előzetes értesítés';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Nap';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Óra';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Perc';

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
  String get reminderFieldDailyExclusionToggle => 'Napok kizárása';

  @override
  String get reminderFieldDailyExclusionKind => 'Kizárás típusa';

  @override
  String get dailyExclusionKindWeekdays => 'Hét napja szerint';

  @override
  String get dailyExclusionKindEvenOdd => 'Páros/páratlan napok';

  @override
  String get dailyExclusionKindSpecificDay => 'A hónap adott napja';

  @override
  String get dailyExclusionEvenDays => 'Páros';

  @override
  String get dailyExclusionOddDays => 'Páratlan';

  @override
  String get reminderFieldDailyExclusionDay => 'Kizárandó nap';

  @override
  String get validationDailyExclusionWeekdays =>
      'Legalább egy hétköznapnak maradnia kell';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Érvénytelen formátum. Használjon vesszőt és kötőjelet, pl. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (hold)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Törlöd ezt az emlékeztetőt?';

  @override
  String get reminderDeleteConfirmBody => 'Ez a művelet nem vonható vissza.';

  @override
  String get reminderScheduleWarning =>
      'Az emlékeztető mentve, de az értesítést nem sikerült ütemezni. Ellenőrizd az értesítési beállításokat.';

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
  String get recurrenceLunarMonthly => 'Havonta (holdnaptár szerint)';

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
  String get loanFrequencyQuarterly => 'Negyedévente';

  @override
  String get loanFrequencySemiAnnually => '6 havonta';

  @override
  String get loanFrequencyYearly => 'Évente';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total részlet kifizetve';
  }

  @override
  String get loanMarkPaid => 'Megjelölés kifizetettként';

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
  String get settingsPermissionsBatteryLabel =>
      'Akkumulátor-optimalizálás mellőzése (ajánlott)';

  @override
  String get settingsTestNotificationAction => 'Értesítés tesztelése (10 mp)';

  @override
  String get settingsTestNotificationScheduled =>
      'Ütemezve. Zárold most a képernyőt vagy lépj ki az appból, és várj kb. 10 másodpercet.';

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

  @override
  String get defaultCategoryBirthday => 'Születésnapok';

  @override
  String get defaultCategoryFood => 'Étkezés';
}
