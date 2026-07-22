// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Danh sách việc';

  @override
  String get navCalendar => 'Lịch';

  @override
  String get navLoans => 'Trả góp';

  @override
  String get navCategories => 'Danh mục';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String get onboardingTitle1 => 'Không bao giờ quên việc quan trọng';

  @override
  String get onboardingBody1 =>
      'Theo dõi bảo trì thiết bị, bảo dưỡng xe, giỗ chạp và nhiều việc khác — tất cả trong một ứng dụng.';

  @override
  String get onboardingTitle2 => 'Lặp lại thật đơn giản';

  @override
  String get onboardingBody2 =>
      'Hàng ngày, hàng tuần, hàng tháng, hàng năm, hay theo âm lịch — chỉ cần cài đặt một lần, iReminder sẽ tự nhắc bạn.';

  @override
  String get onboardingTitle3 => 'Riêng tư 100%, offline 100%';

  @override
  String get onboardingBody3 =>
      'Không tài khoản, không cloud, không đăng nhập. Mọi dữ liệu chỉ nằm trên máy của bạn.';

  @override
  String get onboardingSkip => 'Bỏ qua';

  @override
  String get onboardingNext => 'Tiếp theo';

  @override
  String get onboardingGetStarted => 'Bắt đầu';

  @override
  String get permissionCheckTitle => 'Kiểm tra quyền';

  @override
  String get permissionCheckIntro =>
      'iReminder cần đủ 3 quyền dưới đây để nhắc nhở đúng giờ. Khi cấp quyền \"Báo thức chính xác\", máy có thể chuyển sang màn hình Cài đặt hệ thống — đó là bình thường.';

  @override
  String get permissionCheckContinueAction => 'Tiếp tục';

  @override
  String get permissionCheckIncompleteTitle => 'Chưa cấp đủ quyền';

  @override
  String get permissionCheckIncompleteBody =>
      'Nếu thiếu các quyền này, nhắc nhở có thể không hoạt động chính xác. Bạn có thể cấp sau trong Cài đặt, nhưng rất dễ quên.';

  @override
  String get permissionCheckIncompleteStay => 'Quay lại cấp quyền';

  @override
  String get permissionCheckIncompleteContinue => 'Vẫn tiếp tục';

  @override
  String get homeSectionOverdue => 'Quá hạn';

  @override
  String get homeSectionToday => 'Hôm nay';

  @override
  String get homeSectionThisWeek => 'Tuần này';

  @override
  String get homeSectionUpcoming => 'Sắp tới';

  @override
  String get homeEmptyTitle => 'Chưa có việc nào';

  @override
  String get homeEmptyBody =>
      'Nhấn + để thêm nhắc việc hoặc khoản trả góp đầu tiên.';

  @override
  String get fabAddReminder => 'Nhắc việc';

  @override
  String get fabAddLoan => 'Khoản trả góp';

  @override
  String get actionDone => 'Đã xong';

  @override
  String get actionSnooze => 'Nhắc lại sau';

  @override
  String get actionEdit => 'Sửa';

  @override
  String get actionDelete => 'Xóa';

  @override
  String get actionSave => 'Lưu';

  @override
  String get actionCancel => 'Hủy';

  @override
  String get actionConfirm => 'Xác nhận';

  @override
  String get actionYes => 'Có';

  @override
  String get actionNo => 'Không';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Thêm';

  @override
  String get actionClose => 'Đóng';

  @override
  String get reminderFormTitleNew => 'Nhắc việc mới';

  @override
  String get reminderFormTitleEdit => 'Sửa nhắc việc';

  @override
  String get reminderFieldTitle => 'Tiêu đề';

  @override
  String get reminderFieldTitleRequired => 'Vui lòng nhập tiêu đề';

  @override
  String get reminderFieldDescription => 'Mô tả (không bắt buộc)';

  @override
  String get reminderFieldCategory => 'Danh mục';

  @override
  String get reminderFieldRecurrence => 'Lặp lại';

  @override
  String get reminderFieldStartDate => 'Ngày bắt đầu';

  @override
  String get reminderFieldTime => 'Giờ nhắc';

  @override
  String get reminderFieldAdvanceNotice => 'Báo trước';

  @override
  String get reminderFieldAdvanceNoticeDays => 'Ngày';

  @override
  String get reminderFieldAdvanceNoticeHours => 'Giờ';

  @override
  String get reminderFieldAdvanceNoticeMinutes => 'Phút';

  @override
  String get reminderFieldRecurrenceDay => 'Ngày trong tháng';

  @override
  String get reminderFieldRecurrenceMonth => 'Tháng';

  @override
  String get reminderFieldRecurrenceWeekday => 'Thứ trong tuần';

  @override
  String get reminderFieldIntervalDays => 'Mỗi N ngày';

  @override
  String get reminderFieldLunarDay => 'Ngày âm lịch';

  @override
  String get reminderFieldLunarMonth => 'Tháng âm lịch';

  @override
  String get reminderFieldLunarToggle => 'Âm lịch';

  @override
  String get reminderFieldDailyExclusionToggle => 'Loại trừ ngày';

  @override
  String get reminderFieldDailyExclusionKind => 'Kiểu loại trừ';

  @override
  String get dailyExclusionKindWeekdays => 'Theo thứ trong tuần';

  @override
  String get dailyExclusionKindEvenOdd => 'Ngày chẵn/lẻ';

  @override
  String get dailyExclusionKindSpecificDay => 'Ngày cụ thể trong tháng';

  @override
  String get dailyExclusionEvenDays => 'Chẵn';

  @override
  String get dailyExclusionOddDays => 'Lẻ';

  @override
  String get reminderFieldDailyExclusionDay => 'Ngày cần loại trừ';

  @override
  String get validationDailyExclusionWeekdays =>
      'Phải giữ lại ít nhất một ngày trong tuần';

  @override
  String get validationDailyExclusionSpecificDay =>
      'Định dạng không hợp lệ. Dùng dấu phẩy và gạch ngang, vd: 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (âm lịch)';
  }

  @override
  String get reminderDeleteConfirmTitle => 'Xóa nhắc việc này?';

  @override
  String get reminderDeleteConfirmBody => 'Không thể hoàn tác sau khi xóa.';

  @override
  String get reminderScheduleWarning =>
      'Đã lưu nhắc việc, nhưng không lên lịch được thông báo. Hãy kiểm tra lại cài đặt thông báo.';

  @override
  String get recurrenceNone => 'Một lần';

  @override
  String get recurrenceDaily => 'Hàng ngày';

  @override
  String get recurrenceWeekly => 'Hàng tuần';

  @override
  String get recurrenceMonthly => 'Hàng tháng';

  @override
  String get recurrenceYearly => 'Hàng năm';

  @override
  String get recurrenceCustomIntervalDays => 'Mỗi N ngày';

  @override
  String get recurrenceLunarYearly => 'Hàng năm (âm lịch)';

  @override
  String get recurrenceLunarMonthly => 'Hàng tháng (âm lịch)';

  @override
  String get weekdayMonday => 'Thứ Hai';

  @override
  String get weekdayTuesday => 'Thứ Ba';

  @override
  String get weekdayWednesday => 'Thứ Tư';

  @override
  String get weekdayThursday => 'Thứ Năm';

  @override
  String get weekdayFriday => 'Thứ Sáu';

  @override
  String get weekdaySaturday => 'Thứ Bảy';

  @override
  String get weekdaySunday => 'Chủ Nhật';

  @override
  String get loanListTitle => 'Khoản trả góp / trả nợ';

  @override
  String get loanFormTitleNew => 'Khoản trả góp mới';

  @override
  String get loanFormTitleEdit => 'Sửa khoản trả góp';

  @override
  String get loanFieldName => 'Tên khoản vay';

  @override
  String get loanFieldCategory => 'Danh mục';

  @override
  String get loanFieldTotalAmount => 'Tổng nợ gốc (không bắt buộc)';

  @override
  String get loanFieldInstallmentAmount => 'Số tiền mỗi kỳ';

  @override
  String get loanFieldTotalInstallments => 'Số kỳ trả';

  @override
  String get loanFieldFrequency => 'Tần suất';

  @override
  String get loanFieldDueDayOfMonth => 'Ngày đến hạn trong tháng';

  @override
  String get loanFieldStartDate => 'Ngày bắt đầu';

  @override
  String get loanFieldReminderAdvanceDays => 'Nhắc trước N ngày';

  @override
  String get loanFieldNotes => 'Ghi chú (không bắt buộc)';

  @override
  String get loanFrequencyMonthly => 'Hàng tháng';

  @override
  String get loanFrequencyWeekly => 'Hàng tuần';

  @override
  String get loanFrequencyBiweekly => 'Hai tuần một lần';

  @override
  String get loanFrequencyQuarterly => 'Hàng quý';

  @override
  String get loanFrequencySemiAnnually => 'Hàng 6 tháng';

  @override
  String get loanFrequencyYearly => 'Hàng năm';

  @override
  String loanProgress(int paid, int total) {
    return 'Đã trả $paid / $total kỳ';
  }

  @override
  String get loanMarkPaid => 'Đánh dấu đã trả';

  @override
  String get loanStatusPending => 'Chưa đến hạn';

  @override
  String get loanStatusPaid => 'Đã trả';

  @override
  String get loanStatusOverdue => 'Quá hạn';

  @override
  String loanInstallmentNumber(int number) {
    return 'Kỳ #$number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Xóa khoản trả góp này?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Toàn bộ $count kỳ trả cũng sẽ bị xóa.';
  }

  @override
  String get categoryManagerTitle => 'Quản lý danh mục';

  @override
  String get categoryFormTitleNew => 'Danh mục mới';

  @override
  String get categoryFormTitleEdit => 'Sửa danh mục';

  @override
  String get categoryFieldName => 'Tên danh mục';

  @override
  String get categoryFieldNameRequired => 'Vui lòng nhập tên danh mục';

  @override
  String get categoryFieldIcon => 'Biểu tượng';

  @override
  String get categoryFieldColor => 'Màu sắc';

  @override
  String get categoryDeleteSimpleTitle => 'Xóa danh mục này?';

  @override
  String get categoryDeleteSimpleBody => 'Danh mục này chưa có nhắc việc nào.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Danh mục này vẫn còn nhắc việc';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return 'Có $count nhắc việc đang dùng danh mục này. Hãy chọn cách xử lý.';
  }

  @override
  String get categoryDeleteReassign => 'Chuyển sang danh mục khác';

  @override
  String get categoryDeleteReassignTarget => 'Chuyển đến';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Xóa toàn bộ $count nhắc việc';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Thao tác này sẽ xóa vĩnh viễn $count nhắc việc. Không thể hoàn tác.';
  }

  @override
  String get categoryReorderHint => 'Kéo để sắp xếp lại';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get settingsLanguage => 'Ngôn ngữ';

  @override
  String get settingsDefaultReminderTime => 'Giờ nhắc mặc định';

  @override
  String get settingsTheme => 'Giao diện';

  @override
  String get settingsThemeSystem => 'Theo hệ thống';

  @override
  String get settingsThemeLight => 'Sáng';

  @override
  String get settingsThemeDark => 'Tối';

  @override
  String get settingsBackupRestore => 'Sao lưu & phục hồi';

  @override
  String get settingsExport => 'Xuất file sao lưu';

  @override
  String get settingsImport => 'Phục hồi từ file sao lưu';

  @override
  String get settingsExportLocationHint =>
      'Lưu tại Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Đã lưu file sao lưu';

  @override
  String get settingsImportNoneFound => 'Không tìm thấy file sao lưu nào';

  @override
  String get settingsImportPickFile => 'Chọn file sao lưu';

  @override
  String get settingsImportSuccess => 'Đã phục hồi dữ liệu';

  @override
  String get settingsImportConfirmTitle => 'Phục hồi dữ liệu?';

  @override
  String get settingsImportConfirmBody =>
      'Toàn bộ dữ liệu hiện tại sẽ bị thay thế bằng nội dung trong file sao lưu.';

  @override
  String get settingsAbout => 'Thông tin ứng dụng';

  @override
  String get settingsBatteryOptimizationTitle =>
      'Thông báo không hiện đúng giờ?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Một số hãng máy (Samsung, Xiaomi, Oppo...) tối ưu pin khá gắt, hạn chế app chạy nền. Hãy vào Cài đặt máy > Pin, tắt tối ưu pin cho iReminder để đảm bảo thông báo luôn đến đúng giờ.';

  @override
  String get errorGeneric => 'Đã có lỗi xảy ra. Vui lòng thử lại.';

  @override
  String get errorLoadFailed => 'Không tải được dữ liệu.';

  @override
  String get validationRequired => 'Bắt buộc';

  @override
  String get validationDayOfMonth => 'Nhập ngày từ 1–31';

  @override
  String get validationMonth => 'Nhập tháng từ 1–12';

  @override
  String get validationPositiveNumber => 'Nhập số lớn hơn 0';

  @override
  String get validationPositiveInteger => 'Nhập số nguyên lớn hơn 0';

  @override
  String get settingsPermissionsSectionTitle => 'Thông báo & Báo thức';

  @override
  String get settingsPermissionsNotificationLabel => 'Quyền thông báo';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Quyền báo thức chính xác';

  @override
  String get settingsPermissionsBatteryLabel =>
      'Bỏ qua tối ưu hóa pin (khuyến nghị)';

  @override
  String get settingsTestNotificationAction => 'Kiểm tra thông báo (10 giây)';

  @override
  String get settingsTestNotificationScheduled =>
      'Đã lên lịch. Hãy khóa màn hình hoặc thoát khỏi app ngay và chờ khoảng 10 giây.';

  @override
  String get settingsPermissionsGranted => 'Đã cấp quyền';

  @override
  String get settingsPermissionsDenied =>
      'Chưa được cấp — nhắc nhở có thể không hiện đúng giờ';

  @override
  String get settingsPermissionsGrantAction => 'Cấp quyền';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Mở cài đặt';

  @override
  String get loanMarkPaidSuccess => 'Đã đánh dấu là đã trả';

  @override
  String get settingsNotificationPrefsTitle => 'Âm thanh & rung';

  @override
  String get settingsNotificationSound => 'Âm thanh thông báo';

  @override
  String get settingsNotificationVibration => 'Rung';

  @override
  String get settingsSnoozeDuration => 'Thời gian nhắc lại';

  @override
  String get snoozeDuration5Min => '5 phút';

  @override
  String get snoozeDuration10Min => '10 phút';

  @override
  String get snoozeDuration15Min => '15 phút';

  @override
  String get snoozeDuration30Min => '30 phút';

  @override
  String get snoozeDuration60Min => '1 giờ';

  @override
  String get snoozeDuration120Min => '2 giờ';

  @override
  String get defaultCategoryHomeAppliances => 'Nhà cửa';

  @override
  String get defaultCategoryVehicles => 'Xe cộ';

  @override
  String get defaultCategoryFamilyEvents => 'Giỗ chạp';

  @override
  String get defaultCategoryFinance => 'Tài chính';

  @override
  String get defaultCategoryWork => 'Công việc';

  @override
  String get defaultCategoryFamily => 'Gia đình';

  @override
  String get defaultCategoryOutdoorEvents => 'Sự kiện';

  @override
  String get defaultCategoryHealth => 'Sức khỏe';

  @override
  String get defaultCategoryBirthday => 'Sinh nhật';

  @override
  String get defaultCategoryFood => 'Ăn uống';
}
