// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Hari Ini';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navLoans => 'Cicilan';

  @override
  String get navCategories => 'Kategori';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get navAssistant => 'Asisten';

  @override
  String get onboardingTitle1 => 'Jangan pernah lupa hal penting';

  @override
  String get onboardingBody1 =>
      'Lacak perawatan perangkat, servis kendaraan, hari ulang tahun, dan banyak lagi — semua dalam satu aplikasi.';

  @override
  String get onboardingTitle2 => 'Pengulangan jadi lebih mudah';

  @override
  String get onboardingBody2 =>
      'Harian, mingguan, bulanan, tahunan, atau bahkan berdasarkan kalender lunar — atur sekali dan iReminder akan mengingatkannya untukmu.';

  @override
  String get onboardingTitle3 => '100% privat, 100% offline';

  @override
  String get onboardingBody3 =>
      'Tanpa akun, tanpa cloud, tanpa login. Semua data tetap ada di ponselmu.';

  @override
  String get onboardingSkip => 'Lewati';

  @override
  String get onboardingNext => 'Lanjut';

  @override
  String get onboardingGetStarted => 'Mulai';

  @override
  String get notificationPermissionTitle => 'Jangan sampai terlambat';

  @override
  String get notificationPermissionBody =>
      'iReminder memerlukan izin untuk mengirim notifikasi saat ada sesuatu yang jatuh tempo.';

  @override
  String get notificationPermissionAllow => 'Izinkan notifikasi';

  @override
  String get notificationPermissionLater => 'Nanti saja';

  @override
  String get homeSectionOverdue => 'Terlambat';

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
      'Ketuk + untuk menambahkan pengingat atau cicilan pertamamu.';

  @override
  String get fabAddReminder => 'Pengingat';

  @override
  String get fabAddLoan => 'Cicilan';

  @override
  String get actionDone => 'Selesai';

  @override
  String get actionSnooze => 'Tunda';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionDelete => 'Hapus';

  @override
  String get actionSave => 'Simpan';

  @override
  String get actionCancel => 'Batal';

  @override
  String get actionConfirm => 'Konfirmasi';

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
  String get reminderFormTitleNew => 'Pengingat baru';

  @override
  String get reminderFormTitleEdit => 'Edit pengingat';

  @override
  String get reminderFieldTitle => 'Judul';

  @override
  String get reminderFieldTitleRequired => 'Judul wajib diisi';

  @override
  String get reminderFieldDescription => 'Deskripsi (opsional)';

  @override
  String get reminderFieldCategory => 'Kategori';

  @override
  String get reminderFieldRecurrence => 'Pengulangan';

  @override
  String get reminderFieldStartDate => 'Tanggal mulai';

  @override
  String get reminderFieldTime => 'Waktu pengingat';

  @override
  String get reminderFieldAdvanceNotice => 'Beri tahu N hari sebelumnya';

  @override
  String get reminderFieldRecurrenceDay => 'Tanggal dalam bulan';

  @override
  String get reminderFieldRecurrenceMonth => 'Bulan';

  @override
  String get reminderFieldRecurrenceWeekday => 'Hari dalam minggu';

  @override
  String get reminderFieldIntervalDays => 'Setiap N hari';

  @override
  String get reminderFieldLunarDay => 'Tanggal lunar';

  @override
  String get reminderFieldLunarMonth => 'Bulan lunar';

  @override
  String get reminderFieldLunarToggle => 'Kalender lunar';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (lunar)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Hapus pengingat ini?';

  @override
  String get reminderDeleteConfirmBody =>
      'Tindakan ini tidak dapat dibatalkan.';

  @override
  String get reminderCompletedFeedback => 'Ditandai selesai';

  @override
  String get reminderScheduleWarning =>
      'Pengingat disimpan, tetapi notifikasi tidak dapat dijadwalkan. Periksa pengaturan notifikasi.';

  @override
  String get recurrenceNone => 'Sekali';

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
  String get recurrenceLunarYearly => 'Tahunan (kalender lunar)';

  @override
  String get weekdayMonday => 'Senin';

  @override
  String get weekdayTuesday => 'Selasa';

  @override
  String get weekdayWednesday => 'Rabu';

  @override
  String get weekdayThursday => 'Kamis';

  @override
  String get weekdayFriday => 'Jumat';

  @override
  String get weekdaySaturday => 'Sabtu';

  @override
  String get weekdaySunday => 'Minggu';

  @override
  String get loanListTitle => 'Cicilan & pinjaman';

  @override
  String get loanFormTitleNew => 'Cicilan baru';

  @override
  String get loanFormTitleEdit => 'Edit cicilan';

  @override
  String get loanFieldName => 'Nama';

  @override
  String get loanFieldCategory => 'Kategori';

  @override
  String get loanFieldTotalAmount => 'Jumlah total (opsional)';

  @override
  String get loanFieldInstallmentAmount => 'Jumlah per cicilan';

  @override
  String get loanFieldTotalInstallments => 'Jumlah cicilan';

  @override
  String get loanFieldFrequency => 'Frekuensi';

  @override
  String get loanFieldDueDayOfMonth => 'Tanggal jatuh tempo dalam bulan';

  @override
  String get loanFieldStartDate => 'Tanggal mulai';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Ingatkan N hari sebelum jatuh tempo';

  @override
  String get loanFieldNotes => 'Catatan (opsional)';

  @override
  String get loanFrequencyMonthly => 'Bulanan';

  @override
  String get loanFrequencyWeekly => 'Mingguan';

  @override
  String get loanFrequencyBiweekly => 'Dua minggu sekali';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total lunas';
  }

  @override
  String get loanMarkPaid => 'Tandai sudah dibayar';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Tandai $count cicilan sudah dibayar';
  }

  @override
  String get loanStatusPending => 'Belum jatuh tempo';

  @override
  String get loanStatusPaid => 'Lunas';

  @override
  String get loanStatusOverdue => 'Terlambat';

  @override
  String loanInstallmentNumber(int number) {
    return 'Cicilan ke-$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Hapus cicilan ini?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Semua $count cicilan juga akan dihapus.';
  }

  @override
  String get categoryManagerTitle => 'Kategori';

  @override
  String get categoryFormTitleNew => 'Kategori baru';

  @override
  String get categoryFormTitleEdit => 'Edit kategori';

  @override
  String get categoryFieldName => 'Nama';

  @override
  String get categoryFieldNameRequired => 'Nama wajib diisi';

  @override
  String get categoryFieldIcon => 'Ikon';

  @override
  String get categoryFieldColor => 'Warna';

  @override
  String get categoryDeleteSimpleTitle => 'Hapus kategori ini?';

  @override
  String get categoryDeleteSimpleBody =>
      'Kategori ini belum memiliki pengingat.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Kategori ini masih memiliki pengingat';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count pengingat menggunakan kategori ini. Pilih tindakan yang ingin dilakukan.';
  }

  @override
  String get categoryDeleteReassign => 'Pindahkan ke kategori lain';

  @override
  String get categoryDeleteReassignTarget => 'Pindahkan ke';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Hapus semua $count pengingat';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Ini akan menghapus $count pengingat secara permanen. Tindakan ini tidak dapat dibatalkan.';
  }

  @override
  String get categoryReorderHint => 'Seret untuk mengubah urutan';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get settingsDefaultReminderTime => 'Waktu pengingat default';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Terang';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsBackupRestore => 'Cadangkan & pulihkan';

  @override
  String get settingsExport => 'Ekspor cadangan';

  @override
  String get settingsImport => 'Pulihkan dari cadangan';

  @override
  String get settingsExportLocationHint =>
      'Disimpan di Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Cadangan berhasil disimpan';

  @override
  String get settingsImportNoneFound =>
      'Tidak ada file cadangan yang ditemukan';

  @override
  String get settingsImportPickFile => 'Pilih cadangan';

  @override
  String get settingsImportSuccess => 'Cadangan berhasil dipulihkan';

  @override
  String get settingsImportConfirmTitle => 'Pulihkan cadangan?';

  @override
  String get settingsImportConfirmBody =>
      'Ini akan mengganti semua data saat ini dengan isi file cadangan.';

  @override
  String get settingsAbout => 'Tentang';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Notifikasi tidak muncul tepat waktu?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Beberapa merek ponsel (Samsung, Xiaomi, Oppo...) membatasi aplikasi latar belakang secara ketat. Matikan optimisasi baterai untuk iReminder di Pengaturan ponsel > Baterai agar pengingat selalu muncul tepat waktu.';

  @override
  String get errorGeneric => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get errorLoadFailed => 'Data gagal dimuat.';

  @override
  String get settingsAiSectionTitle => 'Asisten AI';

  @override
  String get settingsAiEnable => 'Aktifkan Asisten AI';

  @override
  String get settingsAiProvider => 'Penyedia AI';

  @override
  String get settingsAiModel => 'Model';

  @override
  String get settingsAiApiKey => 'Kunci API';

  @override
  String get settingsAiApiKeyHint => 'Tempel kunci API kamu';

  @override
  String get settingsAiApiKeyHelp => 'Di mana saya bisa mendapatkan kunci?';

  @override
  String get settingsAiApiKeySaved => 'Kunci API tersimpan';

  @override
  String get settingsAiAllowedCategories =>
      'Kategori yang boleh dibaca asisten';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Semua kategori kecuali Keuangan dibagikan secara default — matikan yang tidak ingin dilihat asisten.';

  @override
  String get settingsAiClearHistory => 'Hapus riwayat obrolan';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Hapus riwayat obrolan?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Ini akan menghapus semua pertanyaan dan jawaban yang tersimpan di perangkat ini. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get assistantTitle => 'Asisten';

  @override
  String get assistantEmptyTitle => 'Tanyakan apa saja';

  @override
  String get assistantEmptyBody =>
      'Coba tanyakan \"Apa yang perlu saya lakukan minggu ini?\" atau \"Berapa cicilan motor saya yang tersisa?\"';

  @override
  String get assistantInputHint => 'Tanyakan sesuatu…';

  @override
  String get assistantSend => 'Kirim';

  @override
  String get assistantDisabledTitle => 'Asisten sedang nonaktif';

  @override
  String get assistantDisabledBody =>
      'Aktifkan di Pengaturan dan pilih penyedia AI untuk mulai mengobrol.';

  @override
  String get assistantOpenSettings => 'Buka Pengaturan';

  @override
  String get assistantThinking => 'Sedang berpikir…';

  @override
  String get validationRequired => 'Wajib diisi';

  @override
  String get validationDayOfMonth => 'Masukkan tanggal 1–31';

  @override
  String get validationMonth => 'Masukkan bulan 1–12';

  @override
  String get validationPositiveNumber => 'Masukkan angka lebih besar dari 0';

  @override
  String get validationPositiveInteger =>
      'Masukkan bilangan bulat lebih besar dari 0';

  @override
  String get settingsPermissionsSectionTitle => 'Notifikasi & Alarm';

  @override
  String get settingsPermissionsNotificationLabel => 'Izin notifikasi';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Izin alarm presisi';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Abaikan pengoptimalan baterai (disarankan)';

  @override
  String get settingsTestNotificationAction => 'Uji notifikasi (10 dtk)';

  @override
  String get settingsTestNotificationScheduled =>
      'Terjadwal. Kunci layar atau tinggalkan aplikasi sekarang dan tunggu sekitar 10 detik.';

  @override
  String get settingsPermissionsGranted => 'Diizinkan';

  @override
  String get settingsPermissionsDenied =>
      'Belum diizinkan — pengingat mungkin tidak muncul tepat waktu';

  @override
  String get settingsPermissionsGrantAction => 'Izinkan';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Buka pengaturan';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Satu izin lagi';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'Di layar berikutnya, izinkan iReminder menjadwalkan alarm presisi agar pengingat muncul tepat pada waktu yang kamu tentukan.';

  @override
  String get loanMarkPaidSuccess => 'Ditandai sudah dibayar';

  @override
  String get settingsNotificationPrefsTitle => 'Suara & getaran';

  @override
  String get settingsNotificationSound => 'Suara notifikasi';

  @override
  String get settingsNotificationVibration => 'Getaran';

  @override
  String get settingsSnoozeDuration => 'Durasi tunda';

  @override
  String get snoozeDuration5Min => '5 menit';

  @override
  String get snoozeDuration10Min => '10 menit';

  @override
  String get snoozeDuration15Min => '15 menit';

  @override
  String get snoozeDuration30Min => '30 menit';

  @override
  String get snoozeDuration60Min => '1 jam';

  @override
  String get snoozeDuration120Min => '2 jam';

  @override
  String get defaultCategoryHomeAppliances => 'Rumah & peralatan';

  @override
  String get defaultCategoryVehicles => 'Kendaraan';

  @override
  String get defaultCategoryFamilyEvents => 'Peringatan & keluarga';

  @override
  String get defaultCategoryFinance => 'Keuangan';

  @override
  String get defaultCategoryWork => 'Pekerjaan';

  @override
  String get defaultCategoryFamily => 'Keluarga';

  @override
  String get defaultCategoryOutdoorEvents => 'Jalan-jalan & acara';

  @override
  String get defaultCategoryHealth => 'Kesehatan';

  @override
  String get defaultCategoryBirthday => 'Ulang Tahun';
}
