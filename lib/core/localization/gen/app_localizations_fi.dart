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
  String get navToday => 'Tänään';

  @override
  String get navCalendar => 'Kalenteri';

  @override
  String get navLoans => 'Lainat';

  @override
  String get navCategories => 'Kategoriat';

  @override
  String get navSettings => 'Asetukset';

  @override
  String get navAssistant => 'Avustaja';

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
  String get notificationPermissionTitle => 'Pysy aikataulussa';

  @override
  String get notificationPermissionBody =>
      'iReminder tarvitsee luvan lähettää sinulle ilmoituksia, kun jokin erääntyy.';

  @override
  String get notificationPermissionAllow => 'Salli ilmoitukset';

  @override
  String get notificationPermissionLater => 'Ei nyt';

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
  String get reminderFieldAdvanceNotice => 'Muistuta N päivää etukäteen';

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
  String reminderLunarDateLabel(String date) {
    return '$date (kuu)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Poistetaanko tämä muistutus?';

  @override
  String get reminderDeleteConfirmBody => 'Tätä ei voi perua.';

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
  String loanProgress(int paid, int total) {
    return '$paid / $total maksettu';
  }

  @override
  String get loanMarkPaid => 'Merkitse maksetuksi';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Merkitse $count erää maksetuksi';
  }

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
  String get settingsAiSectionTitle => 'Tekoälyavustaja';

  @override
  String get settingsAiEnable => 'Ota tekoälyavustaja käyttöön';

  @override
  String get settingsAiProvider => 'Tekoälypalveluntarjoaja';

  @override
  String get settingsAiModel => 'Malli';

  @override
  String get settingsAiApiKey => 'API-avain';

  @override
  String get settingsAiApiKeyHint => 'Liitä API-avaimesi';

  @override
  String get settingsAiApiKeyHelp => 'Mistä saan avaimen?';

  @override
  String get settingsAiApiKeySaved => 'API-avain tallennettu';

  @override
  String get settingsAiAllowedCategories =>
      'Kategoriat, joita avustaja saa lukea';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Kaikki kategoriat Taloutta lukuun ottamatta jaetaan oletuksena — poista käytöstä ne, joita et halua avustajan näkevän.';

  @override
  String get settingsAiClearHistory => 'Tyhjennä keskusteluhistoria';

  @override
  String get settingsAiClearHistoryConfirmTitle =>
      'Tyhjennetäänkö keskusteluhistoria?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Tämä poistaa kaikki laitteelle tallennetut kysymykset ja vastaukset. Tätä ei voi perua.';

  @override
  String get assistantTitle => 'Avustaja';

  @override
  String get assistantEmptyTitle => 'Kysy minulta mitä vain';

  @override
  String get assistantEmptyBody =>
      'Kokeile esimerkiksi \"Mitä minun pitää tehdä tällä viikolla?\" tai \"Kuinka monta erää moottoripyörälainastani on jäljellä?\"';

  @override
  String get assistantInputHint => 'Kysy jotain…';

  @override
  String get assistantSend => 'Lähetä';

  @override
  String get assistantDisabledTitle => 'Avustaja on pois käytöstä';

  @override
  String get assistantDisabledBody =>
      'Ota se käyttöön asetuksista ja valitse tekoälypalveluntarjoaja aloittaaksesi keskustelun.';

  @override
  String get assistantOpenSettings => 'Avaa asetukset';

  @override
  String get assistantThinking => 'Mietitään…';

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
  String get settingsPermissionsGranted => 'Myönnetty';

  @override
  String get settingsPermissionsDenied =>
      'Ei myönnetty — muistutukset eivät ehkä tule ajallaan';

  @override
  String get settingsPermissionsGrantAction => 'Myönnä';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Avaa asetukset';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Vielä yksi lupa';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'Seuraavalla näytöllä salli iReminderin ajastaa tarkkoja hälytyksiä, jotta muistutukset laukeavat juuri sinä ajankohtana, jonka olet asettanut.';

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
  String get defaultCategoryHomeAppliances => 'Koti ja laitteet';

  @override
  String get defaultCategoryVehicles => 'Ajoneuvot';

  @override
  String get defaultCategoryFamilyEvents => 'Merkkipäivät ja perhe';

  @override
  String get defaultCategoryFinance => 'Talous';

  @override
  String get defaultCategoryWork => 'Työ';

  @override
  String get defaultCategoryFamily => 'Perhe';

  @override
  String get defaultCategoryOutdoorEvents => 'Retket ja tapahtumat';

  @override
  String get defaultCategoryHealth => 'Terveys';
}
