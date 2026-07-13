// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Bugün';

  @override
  String get navCalendar => 'Takvim';

  @override
  String get navLoans => 'Taksitler';

  @override
  String get navCategories => 'Kategoriler';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get onboardingTitle1 => 'Önemli olanı asla unutmayın';

  @override
  String get onboardingBody1 =>
      'Cihaz bakımını, araç servisini, yıl dönümlerini ve daha fazlasını tek bir yerden takip edin.';

  @override
  String get onboardingTitle2 => 'Tekrarlar artık çok kolay';

  @override
  String get onboardingBody2 =>
      'Günlük, haftalık, aylık, yıllık ya da hatta ay takvimine göre — bir kez ayarlayın, iReminder gerisini halletsin.';

  @override
  String get onboardingTitle3 => '%100 gizli, %100 çevrimdışı';

  @override
  String get onboardingBody3 =>
      'Hesap yok, bulut yok, giriş yok. Her şey telefonunuzda kalır.';

  @override
  String get onboardingSkip => 'Geç';

  @override
  String get onboardingNext => 'İleri';

  @override
  String get onboardingGetStarted => 'Başlayın';

  @override
  String get permissionCheckTitle => 'İzinleri kontrol et';

  @override
  String get permissionCheckIntro =>
      'iReminder\'ın tam olarak belirlediğiniz saatte güvenilir şekilde bildirim gönderebilmesi için bu 3 izne ihtiyacı var. \"Tam zamanlı alarm\" iznini vermek sistem ayarları ekranına yönlendirebilir — bu normaldir.';

  @override
  String get permissionCheckContinueAction => 'Devam et';

  @override
  String get permissionCheckIncompleteTitle => 'İzinler eksik';

  @override
  String get permissionCheckIncompleteBody =>
      'Bu izinler olmadan hatırlatıcılar güvenilir şekilde çalışmayabilir. Daha sonra Ayarlar\'dan verebilirsiniz, ancak unutmak kolaydır.';

  @override
  String get permissionCheckIncompleteStay => 'Geri dön ve izin ver';

  @override
  String get permissionCheckIncompleteContinue => 'Yine de devam et';

  @override
  String get homeSectionOverdue => 'Süresi geçti';

  @override
  String get homeSectionToday => 'Bugün';

  @override
  String get homeSectionThisWeek => 'Bu hafta';

  @override
  String get homeSectionUpcoming => 'Yaklaşan';

  @override
  String get homeEmptyTitle => 'Henüz bir şey yok';

  @override
  String get homeEmptyBody =>
      'İlk hatırlatıcınızı veya taksitli ödemenizi eklemek için + simgesine dokunun.';

  @override
  String get fabAddReminder => 'Hatırlatıcı';

  @override
  String get fabAddLoan => 'Taksitli ödeme';

  @override
  String get actionDone => 'Tamamlandı';

  @override
  String get actionSnooze => 'Ertele';

  @override
  String get actionEdit => 'Düzenle';

  @override
  String get actionDelete => 'Sil';

  @override
  String get actionSave => 'Kaydet';

  @override
  String get actionCancel => 'İptal';

  @override
  String get actionConfirm => 'Onayla';

  @override
  String get actionYes => 'Evet';

  @override
  String get actionNo => 'Hayır';

  @override
  String get actionOk => 'Tamam';

  @override
  String get actionAdd => 'Ekle';

  @override
  String get actionClose => 'Kapat';

  @override
  String get reminderFormTitleNew => 'Yeni hatırlatıcı';

  @override
  String get reminderFormTitleEdit => 'Hatırlatıcıyı düzenle';

  @override
  String get reminderFieldTitle => 'Başlık';

  @override
  String get reminderFieldTitleRequired => 'Başlık gerekli';

  @override
  String get reminderFieldDescription => 'Açıklama (isteğe bağlı)';

  @override
  String get reminderFieldCategory => 'Kategori';

  @override
  String get reminderFieldRecurrence => 'Tekrar';

  @override
  String get reminderFieldStartDate => 'Başlangıç tarihi';

  @override
  String get reminderFieldTime => 'Hatırlatma saati';

  @override
  String get reminderFieldAdvanceNotice => 'Önceden bildir';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Gün';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Saat';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Dakika';

  @override
  String get reminderFieldRecurrenceDay => 'Ayın günü';

  @override
  String get reminderFieldRecurrenceMonth => 'Ay';

  @override
  String get reminderFieldRecurrenceWeekday => 'Haftanın günü';

  @override
  String get reminderFieldIntervalDays => 'Her N günde bir';

  @override
  String get reminderFieldLunarDay => 'Ay takviminde gün';

  @override
  String get reminderFieldLunarMonth => 'Ay takviminde ay';

  @override
  String get reminderFieldLunarToggle => 'Ay takvimi';

  @override
  String get reminderFieldDailyExclusionToggle => 'Günleri hariç tut';

  @override
  String get reminderFieldDailyExclusionKind => 'Hariç tutma türü';

  @override
  String get dailyExclusionKindWeekdays => 'Haftanın gününe göre';

  @override
  String get dailyExclusionKindEvenOdd => 'Çift/tek günler';

  @override
  String get dailyExclusionKindSpecificDay => 'Ayın belirli günü';

  @override
  String get dailyExclusionEvenDays => 'Çift';

  @override
  String get dailyExclusionOddDays => 'Tek';

  @override
  String get reminderFieldDailyExclusionDay => 'Hariç tutulacak gün';

  @override
  String get validationDailyExclusionWeekdays =>
      'Haftanın en az bir günü kalmalı';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (ay takvimi)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Bu hatırlatıcı silinsin mi?';

  @override
  String get reminderDeleteConfirmBody => 'Bu işlem geri alınamaz.';

  @override
  String get reminderScheduleWarning =>
      'Hatırlatıcı kaydedildi, ancak bildirim zamanlanamadı. Bildirim ayarlarını kontrol edin.';

  @override
  String get recurrenceNone => 'Bir kez';

  @override
  String get recurrenceDaily => 'Günlük';

  @override
  String get recurrenceWeekly => 'Haftalık';

  @override
  String get recurrenceMonthly => 'Aylık';

  @override
  String get recurrenceYearly => 'Yıllık';

  @override
  String get recurrenceCustomIntervalDays => 'Her N günde bir';

  @override
  String get recurrenceLunarYearly => 'Yıllık (ay takvimi)';

  @override
  String get weekdayMonday => 'Pazartesi';

  @override
  String get weekdayTuesday => 'Salı';

  @override
  String get weekdayWednesday => 'Çarşamba';

  @override
  String get weekdayThursday => 'Perşembe';

  @override
  String get weekdayFriday => 'Cuma';

  @override
  String get weekdaySaturday => 'Cumartesi';

  @override
  String get weekdaySunday => 'Pazar';

  @override
  String get loanListTitle => 'Taksitler ve krediler';

  @override
  String get loanFormTitleNew => 'Yeni taksitli ödeme';

  @override
  String get loanFormTitleEdit => 'Taksitli ödemeyi düzenle';

  @override
  String get loanFieldName => 'Ad';

  @override
  String get loanFieldCategory => 'Kategori';

  @override
  String get loanFieldTotalAmount => 'Toplam tutar (isteğe bağlı)';

  @override
  String get loanFieldInstallmentAmount => 'Taksit tutarı';

  @override
  String get loanFieldTotalInstallments => 'Taksit sayısı';

  @override
  String get loanFieldFrequency => 'Sıklık';

  @override
  String get loanFieldDueDayOfMonth => 'Ayın vade günü';

  @override
  String get loanFieldStartDate => 'Başlangıç tarihi';

  @override
  String get loanFieldReminderAdvanceDays => 'Vadeden N gün önce hatırlat';

  @override
  String get loanFieldNotes => 'Notlar (isteğe bağlı)';

  @override
  String get loanFrequencyMonthly => 'Aylık';

  @override
  String get loanFrequencyWeekly => 'Haftalık';

  @override
  String get loanFrequencyBiweekly => 'İki haftada bir';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total ödendi';
  }

  @override
  String get loanMarkPaid => 'Ödendi olarak işaretle';

  @override
  String loanMarkPaidBatch(int count) {
    return '$count taksiti ödendi olarak işaretle';
  }

  @override
  String get loanStatusPending => 'Beklemede';

  @override
  String get loanStatusPaid => 'Ödendi';

  @override
  String get loanStatusOverdue => 'Gecikti';

  @override
  String loanInstallmentNumber(int number) {
    return '$number. taksit';
  }

  @override
  String get loanDeleteConfirmTitle => 'Bu taksitli ödeme silinsin mi?';

  @override
  String loanDeleteConfirmBody(int count) {
    return '$count taksitin tamamı da silinecek.';
  }

  @override
  String get categoryManagerTitle => 'Kategoriler';

  @override
  String get categoryFormTitleNew => 'Yeni kategori';

  @override
  String get categoryFormTitleEdit => 'Kategoriyi düzenle';

  @override
  String get categoryFieldName => 'Ad';

  @override
  String get categoryFieldNameRequired => 'Ad gerekli';

  @override
  String get categoryFieldIcon => 'Simge';

  @override
  String get categoryFieldColor => 'Renk';

  @override
  String get categoryDeleteSimpleTitle => 'Bu kategori silinsin mi?';

  @override
  String get categoryDeleteSimpleBody => 'Bu kategoride hiç hatırlatıcı yok.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Bu kategoride hâlâ hatırlatıcılar var';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return 'Bu kategoriyi $count hatırlatıcı kullanıyor. Ne yapmak istediğinizi seçin.';
  }

  @override
  String get categoryDeleteReassign => 'Başka bir kategoriye taşı';

  @override
  String get categoryDeleteReassignTarget => 'Şuraya taşı';

  @override
  String categoryDeleteRemoveAll(int count) {
    return '$count hatırlatıcının tamamını sil';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Bu işlem $count hatırlatıcıyı kalıcı olarak silecek. Bu işlem geri alınamaz.';
  }

  @override
  String get categoryReorderHint => 'Yeniden sıralamak için sürükleyin';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsDefaultReminderTime => 'Varsayılan hatırlatma saati';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistem';

  @override
  String get settingsThemeLight => 'Açık';

  @override
  String get settingsThemeDark => 'Koyu';

  @override
  String get settingsBackupRestore => 'Yedekleme ve geri yükleme';

  @override
  String get settingsExport => 'Yedeği dışa aktar';

  @override
  String get settingsImport => 'Yedekten geri yükle';

  @override
  String get settingsExportLocationHint =>
      'Android/data/com.ireminder.ireminder/files/backups konumuna kaydedildi';

  @override
  String get settingsExportSuccess => 'Yedek kaydedildi';

  @override
  String get settingsImportNoneFound => 'Yedek dosyası bulunamadı';

  @override
  String get settingsImportPickFile => 'Bir yedek seçin';

  @override
  String get settingsImportSuccess => 'Yedek geri yüklendi';

  @override
  String get settingsImportConfirmTitle => 'Yedek geri yüklensin mi?';

  @override
  String get settingsImportConfirmBody =>
      'Bu işlem mevcut tüm verilerin yerine yedek dosyasındaki verileri koyar.';

  @override
  String get settingsAbout => 'Hakkında';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Bildirimler zamanında gelmiyor mu?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Bazı telefon üreticileri (Samsung, Xiaomi, Oppo...) arka plan uygulamalarını agresif biçimde kısıtlar. Hatırlatıcıların her zaman zamanında gelmesi için telefonunuzun Ayarlar > Pil bölümünden iReminder için pil optimizasyonunu kapatın.';

  @override
  String get errorGeneric => 'Bir şeyler ters gitti. Lütfen tekrar deneyin.';

  @override
  String get errorLoadFailed => 'Veriler yüklenemedi.';

  @override
  String get validationRequired => 'Zorunlu';

  @override
  String get validationDayOfMonth => '1-31 arasında bir gün girin';

  @override
  String get validationMonth => '1-12 arasında bir ay girin';

  @override
  String get validationPositiveNumber => '0\'dan büyük bir sayı girin';

  @override
  String get validationPositiveInteger => '0\'dan büyük bir tam sayı girin';

  @override
  String get settingsPermissionsSectionTitle => 'Bildirimler ve Alarmlar';

  @override
  String get settingsPermissionsNotificationLabel => 'Bildirim izni';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Tam zamanlı alarm izni';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Pil optimizasyonunu yok say (önerilir)';

  @override
  String get settingsTestNotificationAction => 'Bildirimi test et (10 sn)';

  @override
  String get settingsTestNotificationScheduled =>
      'Zamanlandı. Şimdi ekranınızı kilitleyin veya uygulamadan çıkın ve yaklaşık 10 saniye bekleyin.';

  @override
  String get settingsPermissionsGranted => 'Verildi';

  @override
  String get settingsPermissionsDenied =>
      'Verilmedi — hatırlatıcılar zamanında çalışmayabilir';

  @override
  String get settingsPermissionsGrantAction => 'İzin ver';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Ayarları aç';

  @override
  String get loanMarkPaidSuccess => 'Ödendi olarak işaretlendi';

  @override
  String get settingsNotificationPrefsTitle => 'Ses ve titreşim';

  @override
  String get settingsNotificationSound => 'Bildirim sesi';

  @override
  String get settingsNotificationVibration => 'Titreşim';

  @override
  String get settingsSnoozeDuration => 'Erteleme süresi';

  @override
  String get snoozeDuration5Min => '5 dakika';

  @override
  String get snoozeDuration10Min => '10 dakika';

  @override
  String get snoozeDuration15Min => '15 dakika';

  @override
  String get snoozeDuration30Min => '30 dakika';

  @override
  String get snoozeDuration60Min => '1 saat';

  @override
  String get snoozeDuration120Min => '2 saat';

  @override
  String get defaultCategoryHomeAppliances => 'Ev ve cihazlar';

  @override
  String get defaultCategoryVehicles => 'Araçlar';

  @override
  String get defaultCategoryFamilyEvents => 'Yıl dönümleri ve aile';

  @override
  String get defaultCategoryFinance => 'Finans';

  @override
  String get defaultCategoryWork => 'İş';

  @override
  String get defaultCategoryFamily => 'Aile';

  @override
  String get defaultCategoryOutdoorEvents => 'Geziler ve etkinlikler';

  @override
  String get defaultCategoryHealth => 'Sağlık';

  @override
  String get defaultCategoryBirthday => 'Doğum Günleri';
}
