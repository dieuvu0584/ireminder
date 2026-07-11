// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Hari Ini';

  @override
  String get navCalendar => 'Kalendar';

  @override
  String get navLoans => 'Pinjaman';

  @override
  String get navCategories => 'Kategori';

  @override
  String get navSettings => 'Tetapan';

  @override
  String get navAssistant => 'Pembantu';

  @override
  String get onboardingTitle1 => 'Jangan sekali-kali lupa perkara penting';

  @override
  String get onboardingBody1 =>
      'Jejaki penyelenggaraan peranti, servis kenderaan, hari ulang tahun dan banyak lagi — semuanya di satu tempat.';

  @override
  String get onboardingTitle2 => 'Ulangan dipermudahkan';

  @override
  String get onboardingBody2 =>
      'Harian, mingguan, bulanan, tahunan, atau mengikut kalendar bulan — tetapkan sekali sahaja dan iReminder akan sentiasa memantaunya.';

  @override
  String get onboardingTitle3 => '100% peribadi, 100% luar talian';

  @override
  String get onboardingBody3 =>
      'Tiada akaun, tiada awan, tiada log masuk. Semuanya kekal dalam telefon anda.';

  @override
  String get onboardingSkip => 'Langkau';

  @override
  String get onboardingNext => 'Seterusnya';

  @override
  String get onboardingGetStarted => 'Mula sekarang';

  @override
  String get notificationPermissionTitle => 'Sentiasa tepat masa';

  @override
  String get notificationPermissionBody =>
      'iReminder memerlukan kebenaran untuk menghantar pemberitahuan kepada anda apabila sesuatu perkara akan tamat tempoh.';

  @override
  String get notificationPermissionAllow => 'Benarkan pemberitahuan';

  @override
  String get notificationPermissionLater => 'Bukan sekarang';

  @override
  String get homeSectionOverdue => 'Tertunggak';

  @override
  String get homeSectionToday => 'Hari Ini';

  @override
  String get homeSectionThisWeek => 'Minggu Ini';

  @override
  String get homeSectionUpcoming => 'Akan Datang';

  @override
  String get homeEmptyTitle => 'Belum ada apa-apa di sini';

  @override
  String get homeEmptyBody =>
      'Ketik + untuk menambah peringatan atau pinjaman ansuran pertama anda.';

  @override
  String get fabAddReminder => 'Peringatan';

  @override
  String get fabAddLoan => 'Pinjaman ansuran';

  @override
  String get actionDone => 'Selesai';

  @override
  String get actionSnooze => 'Tangguh';

  @override
  String get actionEdit => 'Sunting';

  @override
  String get actionDelete => 'Padam';

  @override
  String get actionSave => 'Simpan';

  @override
  String get actionCancel => 'Batal';

  @override
  String get actionConfirm => 'Sahkan';

  @override
  String get actionYes => 'Ya';

  @override
  String get actionNo => 'Tidak';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Tambah';

  @override
  String get actionClose => 'Tutup';

  @override
  String get reminderFormTitleNew => 'Peringatan baharu';

  @override
  String get reminderFormTitleEdit => 'Sunting peringatan';

  @override
  String get reminderFieldTitle => 'Tajuk';

  @override
  String get reminderFieldTitleRequired => 'Tajuk diperlukan';

  @override
  String get reminderFieldDescription => 'Keterangan (pilihan)';

  @override
  String get reminderFieldCategory => 'Kategori';

  @override
  String get reminderFieldRecurrence => 'Ulangan';

  @override
  String get reminderFieldStartDate => 'Tarikh mula';

  @override
  String get reminderFieldTime => 'Masa peringatan';

  @override
  String get reminderFieldAdvanceNotice => 'Beritahu N hari lebih awal';

  @override
  String get reminderFieldRecurrenceDay => 'Hari dalam bulan';

  @override
  String get reminderFieldRecurrenceMonth => 'Bulan';

  @override
  String get reminderFieldRecurrenceWeekday => 'Hari dalam minggu';

  @override
  String get reminderFieldIntervalDays => 'Setiap N hari';

  @override
  String get reminderFieldLunarDay => 'Hari kalendar bulan';

  @override
  String get reminderFieldLunarMonth => 'Bulan kalendar bulan';

  @override
  String get reminderFieldLunarToggle => 'Kalendar lunar';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (lunar)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Padam peringatan ini?';

  @override
  String get reminderDeleteConfirmBody =>
      'Tindakan ini tidak boleh dibuat asal.';

  @override
  String get reminderScheduleWarning =>
      'Peringatan disimpan, tetapi pemberitahuan tidak dapat dijadualkan. Semak tetapan pemberitahuan.';

  @override
  String get recurrenceNone => 'Sekali sahaja';

  @override
  String get recurrenceDaily => 'Harian';

  @override
  String get recurrenceWeekly => 'Mingguan';

  @override
  String get recurrenceMonthly => 'Bulanan';

  @override
  String get recurrenceYearly => 'Tahunan';

  @override
  String get recurrenceCustomIntervalDays => 'Setiap N hari';

  @override
  String get recurrenceLunarYearly => 'Tahunan (kalendar bulan)';

  @override
  String get weekdayMonday => 'Isnin';

  @override
  String get weekdayTuesday => 'Selasa';

  @override
  String get weekdayWednesday => 'Rabu';

  @override
  String get weekdayThursday => 'Khamis';

  @override
  String get weekdayFriday => 'Jumaat';

  @override
  String get weekdaySaturday => 'Sabtu';

  @override
  String get weekdaySunday => 'Ahad';

  @override
  String get loanListTitle => 'Pinjaman & ansuran';

  @override
  String get loanFormTitleNew => 'Pinjaman ansuran baharu';

  @override
  String get loanFormTitleEdit => 'Sunting pinjaman';

  @override
  String get loanFieldName => 'Nama';

  @override
  String get loanFieldCategory => 'Kategori';

  @override
  String get loanFieldTotalAmount => 'Jumlah keseluruhan (pilihan)';

  @override
  String get loanFieldInstallmentAmount => 'Jumlah setiap ansuran';

  @override
  String get loanFieldTotalInstallments => 'Bilangan ansuran';

  @override
  String get loanFieldFrequency => 'Kekerapan';

  @override
  String get loanFieldDueDayOfMonth => 'Hari tamat tempoh dalam bulan';

  @override
  String get loanFieldStartDate => 'Tarikh mula';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Ingatkan N hari sebelum tamat tempoh';

  @override
  String get loanFieldNotes => 'Nota (pilihan)';

  @override
  String get loanFrequencyMonthly => 'Bulanan';

  @override
  String get loanFrequencyWeekly => 'Mingguan';

  @override
  String get loanFrequencyBiweekly => 'Dua mingguan';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total telah dibayar';
  }

  @override
  String get loanMarkPaid => 'Tandakan sebagai dibayar';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Tandakan $count ansuran sebagai dibayar';
  }

  @override
  String get loanStatusPending => 'Belum tiba tempoh';

  @override
  String get loanStatusPaid => 'Telah dibayar';

  @override
  String get loanStatusOverdue => 'Tertunggak';

  @override
  String loanInstallmentNumber(int number) {
    return 'Ansuran #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Padam pinjaman ini?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Kesemua $count ansuran juga akan dialih keluar.';
  }

  @override
  String get categoryManagerTitle => 'Kategori';

  @override
  String get categoryFormTitleNew => 'Kategori baharu';

  @override
  String get categoryFormTitleEdit => 'Sunting kategori';

  @override
  String get categoryFieldName => 'Nama';

  @override
  String get categoryFieldNameRequired => 'Nama diperlukan';

  @override
  String get categoryFieldIcon => 'Ikon';

  @override
  String get categoryFieldColor => 'Warna';

  @override
  String get categoryDeleteSimpleTitle => 'Padam kategori ini?';

  @override
  String get categoryDeleteSimpleBody => 'Kategori ini tiada peringatan.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Kategori ini masih mempunyai peringatan';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count peringatan menggunakan kategori ini. Pilih tindakan yang perlu diambil.';
  }

  @override
  String get categoryDeleteReassign => 'Pindahkan ke kategori lain';

  @override
  String get categoryDeleteReassignTarget => 'Pindahkan ke';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Padam kesemua $count peringatan';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Tindakan ini akan memadam $count peringatan secara kekal. Tindakan ini tidak boleh dibuat asal.';
  }

  @override
  String get categoryReorderHint => 'Seret untuk susun semula';

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get settingsDefaultReminderTime => 'Masa peringatan lalai';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Cerah';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsBackupRestore => 'Sandaran & pemulihan';

  @override
  String get settingsExport => 'Eksport sandaran';

  @override
  String get settingsImport => 'Pulihkan daripada sandaran';

  @override
  String get settingsExportLocationHint =>
      'Disimpan di Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Sandaran disimpan';

  @override
  String get settingsImportNoneFound => 'Tiada fail sandaran ditemui';

  @override
  String get settingsImportPickFile => 'Pilih sandaran';

  @override
  String get settingsImportSuccess => 'Sandaran dipulihkan';

  @override
  String get settingsImportConfirmTitle => 'Pulihkan sandaran?';

  @override
  String get settingsImportConfirmBody =>
      'Tindakan ini akan menggantikan semua data semasa dengan kandungan fail sandaran.';

  @override
  String get settingsAbout => 'Tentang';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Pemberitahuan tidak muncul tepat pada masanya?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Sesetengah pengeluar telefon (Samsung, Xiaomi, Oppo...) menyekat aplikasi latar belakang secara agresif. Matikan pengoptimuman bateri untuk iReminder dalam Tetapan telefon > Bateri untuk memastikan peringatan sentiasa tiba tepat pada masanya.';

  @override
  String get errorGeneric => 'Sesuatu tidak kena. Sila cuba lagi.';

  @override
  String get errorLoadFailed => 'Gagal memuatkan data.';

  @override
  String get settingsAiSectionTitle => 'Pembantu AI';

  @override
  String get settingsAiEnable => 'Dayakan Pembantu AI';

  @override
  String get settingsAiProvider => 'Penyedia AI';

  @override
  String get settingsAiModel => 'Model';

  @override
  String get settingsAiApiKey => 'Kunci API';

  @override
  String get settingsAiApiKeyHint => 'Tampal kunci API anda';

  @override
  String get settingsAiApiKeyHelp => 'Di mana saya boleh dapatkan kunci?';

  @override
  String get settingsAiApiKeySaved => 'Kunci API disimpan';

  @override
  String get settingsAiAllowedCategories =>
      'Kategori yang boleh dibaca oleh pembantu';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Semua kategori kecuali Kewangan dikongsi secara lalai — matikan mana-mana yang anda tidak mahu pembantu lihat.';

  @override
  String get settingsAiClearHistory => 'Kosongkan sejarah sembang';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Kosongkan sejarah sembang?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Tindakan ini akan memadam setiap soalan dan jawapan yang disimpan pada peranti ini. Tindakan ini tidak boleh dibuat asal.';

  @override
  String get assistantTitle => 'Pembantu';

  @override
  String get assistantEmptyTitle => 'Tanya saya apa-apa sahaja';

  @override
  String get assistantEmptyBody =>
      'Cuba tanya \"Apakah yang perlu saya lakukan minggu ini?\" atau \"Berapa banyak ansuran yang tinggal untuk pinjaman motosikal saya?\"';

  @override
  String get assistantInputHint => 'Tanya sesuatu…';

  @override
  String get assistantSend => 'Hantar';

  @override
  String get assistantDisabledTitle => 'Pembantu dimatikan';

  @override
  String get assistantDisabledBody =>
      'Dayakannya dalam Tetapan dan pilih penyedia AI untuk mula bersembang.';

  @override
  String get assistantOpenSettings => 'Buka Tetapan';

  @override
  String get assistantThinking => 'Sedang berfikir…';

  @override
  String get validationRequired => 'Diperlukan';

  @override
  String get validationDayOfMonth => 'Masukkan hari dari 1–31';

  @override
  String get validationMonth => 'Masukkan bulan dari 1–12';

  @override
  String get validationPositiveNumber =>
      'Masukkan nombor lebih besar daripada 0';

  @override
  String get validationPositiveInteger =>
      'Masukkan nombor bulat lebih besar daripada 0';

  @override
  String get settingsPermissionsSectionTitle => 'Pemberitahuan & Penggera';

  @override
  String get settingsPermissionsNotificationLabel => 'Kebenaran pemberitahuan';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Kebenaran penggera tepat';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Abaikan pengoptimuman bateri (disyorkan)';

  @override
  String get settingsTestNotificationAction => 'Uji pemberitahuan (10 saat)';

  @override
  String get settingsTestNotificationScheduled =>
      'Dijadualkan. Kunci skrin anda atau tinggalkan aplikasi sekarang dan tunggu kira-kira 10 saat.';

  @override
  String get settingsPermissionsGranted => 'Diberikan';

  @override
  String get settingsPermissionsDenied =>
      'Tidak diberikan — peringatan mungkin tidak muncul tepat pada masanya';

  @override
  String get settingsPermissionsGrantAction => 'Berikan kebenaran';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Buka tetapan';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Satu lagi kebenaran';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'Pada skrin seterusnya, benarkan iReminder menjadualkan penggera tepat supaya peringatan muncul pada masa yang tepat seperti yang anda tetapkan.';

  @override
  String get loanMarkPaidSuccess => 'Ditandakan sebagai dibayar';

  @override
  String get settingsNotificationPrefsTitle => 'Bunyi & getaran';

  @override
  String get settingsNotificationSound => 'Bunyi pemberitahuan';

  @override
  String get settingsNotificationVibration => 'Getaran';

  @override
  String get settingsSnoozeDuration => 'Tempoh tunda';

  @override
  String get snoozeDuration5Min => '5 minit';

  @override
  String get snoozeDuration10Min => '10 minit';

  @override
  String get snoozeDuration15Min => '15 minit';

  @override
  String get snoozeDuration30Min => '30 minit';

  @override
  String get snoozeDuration60Min => '1 jam';

  @override
  String get snoozeDuration120Min => '2 jam';

  @override
  String get defaultCategoryHomeAppliances => 'Rumah & peralatan';

  @override
  String get defaultCategoryVehicles => 'Kenderaan';

  @override
  String get defaultCategoryFamilyEvents => 'Ulang tahun & keluarga';

  @override
  String get defaultCategoryFinance => 'Kewangan';

  @override
  String get defaultCategoryWork => 'Kerja';

  @override
  String get defaultCategoryFamily => 'Keluarga';

  @override
  String get defaultCategoryOutdoorEvents => 'Percutian & acara';

  @override
  String get defaultCategoryHealth => 'Kesihatan';

  @override
  String get defaultCategoryBirthday => 'Hari Jadi';
}
