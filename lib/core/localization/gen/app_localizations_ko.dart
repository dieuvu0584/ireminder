// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => '오늘';

  @override
  String get navCalendar => '캘린더';

  @override
  String get navLoans => '할부';

  @override
  String get navCategories => '카테고리';

  @override
  String get navSettings => '설정';

  @override
  String get onboardingTitle1 => '중요한 일을 절대 잊지 마세요';

  @override
  String get onboardingBody1 => '기기 관리, 자동차 점검, 기념일 등을 한곳에서 관리하세요.';

  @override
  String get onboardingTitle2 => '반복 설정도 간단하게';

  @override
  String get onboardingBody2 =>
      '매일, 매주, 매월, 매년, 심지어 음력까지 — 한 번만 설정하면 iReminder가 알아서 챙겨드려요.';

  @override
  String get onboardingTitle3 => '100% 비공개, 100% 오프라인';

  @override
  String get onboardingBody3 =>
      '계정도, 클라우드도, 로그인도 필요 없어요. 모든 데이터는 내 휴대폰에만 저장됩니다.';

  @override
  String get onboardingSkip => '건너뛰기';

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingGetStarted => '시작하기';

  @override
  String get permissionCheckTitle => '권한 확인';

  @override
  String get permissionCheckIntro =>
      'iReminder가 설정한 정확한 시간에 알림을 보내려면 아래 3가지 권한이 필요합니다. \"정확한 알람\" 권한을 허용하면 시스템 설정 화면으로 이동할 수 있습니다 — 정상적인 동작입니다.';

  @override
  String get permissionCheckContinueAction => '계속';

  @override
  String get permissionCheckIncompleteTitle => '권한이 완료되지 않음';

  @override
  String get permissionCheckIncompleteBody =>
      '이 권한이 없으면 알림이 정확히 울리지 않을 수 있습니다. 나중에 설정에서 허용할 수 있지만 잊기 쉽습니다.';

  @override
  String get permissionCheckIncompleteStay => '돌아가서 허용';

  @override
  String get permissionCheckIncompleteContinue => '그래도 계속';

  @override
  String get homeSectionOverdue => '기한 지남';

  @override
  String get homeSectionToday => '오늘';

  @override
  String get homeSectionThisWeek => '이번 주';

  @override
  String get homeSectionUpcoming => '예정';

  @override
  String get homeEmptyTitle => '아직 아무것도 없어요';

  @override
  String get homeEmptyBody => '＋를 눌러 첫 리마인더나 할부를 추가해 보세요.';

  @override
  String get fabAddReminder => '리마인더';

  @override
  String get fabAddLoan => '할부';

  @override
  String get actionDone => '완료';

  @override
  String get actionSnooze => '다시 알림';

  @override
  String get actionEdit => '수정';

  @override
  String get actionDelete => '삭제';

  @override
  String get actionSave => '저장';

  @override
  String get actionCancel => '취소';

  @override
  String get actionConfirm => '확인';

  @override
  String get actionYes => '예';

  @override
  String get actionNo => '아니요';

  @override
  String get actionOk => '확인';

  @override
  String get actionAdd => '추가';

  @override
  String get actionClose => '닫기';

  @override
  String get reminderFormTitleNew => '새 리마인더';

  @override
  String get reminderFormTitleEdit => '리마인더 수정';

  @override
  String get reminderFieldTitle => '제목';

  @override
  String get reminderFieldTitleRequired => '제목을 입력해 주세요';

  @override
  String get reminderFieldDescription => '설명 (선택 사항)';

  @override
  String get reminderFieldCategory => '카테고리';

  @override
  String get reminderFieldRecurrence => '반복';

  @override
  String get reminderFieldStartDate => '시작일';

  @override
  String get reminderFieldTime => '알림 시간';

  @override
  String get reminderFieldAdvanceNotice => '미리 알림';

  @override
  String get reminderFieldAdvanceNoticeDays => '일';

  @override
  String get reminderFieldAdvanceNoticeHours => '시간';

  @override
  String get reminderFieldAdvanceNoticeMinutes => '분';

  @override
  String get reminderFieldRecurrenceDay => '매월 날짜';

  @override
  String get reminderFieldRecurrenceMonth => '월';

  @override
  String get reminderFieldRecurrenceWeekday => '요일';

  @override
  String get reminderFieldIntervalDays => 'N일마다';

  @override
  String get reminderFieldLunarDay => '음력 날짜';

  @override
  String get reminderFieldLunarMonth => '음력 월';

  @override
  String get reminderFieldLunarToggle => '음력';

  @override
  String get reminderFieldDailyExclusionToggle => '요일 제외';

  @override
  String get reminderFieldDailyExclusionKind => '제외 유형';

  @override
  String get dailyExclusionKindWeekdays => '요일별';

  @override
  String get dailyExclusionKindEvenOdd => '짝수/홀수 날짜';

  @override
  String get dailyExclusionKindSpecificDay => '매월 특정 날짜';

  @override
  String get dailyExclusionEvenDays => '짝수';

  @override
  String get dailyExclusionOddDays => '홀수';

  @override
  String get reminderFieldDailyExclusionDay => '제외할 날짜';

  @override
  String get validationDailyExclusionWeekdays => '최소 하루의 요일은 남겨야 합니다';

  @override
  String get validationDailyExclusionSpecificDay =>
      '잘못된 형식입니다. 쉼표와 하이픈을 사용하세요. 예: 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date (음력)';
  }

  @override
  String get reminderDeleteConfirmTitle => '이 리마인더를 삭제할까요?';

  @override
  String get reminderDeleteConfirmBody => '삭제하면 되돌릴 수 없어요.';

  @override
  String get reminderScheduleWarning =>
      '리마인더는 저장되었지만 알림을 예약할 수 없었습니다. 알림 설정을 확인하세요.';

  @override
  String get recurrenceNone => '한 번만';

  @override
  String get recurrenceDaily => '매일';

  @override
  String get recurrenceWeekly => '매주';

  @override
  String get recurrenceMonthly => '매월';

  @override
  String get recurrenceYearly => '매년';

  @override
  String get recurrenceCustomIntervalDays => 'N일마다';

  @override
  String get recurrenceLunarYearly => '매년 (음력)';

  @override
  String get recurrenceLunarMonthly => '매월 (음력)';

  @override
  String get weekdayMonday => '월요일';

  @override
  String get weekdayTuesday => '화요일';

  @override
  String get weekdayWednesday => '수요일';

  @override
  String get weekdayThursday => '목요일';

  @override
  String get weekdayFriday => '금요일';

  @override
  String get weekdaySaturday => '토요일';

  @override
  String get weekdaySunday => '일요일';

  @override
  String get loanListTitle => '대출 및 할부';

  @override
  String get loanFormTitleNew => '새 할부';

  @override
  String get loanFormTitleEdit => '할부 수정';

  @override
  String get loanFieldName => '이름';

  @override
  String get loanFieldCategory => '카테고리';

  @override
  String get loanFieldTotalAmount => '총액 (선택 사항)';

  @override
  String get loanFieldInstallmentAmount => '회당 납부액';

  @override
  String get loanFieldTotalInstallments => '총 납부 횟수';

  @override
  String get loanFieldFrequency => '납부 주기';

  @override
  String get loanFieldDueDayOfMonth => '매월 납부일';

  @override
  String get loanFieldStartDate => '시작일';

  @override
  String get loanFieldReminderAdvanceDays => '납부일 N일 전에 알림';

  @override
  String get loanFieldNotes => '메모 (선택 사항)';

  @override
  String get loanFrequencyMonthly => '매월';

  @override
  String get loanFrequencyWeekly => '매주';

  @override
  String get loanFrequencyBiweekly => '격주';

  @override
  String get loanFrequencyQuarterly => '분기별';

  @override
  String get loanFrequencySemiAnnually => '6개월마다';

  @override
  String get loanFrequencyYearly => '매년';

  @override
  String loanProgress(int paid, int total) {
    return '$total회 중 $paid회 납부';
  }

  @override
  String get loanMarkPaid => '납부 완료로 표시';

  @override
  String loanMarkPaidBatch(int count) {
    return '$count회를 납부 완료로 표시';
  }

  @override
  String get loanStatusPending => '대기 중';

  @override
  String get loanStatusPaid => '납부 완료';

  @override
  String get loanStatusOverdue => '연체';

  @override
  String loanInstallmentNumber(int number) {
    return '$number회차';
  }

  @override
  String get loanDeleteConfirmTitle => '이 할부를 삭제할까요?';

  @override
  String loanDeleteConfirmBody(int count) {
    return '전체 $count회 납부 내역도 함께 삭제됩니다.';
  }

  @override
  String get categoryManagerTitle => '카테고리';

  @override
  String get categoryFormTitleNew => '새 카테고리';

  @override
  String get categoryFormTitleEdit => '카테고리 수정';

  @override
  String get categoryFieldName => '이름';

  @override
  String get categoryFieldNameRequired => '이름을 입력해 주세요';

  @override
  String get categoryFieldIcon => '아이콘';

  @override
  String get categoryFieldColor => '색상';

  @override
  String get categoryDeleteSimpleTitle => '이 카테고리를 삭제할까요?';

  @override
  String get categoryDeleteSimpleBody => '이 카테고리에는 리마인더가 없어요.';

  @override
  String get categoryDeleteHasRemindersTitle => '이 카테고리에는 아직 리마인더가 있어요';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count개의 리마인더가 이 카테고리를 사용 중이에요. 처리 방법을 선택해 주세요.';
  }

  @override
  String get categoryDeleteReassign => '다른 카테고리로 이동';

  @override
  String get categoryDeleteReassignTarget => '이동할 카테고리';

  @override
  String categoryDeleteRemoveAll(int count) {
    return '$count개 리마인더 모두 삭제';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return '$count개의 리마인더가 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없어요.';
  }

  @override
  String get categoryReorderHint => '드래그하여 순서 변경';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsDefaultReminderTime => '기본 알림 시간';

  @override
  String get settingsTheme => '테마';

  @override
  String get settingsThemeSystem => '시스템 설정';

  @override
  String get settingsThemeLight => '라이트';

  @override
  String get settingsThemeDark => '다크';

  @override
  String get settingsBackupRestore => '백업 및 복원';

  @override
  String get settingsExport => '백업 내보내기';

  @override
  String get settingsImport => '백업에서 복원';

  @override
  String get settingsExportLocationHint =>
      'Android/data/com.ireminder.ireminder/files/backups 에 저장됩니다';

  @override
  String get settingsExportSuccess => '백업이 저장되었어요';

  @override
  String get settingsImportNoneFound => '백업 파일을 찾을 수 없어요';

  @override
  String get settingsImportPickFile => '백업 선택';

  @override
  String get settingsImportSuccess => '백업이 복원되었어요';

  @override
  String get settingsImportConfirmTitle => '백업을 복원할까요?';

  @override
  String get settingsImportConfirmBody => '현재 데이터가 모두 백업 파일의 내용으로 대체됩니다.';

  @override
  String get settingsAbout => '정보';

  @override
  String get settingsBatteryOptimizationTitle => '알림이 제때 오지 않나요?';

  @override
  String get settingsBatteryOptimizationBody =>
      '일부 제조사(삼성, 샤오미, 오포 등)는 백그라운드 앱을 강하게 제한해요. 휴대폰의 설정 > 배터리에서 iReminder의 배터리 최적화를 꺼서 알림이 항상 제때 오도록 해주세요.';

  @override
  String get errorGeneric => '문제가 발생했어요. 다시 시도해 주세요.';

  @override
  String get errorLoadFailed => '데이터를 불러오지 못했어요.';

  @override
  String get validationRequired => '필수 입력 항목이에요';

  @override
  String get validationDayOfMonth => '1~31 사이의 날짜를 입력해 주세요';

  @override
  String get validationMonth => '1~12 사이의 월을 입력해 주세요';

  @override
  String get validationPositiveNumber => '0보다 큰 숫자를 입력해 주세요';

  @override
  String get validationPositiveInteger => '0보다 큰 정수를 입력해 주세요';

  @override
  String get settingsPermissionsSectionTitle => '알림 및 알람';

  @override
  String get settingsPermissionsNotificationLabel => '알림 권한';

  @override
  String get settingsPermissionsExactAlarmLabel => '정확한 알람 권한';

  @override
  String get settingsPermissionsBatteryLabel => '배터리 최적화 무시 (권장)';

  @override
  String get settingsTestNotificationAction => '알림 테스트 (10초)';

  @override
  String get settingsTestNotificationScheduled =>
      '예약되었습니다. 지금 화면을 잠그거나 앱을 나가서 약 10초 기다려주세요.';

  @override
  String get settingsPermissionsGranted => '허용됨';

  @override
  String get settingsPermissionsDenied => '허용되지 않음 — 리마인더가 제때 울리지 않을 수 있어요';

  @override
  String get settingsPermissionsGrantAction => '허용';

  @override
  String get settingsPermissionsOpenSettingsAction => '설정 열기';

  @override
  String get loanMarkPaidSuccess => '납부 완료로 표시했어요';

  @override
  String get settingsNotificationPrefsTitle => '소리 및 진동';

  @override
  String get settingsNotificationSound => '알림 소리';

  @override
  String get settingsNotificationVibration => '진동';

  @override
  String get settingsSnoozeDuration => '다시 알림 시간';

  @override
  String get snoozeDuration5Min => '5분';

  @override
  String get snoozeDuration10Min => '10분';

  @override
  String get snoozeDuration15Min => '15분';

  @override
  String get snoozeDuration30Min => '30분';

  @override
  String get snoozeDuration60Min => '1시간';

  @override
  String get snoozeDuration120Min => '2시간';

  @override
  String get defaultCategoryHomeAppliances => '집과 가전제품';

  @override
  String get defaultCategoryVehicles => '차량';

  @override
  String get defaultCategoryFamilyEvents => '기념일과 가족';

  @override
  String get defaultCategoryFinance => '재정';

  @override
  String get defaultCategoryWork => '직장';

  @override
  String get defaultCategoryFamily => '가족';

  @override
  String get defaultCategoryOutdoorEvents => '나들이와 행사';

  @override
  String get defaultCategoryHealth => '건강';

  @override
  String get defaultCategoryBirthday => '생일';

  @override
  String get defaultCategoryFood => '식사';
}
