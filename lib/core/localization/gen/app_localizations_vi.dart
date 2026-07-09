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
  String get navToday => 'Hôm nay';

  @override
  String get navCalendar => 'Lịch';

  @override
  String get navLoans => 'Trả góp';

  @override
  String get navCategories => 'Danh mục';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String get navAssistant => 'Trợ lý';

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
  String get onboardingTitle3 => 'Riêng tư 100%, chạy offline 100%';

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
  String get notificationPermissionTitle => 'Không bỏ lỡ việc cần làm';

  @override
  String get notificationPermissionBody =>
      'iReminder cần quyền gửi thông báo để nhắc bạn khi đến hạn.';

  @override
  String get notificationPermissionAllow => 'Cho phép thông báo';

  @override
  String get notificationPermissionLater => 'Để sau';

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
  String get reminderFieldAdvanceNotice => 'Báo trước N ngày';

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
  String get reminderDeleteConfirmTitle => 'Xóa nhắc việc này?';

  @override
  String get reminderDeleteConfirmBody => 'Không thể hoàn tác sau khi xóa.';

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
  String loanProgress(int paid, int total) {
    return 'Đã trả $paid / $total kỳ';
  }

  @override
  String get loanMarkPaid => 'Đánh dấu đã trả';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Đánh dấu $count kỳ đã trả';
  }

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
  String get categoryDefaultBadge => 'Mặc định';

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
  String get settingsExportSuccess => 'Đã lưu file sao lưu';

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
  String get settingsAiSectionTitle => 'Trợ lý AI';

  @override
  String get settingsAiEnable => 'Bật Trợ lý AI';

  @override
  String get settingsAiProvider => 'Nhà cung cấp AI';

  @override
  String get settingsAiModel => 'Model';

  @override
  String get settingsAiApiKey => 'API key';

  @override
  String get settingsAiApiKeyHint => 'Dán API key của bạn vào đây';

  @override
  String get settingsAiApiKeyHelp => 'Lấy key ở đâu?';

  @override
  String get settingsAiApiKeySaved => 'Đã lưu API key';

  @override
  String get settingsAiAllowedCategories => 'Danh mục cho phép Trợ lý đọc';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Mặc định tắt hết. Chỉ bật những danh mục bạn muốn Trợ lý nhìn thấy — không có gì khác được gửi đi.';

  @override
  String get settingsAiClearHistory => 'Xóa lịch sử chat';

  @override
  String get settingsAiClearHistoryConfirmTitle => 'Xóa lịch sử chat?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Toàn bộ câu hỏi và câu trả lời lưu trên máy sẽ bị xóa. Không thể hoàn tác.';

  @override
  String get assistantTitle => 'Trợ lý';

  @override
  String get assistantEmptyTitle => 'Hỏi Trợ lý bất cứ điều gì';

  @override
  String get assistantEmptyBody =>
      'Thử hỏi \"Tuần này tôi cần làm gì?\" hoặc \"Còn bao nhiêu kỳ nữa hết nợ xe máy?\"';

  @override
  String get assistantInputHint => 'Nhập câu hỏi…';

  @override
  String get assistantSend => 'Gửi';

  @override
  String get assistantDisabledTitle => 'Trợ lý đang tắt';

  @override
  String get assistantDisabledBody =>
      'Bật tính năng này trong Cài đặt và chọn nhà cung cấp AI để bắt đầu trò chuyện.';

  @override
  String get assistantOpenSettings => 'Mở Cài đặt';

  @override
  String get assistantThinking => 'Đang suy nghĩ…';
}
