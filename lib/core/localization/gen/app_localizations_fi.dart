// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Tehtävälista';

  @override
  String get navCalendar => 'Kalenteri';

  @override
  String get navLoans => 'Lainat';

  @override
  String get navCategories => 'Kategoriat';

  @override
  String get navSettings => 'Asetukset';

  @override
  String get onboardingTitle1 => 'Älä koskaan unohda tärkeitä asioita';

  @override
  String get onboardingBody1 =>
      'Seuraa laitehuoltoja, ajoneuvon huoltoja, merkkipäiviä ja paljon muuta — kaikki samassa paikassa.';

  @override
  String get onboardingTitle2 => 'Toistuvat muistutukset tehty helpoksi';

  @override
  String get onboardingBody2 =>
      'Päivittäin, viikoittain, kuukausittain, vuosittain tai jopa kuukalenterin mukaan — aseta kerran, niin iReminder pitää kirjaa.';

  @override
  String get onboardingTitle3 => '100 % yksityinen, 100 % offline';

  @override
  String get onboardingBody3 =>
      'Ei tiliä, ei pilveä, ei kirjautumista. Kaikki pysyy puhelimessasi.';

  @override
  String get onboardingSkip => 'Ohita';

  @override
  String get onboardingNext => 'Seuraava';

  @override
  String get onboardingGetStarted => 'Aloita';

  @override
  String get permissionCheckTitle => 'Tarkista käyttöoikeudet';

  @override
  String get permissionCheckIntro =>
      'iReminder tarvitsee nämä 3 käyttöoikeutta muistuttaakseen sinua luotettavasti juuri oikeaan aikaan. \"Tarkka herätys\"-oikeuden myöntäminen saattaa avata järjestelmäasetukset — se on normaalia.';

  @override
  String get permissionCheckContinueAction => 'Jatka';

  @override
  String get permissionCheckIncompleteTitle => 'Käyttöoikeudet puutteelliset';

  @override
  String get permissionCheckIncompleteBody =>
      'Muistutukset eivät välttämättä laukea luotettavasti ilman näitä käyttöoikeuksia. Voit myöntää ne myöhemmin asetuksista, mutta se unohtuu helposti.';

  @override
  String get permissionCheckIncompleteStay => 'Palaa ja myönnä';

  @override
  String get permissionCheckIncompleteContinue => 'Jatka silti';

  @override
  String get homeSectionOverdue => 'Myöhässä';

  @override
  String get homeSectionToday => 'Tänään';

  @override
  String get homeSectionThisWeek => 'Tällä viikolla';

  @override
  String get homeSectionUpcoming => 'Tulossa';

  @override
  String get homeEmptyTitle => 'Ei vielä mitään';

  @override
  String get homeEmptyBody =>
      'Napauta + lisätäksesi ensimmäisen muistutuksen tai osamaksulainan.';

  @override
  String get fabAddReminder => 'Muistutus';

  @override
  String get fabAddLoan => 'Osamaksulaina';

  @override
  String get actionDone => 'Valmis';

  @override
  String get actionSnooze => 'Torkku';

  @override
  String get actionEdit => 'Muokkaa';

  @override
  String get actionDelete => 'Poista';

  @override
  String get actionSave => 'Tallenna';

  @override
  String get actionCancel => 'Peruuta';

  @override
  String get actionConfirm => 'Vahvista';

  @override
  String get actionYes => 'Kyllä';

  @override
  String get actionNo => 'Ei';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Lisää';

  @override
  String get actionClose => 'Sulje';

  @override
  String get reminderFormTitleNew => 'Uusi muistutus';

  @override
  String get reminderFormTitleEdit => 'Muokkaa muistutusta';

  @override
  String get reminderFieldTitle => 'Otsikko';

  @override
  String get reminderFieldTitleRequired => 'Otsikko vaaditaan';

  @override
  String get reminderFieldDescription => 'Kuvaus (valinnainen)';

  @override
  String get reminderFieldCategory => 'Kategoria';

  @override
  String get reminderFieldRecurrence => 'Toistuu';

  @override
  String get reminderFieldStartDate => 'Aloituspäivä';

  @override
  String get reminderFieldTime => 'Muistutuksen kellonaika';

  @override
  String get reminderFieldAdvanceNotice => 'Ilmoita etukäteen';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Päivää';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Tuntia';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Minuuttia';

  @override
  String get reminderFieldRecurrenceDay => 'Kuukauden päivä';

  @override
  String get reminderFieldRecurrenceMonth => 'Kuukausi';

  @override
  String get reminderFieldRecurrenceWeekday => 'Viikonpäivä';

  @override
  String get reminderFieldIntervalDays => 'Joka N. päivä';

  @override
  String get reminderFieldLunarDay => 'Kuukalenterin päivä';

  @override
  String get reminderFieldLunarMonth => 'Kuukalenterin kuukausi';

  @override
  String get reminderFieldLunarToggle => 'Kuukalenteri';

  @override
  String get reminderFieldDailyExclusionToggle => 'Poissuljetut päivät';

  @override
  String get reminderFieldDailyExclusionKind => 'Poissulkemistyyppi';

  @override
  String get dailyExclusionKindWeekdays => 'Viikonpäivän mukaan';

  @override
  String get dailyExclusionKindEvenOdd => 'Parilliset/parittomat päivät';

  @override
  String get dailyExclusionKindSpecificDay => 'Tietty päivä kuukaudesta';

  @override
  String get dailyExclusionEvenDays => 'Parillinen';

  @override
  String get dailyExclusionOddDays => 'Pariton';

  @override
  String get reminderFieldDailyExclusionDay => 'Poissuljettava päivä';

  @override
  String get validationDailyExclusionWeekdays =>
      'Vähintään yksi viikonpäivä on jätettävä jäljelle';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Virheellinen muoto. Käytä pilkkuja ja viivoja, esim. 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (kuu)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Poistetaanko tämä muistutus?';

  @override
  String get reminderDeleteConfirmBody => 'Tätä ei voi perua.';

  @override
  String get reminderScheduleWarning =>
      'Muistutus tallennettiin, mutta ilmoitusta ei voitu ajastaa. Tarkista ilmoitusasetukset.';

  @override
  String get recurrenceNone => 'Kerran';

  @override
  String get recurrenceDaily => 'Päivittäin';

  @override
  String get recurrenceWeekly => 'Viikoittain';

  @override
  String get recurrenceMonthly => 'Kuukausittain';

  @override
  String get recurrenceYearly => 'Vuosittain';

  @override
  String get recurrenceCustomIntervalDays => 'Joka N. päivä';

  @override
  String get recurrenceLunarYearly => 'Vuosittain (kuukalenteri)';

  @override
  String get recurrenceLunarMonthly => 'Kuukausittain (kuukalenteri)';

  @override
  String get weekdayMonday => 'Maanantai';

  @override
  String get weekdayTuesday => 'Tiistai';

  @override
  String get weekdayWednesday => 'Keskiviikko';

  @override
  String get weekdayThursday => 'Torstai';

  @override
  String get weekdayFriday => 'Perjantai';

  @override
  String get weekdaySaturday => 'Lauantai';

  @override
  String get weekdaySunday => 'Sunnuntai';

  @override
  String get loanListTitle => 'Lainat ja osamaksut';

  @override
  String get loanFormTitleNew => 'Uusi osamaksulaina';

  @override
  String get loanFormTitleEdit => 'Muokkaa lainaa';

  @override
  String get loanFieldName => 'Nimi';

  @override
  String get loanFieldCategory => 'Kategoria';

  @override
  String get loanFieldTotalAmount => 'Kokonaissumma (valinnainen)';

  @override
  String get loanFieldInstallmentAmount => 'Summa per erä';

  @override
  String get loanFieldTotalInstallments => 'Erien määrä';

  @override
  String get loanFieldFrequency => 'Toistumistiheys';

  @override
  String get loanFieldDueDayOfMonth => 'Eräpäivä kuukaudessa';

  @override
  String get loanFieldStartDate => 'Aloituspäivä';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Muistuta N päivää ennen eräpäivää';

  @override
  String get loanFieldNotes => 'Muistiinpanot (valinnainen)';

  @override
  String get loanFrequencyMonthly => 'Kuukausittain';

  @override
  String get loanFrequencyWeekly => 'Viikoittain';

  @override
  String get loanFrequencyBiweekly => 'Joka toinen viikko';

  @override
  String get loanFrequencyQuarterly => 'Neljännesvuosittain';

  @override
  String get loanFrequencySemiAnnually => 'Joka 6. kuukausi';

  @override
  String get loanFrequencyYearly => 'Vuosittain';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total maksettu';
  }

  @override
  String get loanMarkPaid => 'Merkitse maksetuksi';

  @override
  String get loanStatusPending => 'Odottaa';

  @override
  String get loanStatusPaid => 'Maksettu';

  @override
  String get loanStatusOverdue => 'Myöhässä';

  @override
  String loanInstallmentNumber(int number) {
    return 'Erä #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Poistetaanko tämä laina?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Kaikki $count erää poistetaan myös.';
  }

  @override
  String get categoryManagerTitle => 'Kategoriat';

  @override
  String get categoryFormTitleNew => 'Uusi kategoria';

  @override
  String get categoryFormTitleEdit => 'Muokkaa kategoriaa';

  @override
  String get categoryFieldName => 'Nimi';

  @override
  String get categoryFieldNameRequired => 'Nimi vaaditaan';

  @override
  String get categoryFieldIcon => 'Kuvake';

  @override
  String get categoryFieldColor => 'Väri';

  @override
  String get categoryDeleteSimpleTitle => 'Poistetaanko tämä kategoria?';

  @override
  String get categoryDeleteSimpleBody =>
      'Tässä kategoriassa ei ole muistutuksia.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Tässä kategoriassa on vielä muistutuksia';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count muistutusta käyttää tätä kategoriaa. Valitse, mitä niille tehdään.';
  }

  @override
  String get categoryDeleteReassign => 'Siirrä toiseen kategoriaan';

  @override
  String get categoryDeleteReassignTarget => 'Siirrä kohteeseen';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Poista kaikki $count muistutusta';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Tämä poistaa pysyvästi $count muistutusta. Tätä ei voi perua.';
  }

  @override
  String get categoryReorderHint => 'Järjestä vetämällä';

  @override
  String get settingsTitle => 'Asetukset';

  @override
  String get settingsLanguage => 'Kieli';

  @override
  String get settingsDefaultReminderTime => 'Oletusmuistutusaika';

  @override
  String get settingsTheme => 'Teema';

  @override
  String get settingsThemeSystem => 'Järjestelmä';

  @override
  String get settingsThemeLight => 'Vaalea';

  @override
  String get settingsThemeDark => 'Tumma';

  @override
  String get settingsBackupRestore => 'Varmuuskopiointi ja palautus';

  @override
  String get settingsExport => 'Vie varmuuskopio';

  @override
  String get settingsImport => 'Palauta varmuuskopiosta';

  @override
  String get settingsExportLocationHint =>
      'Tallennettu polkuun Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Varmuuskopio tallennettu';

  @override
  String get settingsImportNoneFound => 'Varmuuskopioita ei löytynyt';

  @override
  String get settingsImportPickFile => 'Valitse varmuuskopio';

  @override
  String get settingsImportSuccess => 'Varmuuskopio palautettu';

  @override
  String get settingsImportConfirmTitle => 'Palautetaanko varmuuskopio?';

  @override
  String get settingsImportConfirmBody =>
      'Tämä korvaa kaikki nykyiset tiedot varmuuskopiotiedoston sisällöllä.';

  @override
  String get settingsAbout => 'Tietoja';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Eivätkö ilmoitukset tule ajallaan?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Jotkin puhelinvalmistajat (Samsung, Xiaomi, Oppo...) rajoittavat taustasovelluksia voimakkaasti. Poista akun optimointi käytöstä iReminderille puhelimen Asetukset > Akku -valikosta, jotta muistutukset saapuvat aina ajallaan.';

  @override
  String get errorGeneric => 'Jokin meni pieleen. Yritä uudelleen.';

  @override
  String get errorLoadFailed => 'Tietoja ei voitu ladata.';

  @override
  String get validationRequired => 'Pakollinen';

  @override
  String get validationDayOfMonth => 'Anna päivä väliltä 1–31';

  @override
  String get validationMonth => 'Anna kuukausi väliltä 1–12';

  @override
  String get validationPositiveNumber => 'Anna nollaa suurempi luku';

  @override
  String get validationPositiveInteger => 'Anna nollaa suurempi kokonaisluku';

  @override
  String get settingsPermissionsSectionTitle => 'Ilmoitukset ja hälytykset';

  @override
  String get settingsPermissionsNotificationLabel => 'Ilmoituslupa';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Tarkkojen hälytysten lupa';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Ohita akun optimointi (suositus)';

  @override
  String get settingsTestNotificationAction => 'Testaa ilmoitus (10 s)';

  @override
  String get settingsTestNotificationScheduled =>
      'Ajastettu. Lukitse näyttö tai poistu sovelluksesta nyt ja odota noin 10 sekuntia.';

  @override
  String get settingsPermissionsGranted => 'Myönnetty';

  @override
  String get settingsPermissionsDenied =>
      'Ei myönnetty — muistutukset eivät ehkä tule ajallaan';

  @override
  String get settingsPermissionsGrantAction => 'Myönnä';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Avaa asetukset';

  @override
  String get loanMarkPaidSuccess => 'Merkitty maksetuksi';

  @override
  String get settingsNotificationPrefsTitle => 'Ääni ja tärinä';

  @override
  String get settingsNotificationSound => 'Ilmoitusääni';

  @override
  String get settingsNotificationVibration => 'Tärinä';

  @override
  String get settingsSnoozeDuration => 'Torkkuaika';

  @override
  String get snoozeDuration5Min => '5 minuuttia';

  @override
  String get snoozeDuration10Min => '10 minuuttia';

  @override
  String get snoozeDuration15Min => '15 minuuttia';

  @override
  String get snoozeDuration30Min => '30 minuuttia';

  @override
  String get snoozeDuration60Min => '1 tunti';

  @override
  String get snoozeDuration120Min => '2 tuntia';

  @override
  String get defaultCategoryHomeAppliances => 'Koti';

  @override
  String get defaultCategoryVehicles => 'Ajoneuvot';

  @override
  String get defaultCategoryFamilyEvents => 'Merkkipäivät';

  @override
  String get defaultCategoryFinance => 'Talous';

  @override
  String get defaultCategoryWork => 'Työ';

  @override
  String get defaultCategoryFamily => 'Perhe';

  @override
  String get defaultCategoryOutdoorEvents => 'Tapahtumat';

  @override
  String get defaultCategoryHealth => 'Terveys';

  @override
  String get defaultCategoryBirthday => 'Syntymäpäivät';

  @override
  String get defaultCategoryFood => 'Ruoka';
}
