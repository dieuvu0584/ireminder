// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'タスクリスト';

  @override
  String get navCalendar => 'カレンダー';

  @override
  String get navLoans => '分割払い';

  @override
  String get navCategories => 'カテゴリ';

  @override
  String get navSettings => '設定';

  @override
  String get onboardingTitle1 => '大事なことを忘れない';

  @override
  String get onboardingBody1 => '家電のメンテナンス、車の点検、記念日など、すべてを一つの場所で管理できます。';

  @override
  String get onboardingTitle2 => '繰り返し設定も簡単';

  @override
  String get onboardingBody2 =>
      '毎日、毎週、毎月、毎年、さらには旧暦にも対応。一度設定すればiReminderが覚えておきます。';

  @override
  String get onboardingTitle3 => '完全プライベート、完全オフライン';

  @override
  String get onboardingBody3 =>
      'アカウント登録も、クラウド連携も、ログインも不要。データはすべてあなたのスマホの中だけに残ります。';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingNext => '次へ';

  @override
  String get onboardingGetStarted => 'はじめる';

  @override
  String get permissionCheckTitle => '権限を確認';

  @override
  String get permissionCheckIntro =>
      'iReminder が正確な時刻に通知するには、次の3つの権限が必要です。「正確なアラーム」を許可すると、システム設定画面に移動することがありますが、これは想定内の動作です。';

  @override
  String get permissionCheckContinueAction => '続ける';

  @override
  String get permissionCheckIncompleteTitle => '権限が不足しています';

  @override
  String get permissionCheckIncompleteBody =>
      'これらの権限がないと、リマインダーが確実に通知されない場合があります。後から設定画面で許可することもできますが、忘れやすいのでご注意ください。';

  @override
  String get permissionCheckIncompleteStay => '戻って許可する';

  @override
  String get permissionCheckIncompleteContinue => 'このまま続ける';

  @override
  String get homeSectionOverdue => '期限切れ';

  @override
  String get homeSectionToday => '今日';

  @override
  String get homeSectionThisWeek => '今週';

  @override
  String get homeSectionUpcoming => '今後の予定';

  @override
  String get homeEmptyTitle => 'まだ何もありません';

  @override
  String get homeEmptyBody => '＋をタップして、最初のリマインダーや分割払いを追加しましょう。';

  @override
  String get fabAddReminder => 'リマインダー';

  @override
  String get fabAddLoan => '分割払い';

  @override
  String get actionDone => '完了';

  @override
  String get actionSnooze => 'あとで通知';

  @override
  String get actionEdit => '編集';

  @override
  String get actionDelete => '削除';

  @override
  String get actionSave => '保存';

  @override
  String get actionCancel => 'キャンセル';

  @override
  String get actionConfirm => '確認';

  @override
  String get actionYes => 'はい';

  @override
  String get actionNo => 'いいえ';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => '追加';

  @override
  String get actionClose => '閉じる';

  @override
  String get reminderFormTitleNew => '新しいリマインダー';

  @override
  String get reminderFormTitleEdit => 'リマインダーを編集';

  @override
  String get reminderFieldTitle => 'タイトル';

  @override
  String get reminderFieldTitleRequired => 'タイトルを入力してください';

  @override
  String get reminderFieldDescription => '説明（任意）';

  @override
  String get reminderFieldCategory => 'カテゴリ';

  @override
  String get reminderFieldRecurrence => '繰り返し';

  @override
  String get reminderFieldStartDate => '開始日';

  @override
  String get reminderFieldTime => '通知時刻';

  @override
  String get reminderFieldAdvanceNotice => '事前に通知';

  @override
  String get reminderFieldAdvanceNoticeDays => '日';

  @override
  String get reminderFieldAdvanceNoticeHours => '時間';

  @override
  String get reminderFieldAdvanceNoticeMinutes => '分';

  @override
  String get reminderFieldRecurrenceDay => '日にち';

  @override
  String get reminderFieldRecurrenceMonth => '月';

  @override
  String get reminderFieldRecurrenceWeekday => '曜日';

  @override
  String get reminderFieldIntervalDays => 'N日ごと';

  @override
  String get reminderFieldLunarDay => '旧暦の日';

  @override
  String get reminderFieldLunarMonth => '旧暦の月';

  @override
  String get reminderFieldLunarToggle => '旧暦';

  @override
  String get reminderFieldDailyExclusionToggle => '曜日を除外';

  @override
  String get reminderFieldDailyExclusionKind => '除外タイプ';

  @override
  String get dailyExclusionKindWeekdays => '曜日ごと';

  @override
  String get dailyExclusionKindEvenOdd => '偶数/奇数日';

  @override
  String get dailyExclusionKindSpecificDay => '月の特定の日';

  @override
  String get dailyExclusionEvenDays => '偶数';

  @override
  String get dailyExclusionOddDays => '奇数';

  @override
  String get reminderFieldDailyExclusionDay => '除外する日';

  @override
  String get validationDailyExclusionWeekdays => '少なくとも1つの曜日を残してください';

  @override
  String get validationDailyExclusionSpecificDay =>
      '形式が無効です。カンマとハイフンを使用してください。例: 1,3,5-7';

  @override
  String reminderLunarDateLabel(String date) {
    return '$date（旧暦）';
  }

  @override
  String get reminderDeleteConfirmTitle => 'このリマインダーを削除しますか？';

  @override
  String get reminderDeleteConfirmBody => 'この操作は元に戻せません。';

  @override
  String get reminderScheduleWarning =>
      'リマインダーは保存されましたが、通知をスケジュールできませんでした。通知設定を確認してください。';

  @override
  String get recurrenceNone => '1回のみ';

  @override
  String get recurrenceDaily => '毎日';

  @override
  String get recurrenceWeekly => '毎週';

  @override
  String get recurrenceMonthly => '毎月';

  @override
  String get recurrenceYearly => '毎年';

  @override
  String get recurrenceCustomIntervalDays => 'N日ごと';

  @override
  String get recurrenceLunarYearly => '毎年（旧暦）';

  @override
  String get recurrenceLunarMonthly => '毎月（旧暦）';

  @override
  String get weekdayMonday => '月曜日';

  @override
  String get weekdayTuesday => '火曜日';

  @override
  String get weekdayWednesday => '水曜日';

  @override
  String get weekdayThursday => '木曜日';

  @override
  String get weekdayFriday => '金曜日';

  @override
  String get weekdaySaturday => '土曜日';

  @override
  String get weekdaySunday => '日曜日';

  @override
  String get loanListTitle => 'ローン・分割払い';

  @override
  String get loanFormTitleNew => '新しい分割払い';

  @override
  String get loanFormTitleEdit => '分割払いを編集';

  @override
  String get loanFieldName => '名前';

  @override
  String get loanFieldCategory => 'カテゴリ';

  @override
  String get loanFieldTotalAmount => '合計金額（任意）';

  @override
  String get loanFieldInstallmentAmount => '1回あたりの支払額';

  @override
  String get loanFieldTotalInstallments => '支払い回数';

  @override
  String get loanFieldFrequency => '頻度';

  @override
  String get loanFieldDueDayOfMonth => '毎月の支払日';

  @override
  String get loanFieldStartDate => '開始日';

  @override
  String get loanFieldReminderAdvanceDays => '支払期限のN日前に通知';

  @override
  String get loanFieldNotes => 'メモ（任意）';

  @override
  String get loanFrequencyMonthly => '毎月';

  @override
  String get loanFrequencyWeekly => '毎週';

  @override
  String get loanFrequencyBiweekly => '隔週';

  @override
  String get loanFrequencyQuarterly => '四半期ごと';

  @override
  String get loanFrequencySemiAnnually => '6か月ごと';

  @override
  String get loanFrequencyYearly => '毎年';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total 回 支払い済み';
  }

  @override
  String get loanMarkPaid => '支払い済みにする';

  @override
  String get loanStatusPending => '未払い';

  @override
  String get loanStatusPaid => '支払い済み';

  @override
  String get loanStatusOverdue => '延滞';

  @override
  String loanInstallmentNumber(int number) {
    return '第$number回';
  }

  @override
  String get loanDeleteConfirmTitle => 'この分割払いを削除しますか？';

  @override
  String loanDeleteConfirmBody(int count) {
    return '$count回分の支払いもすべて削除されます。';
  }

  @override
  String get categoryManagerTitle => 'カテゴリ';

  @override
  String get categoryFormTitleNew => '新しいカテゴリ';

  @override
  String get categoryFormTitleEdit => 'カテゴリを編集';

  @override
  String get categoryFieldName => '名前';

  @override
  String get categoryFieldNameRequired => '名前を入力してください';

  @override
  String get categoryFieldIcon => 'アイコン';

  @override
  String get categoryFieldColor => '色';

  @override
  String get categoryDeleteSimpleTitle => 'このカテゴリを削除しますか？';

  @override
  String get categoryDeleteSimpleBody => 'このカテゴリにはリマインダーがありません。';

  @override
  String get categoryDeleteHasRemindersTitle => 'このカテゴリにはまだリマインダーがあります';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count件のリマインダーがこのカテゴリを使用しています。どうするか選択してください。';
  }

  @override
  String get categoryDeleteReassign => '別のカテゴリに移動';

  @override
  String get categoryDeleteReassignTarget => '移動先';

  @override
  String categoryDeleteRemoveAll(int count) {
    return '$count件のリマインダーをすべて削除';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return '$count件のリマインダーが完全に削除されます。この操作は元に戻せません。';
  }

  @override
  String get categoryReorderHint => 'ドラッグして並べ替え';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsDefaultReminderTime => 'デフォルトの通知時刻';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get settingsThemeSystem => '端末の設定に従う';

  @override
  String get settingsThemeLight => 'ライト';

  @override
  String get settingsThemeDark => 'ダーク';

  @override
  String get settingsBackupRestore => 'バックアップと復元';

  @override
  String get settingsExport => 'バックアップを作成';

  @override
  String get settingsImport => 'バックアップから復元';

  @override
  String get settingsExportLocationHint =>
      'Android/data/com.ireminder.ireminder/files/backups に保存されます';

  @override
  String get settingsExportSuccess => 'バックアップを保存しました';

  @override
  String get settingsImportNoneFound => 'バックアップファイルが見つかりません';

  @override
  String get settingsImportPickFile => 'バックアップを選択';

  @override
  String get settingsImportSuccess => 'バックアップを復元しました';

  @override
  String get settingsImportConfirmTitle => 'バックアップを復元しますか？';

  @override
  String get settingsImportConfirmBody => '現在のすべてのデータがバックアップファイルの内容に置き換わります。';

  @override
  String get settingsAbout => 'アプリについて';

  @override
  String get settingsBatteryOptimizationTitle => '通知が時間通りに届きませんか？';

  @override
  String get settingsBatteryOptimizationBody =>
      '一部のメーカー（Samsung、Xiaomi、Oppoなど）はバックグラウンドアプリを厳しく制限しています。端末の「設定 > バッテリー」でiReminderのバッテリー最適化をオフにすると、通知が確実に時間通り届くようになります。';

  @override
  String get errorGeneric => '問題が発生しました。もう一度お試しください。';

  @override
  String get errorLoadFailed => 'データを読み込めませんでした。';

  @override
  String get validationRequired => '入力してください';

  @override
  String get validationDayOfMonth => '1〜31の日にちを入力してください';

  @override
  String get validationMonth => '1〜12の月を入力してください';

  @override
  String get validationPositiveNumber => '0より大きい数値を入力してください';

  @override
  String get validationPositiveInteger => '0より大きい整数を入力してください';

  @override
  String get settingsPermissionsSectionTitle => '通知とアラーム';

  @override
  String get settingsPermissionsNotificationLabel => '通知の権限';

  @override
  String get settingsPermissionsExactAlarmLabel => '正確なアラームの権限';

  @override
  String get settingsPermissionsBatteryLabel => 'バッテリー最適化を無視する（推奨）';

  @override
  String get settingsTestNotificationAction => '通知をテスト（10秒後）';

  @override
  String get settingsTestNotificationScheduled =>
      'スケジュール済みです。画面をロックするかアプリを閉じて、約10秒待ってください。';

  @override
  String get settingsPermissionsGranted => '許可済み';

  @override
  String get settingsPermissionsDenied => '未許可 — リマインダーが時間通りに届かない場合があります';

  @override
  String get settingsPermissionsGrantAction => '許可する';

  @override
  String get settingsPermissionsOpenSettingsAction => '設定を開く';

  @override
  String get loanMarkPaidSuccess => '支払い済みにしました';

  @override
  String get settingsNotificationPrefsTitle => 'サウンドとバイブレーション';

  @override
  String get settingsNotificationSound => '通知音';

  @override
  String get settingsNotificationVibration => 'バイブレーション';

  @override
  String get settingsSnoozeDuration => 'スヌーズ時間';

  @override
  String get snoozeDuration5Min => '5分';

  @override
  String get snoozeDuration10Min => '10分';

  @override
  String get snoozeDuration15Min => '15分';

  @override
  String get snoozeDuration30Min => '30分';

  @override
  String get snoozeDuration60Min => '1時間';

  @override
  String get snoozeDuration120Min => '2時間';

  @override
  String get defaultCategoryHomeAppliances => '家';

  @override
  String get defaultCategoryVehicles => '車両';

  @override
  String get defaultCategoryFamilyEvents => '記念日';

  @override
  String get defaultCategoryFinance => '財務';

  @override
  String get defaultCategoryWork => '仕事';

  @override
  String get defaultCategoryFamily => '家族';

  @override
  String get defaultCategoryOutdoorEvents => 'イベント';

  @override
  String get defaultCategoryHealth => '健康';

  @override
  String get defaultCategoryBirthday => '誕生日';

  @override
  String get defaultCategoryFood => '食事';
}
