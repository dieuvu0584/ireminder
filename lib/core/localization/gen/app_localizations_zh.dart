// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => '今天';

  @override
  String get navCalendar => '日历';

  @override
  String get navLoans => '分期';

  @override
  String get navCategories => '分类';

  @override
  String get navSettings => '设置';

  @override
  String get navAssistant => '助手';

  @override
  String get onboardingTitle1 => '重要的事永不遗忘';

  @override
  String get onboardingBody1 => '设备保养、车辆保养、纪念日等,一个应用全部搞定。';

  @override
  String get onboardingTitle2 => '重复提醒更简单';

  @override
  String get onboardingBody2 => '每天、每周、每月、每年,甚至按农历——设置一次,iReminder 自动帮你记住。';

  @override
  String get onboardingTitle3 => '100% 隐私,100% 离线';

  @override
  String get onboardingBody3 => '无需账号,无需云端,无需登录。所有数据只保存在你的手机上。';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingGetStarted => '开始使用';

  @override
  String get notificationPermissionTitle => '不错过任何事';

  @override
  String get notificationPermissionBody => 'iReminder 需要通知权限,才能在事项到期时提醒你。';

  @override
  String get notificationPermissionAllow => '允许通知';

  @override
  String get notificationPermissionLater => '以后再说';

  @override
  String get homeSectionOverdue => '已过期';

  @override
  String get homeSectionToday => '今天';

  @override
  String get homeSectionThisWeek => '本周';

  @override
  String get homeSectionUpcoming => '即将到来';

  @override
  String get homeEmptyTitle => '暂无提醒事项';

  @override
  String get homeEmptyBody => '点击 + 添加你的第一个提醒或分期付款。';

  @override
  String get fabAddReminder => '提醒事项';

  @override
  String get fabAddLoan => '分期付款';

  @override
  String get actionDone => '完成';

  @override
  String get actionSnooze => '稍后提醒';

  @override
  String get actionEdit => '编辑';

  @override
  String get actionDelete => '删除';

  @override
  String get actionSave => '保存';

  @override
  String get actionCancel => '取消';

  @override
  String get actionConfirm => '确认';

  @override
  String get actionYes => '是';

  @override
  String get actionNo => '否';

  @override
  String get actionOk => '好的';

  @override
  String get actionAdd => '添加';

  @override
  String get actionClose => '关闭';

  @override
  String get reminderFormTitleNew => '新建提醒';

  @override
  String get reminderFormTitleEdit => '编辑提醒';

  @override
  String get reminderFieldTitle => '标题';

  @override
  String get reminderFieldTitleRequired => '请输入标题';

  @override
  String get reminderFieldDescription => '描述(可选)';

  @override
  String get reminderFieldCategory => '分类';

  @override
  String get reminderFieldRecurrence => '重复';

  @override
  String get reminderFieldStartDate => '开始日期';

  @override
  String get reminderFieldTime => '提醒时间';

  @override
  String get reminderFieldAdvanceNotice => '提前 N 天通知';

  @override
  String get reminderFieldRecurrenceDay => '每月日期';

  @override
  String get reminderFieldRecurrenceMonth => '月份';

  @override
  String get reminderFieldRecurrenceWeekday => '星期几';

  @override
  String get reminderFieldIntervalDays => '每 N 天';

  @override
  String get reminderFieldLunarDay => '农历日';

  @override
  String get reminderFieldLunarMonth => '农历月';

  @override
  String get reminderDeleteConfirmTitle => '删除此提醒?';

  @override
  String get reminderDeleteConfirmBody => '此操作无法撤销。';

  @override
  String get recurrenceNone => '仅一次';

  @override
  String get recurrenceDaily => '每天';

  @override
  String get recurrenceWeekly => '每周';

  @override
  String get recurrenceMonthly => '每月';

  @override
  String get recurrenceYearly => '每年';

  @override
  String get recurrenceCustomIntervalDays => '每 N 天';

  @override
  String get recurrenceLunarYearly => '每年(农历)';

  @override
  String get weekdayMonday => '星期一';

  @override
  String get weekdayTuesday => '星期二';

  @override
  String get weekdayWednesday => '星期三';

  @override
  String get weekdayThursday => '星期四';

  @override
  String get weekdayFriday => '星期五';

  @override
  String get weekdaySaturday => '星期六';

  @override
  String get weekdaySunday => '星期日';

  @override
  String get loanListTitle => '分期付款 / 借贷';

  @override
  String get loanFormTitleNew => '新建分期付款';

  @override
  String get loanFormTitleEdit => '编辑分期付款';

  @override
  String get loanFieldName => '名称';

  @override
  String get loanFieldCategory => '分类';

  @override
  String get loanFieldTotalAmount => '总金额(可选)';

  @override
  String get loanFieldInstallmentAmount => '每期金额';

  @override
  String get loanFieldTotalInstallments => '总期数';

  @override
  String get loanFieldFrequency => '还款频率';

  @override
  String get loanFieldDueDayOfMonth => '每月到期日';

  @override
  String get loanFieldStartDate => '开始日期';

  @override
  String get loanFieldReminderAdvanceDays => '提前 N 天提醒';

  @override
  String get loanFieldNotes => '备注(可选)';

  @override
  String get loanFrequencyMonthly => '每月';

  @override
  String get loanFrequencyWeekly => '每周';

  @override
  String get loanFrequencyBiweekly => '每两周';

  @override
  String loanProgress(int paid, int total) {
    return '已还 $paid / $total 期';
  }

  @override
  String get loanMarkPaid => '标记为已还';

  @override
  String loanMarkPaidBatch(int count) {
    return '标记 $count 期为已还';
  }

  @override
  String get loanStatusPending => '待还款';

  @override
  String get loanStatusPaid => '已还款';

  @override
  String get loanStatusOverdue => '已逾期';

  @override
  String loanInstallmentNumber(int number) {
    return '第 $number 期';
  }

  @override
  String get loanDeleteConfirmTitle => '删除此分期付款?';

  @override
  String loanDeleteConfirmBody(int count) {
    return '全部 $count 期也将一并删除。';
  }

  @override
  String get categoryManagerTitle => '分类管理';

  @override
  String get categoryFormTitleNew => '新建分类';

  @override
  String get categoryFormTitleEdit => '编辑分类';

  @override
  String get categoryFieldName => '名称';

  @override
  String get categoryFieldNameRequired => '请输入分类名称';

  @override
  String get categoryFieldIcon => '图标';

  @override
  String get categoryFieldColor => '颜色';

  @override
  String get categoryDefaultBadge => '默认';

  @override
  String get categoryDeleteSimpleTitle => '删除此分类?';

  @override
  String get categoryDeleteSimpleBody => '该分类下暂无提醒事项。';

  @override
  String get categoryDeleteHasRemindersTitle => '该分类仍有提醒事项';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '有 $count 个提醒事项使用此分类,请选择处理方式。';
  }

  @override
  String get categoryDeleteReassign => '移动到其他分类';

  @override
  String get categoryDeleteReassignTarget => '移动到';

  @override
  String categoryDeleteRemoveAll(int count) {
    return '删除全部 $count 个提醒事项';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return '此操作将永久删除 $count 个提醒事项,且无法撤销。';
  }

  @override
  String get categoryReorderHint => '拖动以重新排序';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsDefaultReminderTime => '默认提醒时间';

  @override
  String get settingsTheme => '主题';

  @override
  String get settingsThemeSystem => '跟随系统';

  @override
  String get settingsThemeLight => '浅色';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsBackupRestore => '备份与恢复';

  @override
  String get settingsExport => '导出备份';

  @override
  String get settingsImport => '从备份恢复';

  @override
  String get settingsExportLocationHint =>
      '保存至 Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => '备份已保存';

  @override
  String get settingsImportNoneFound => '未找到备份文件';

  @override
  String get settingsImportPickFile => '选择备份';

  @override
  String get settingsImportSuccess => '已恢复备份';

  @override
  String get settingsImportConfirmTitle => '恢复备份?';

  @override
  String get settingsImportConfirmBody => '此操作将用备份文件中的内容替换当前所有数据。';

  @override
  String get settingsAbout => '关于';

  @override
  String get settingsBatteryOptimizationTitle => '通知没有准时到达?';

  @override
  String get settingsBatteryOptimizationBody =>
      '部分手机厂商(三星、小米、Oppo 等)对后台应用限制较严格。请在手机 设置 > 电池 中关闭对 iReminder 的电池优化,以确保提醒能准时送达。';

  @override
  String get errorGeneric => '出现错误,请重试。';

  @override
  String get errorLoadFailed => '数据加载失败。';

  @override
  String get settingsAiSectionTitle => 'AI 助手';

  @override
  String get settingsAiEnable => '启用 AI 助手';

  @override
  String get settingsAiProvider => 'AI 提供商';

  @override
  String get settingsAiModel => '模型';

  @override
  String get settingsAiApiKey => 'API 密钥';

  @override
  String get settingsAiApiKeyHint => '粘贴你的 API 密钥';

  @override
  String get settingsAiApiKeyHelp => '去哪里获取密钥？';

  @override
  String get settingsAiApiKeySaved => 'API 密钥已保存';

  @override
  String get settingsAiAllowedCategories => '允许助手读取的分类';

  @override
  String get settingsAiAllowedCategoriesHint =>
      '默认全部关闭。仅开启你希望助手看到的分类——不会发送其他任何内容。';

  @override
  String get settingsAiClearHistory => '清除聊天记录';

  @override
  String get settingsAiClearHistoryConfirmTitle => '清除聊天记录？';

  @override
  String get settingsAiClearHistoryConfirmBody => '此设备上保存的所有问题和回答都将被删除，且无法恢复。';

  @override
  String get assistantTitle => '助手';

  @override
  String get assistantEmptyTitle => '问我任何问题';

  @override
  String get assistantEmptyBody => '试试问「这周我需要做什么？」或「我的摩托车贷款还剩几期？」';

  @override
  String get assistantInputHint => '输入问题…';

  @override
  String get assistantSend => '发送';

  @override
  String get assistantDisabledTitle => '助手已关闭';

  @override
  String get assistantDisabledBody => '请在设置中启用并选择一个 AI 提供商以开始聊天。';

  @override
  String get assistantOpenSettings => '打开设置';

  @override
  String get assistantThinking => '思考中…';

  @override
  String get validationRequired => '必填';

  @override
  String get validationDayOfMonth => '请输入 1–31 之间的日期';

  @override
  String get validationMonth => '请输入 1–12 之间的月份';

  @override
  String get validationPositiveNumber => '请输入大于 0 的数字';

  @override
  String get validationPositiveInteger => '请输入大于 0 的整数';

  @override
  String get settingsPermissionsSectionTitle => '通知与闹钟';

  @override
  String get settingsPermissionsNotificationLabel => '通知权限';

  @override
  String get settingsPermissionsExactAlarmLabel => '精确闹钟权限';

  @override
  String get settingsPermissionsGranted => '已授权';

  @override
  String get settingsPermissionsDenied => '未授权——提醒可能无法准时提醒';

  @override
  String get settingsPermissionsGrantAction => '授权';

  @override
  String get settingsPermissionsOpenSettingsAction => '打开设置';

  @override
  String get onboardingExactAlarmRationaleTitle => '还需要一项权限';

  @override
  String get onboardingExactAlarmRationaleBody =>
      '在下一屏，请允许 iReminder 安排精确闹钟，这样提醒才能准时在你设定的时间响起。';
}
