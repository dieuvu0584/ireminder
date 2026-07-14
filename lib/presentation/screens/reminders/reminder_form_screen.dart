import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/lunar_converter.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/enums/recurrence_type.dart';
import '../../../domain/models/daily_exclusion.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../widgets/lunar_date_picker.dart';
import '../../widgets/save_action_button.dart';

class ReminderFormScreen extends ConsumerStatefulWidget {
  final Reminder? existing;
  final int? initialCategoryId;
  final DateTime? initialStartDate;

  const ReminderFormScreen({
    super.key,
    this.existing,
    this.initialCategoryId,
    this.initialStartDate,
  });

  @override
  ConsumerState<ReminderFormScreen> createState() => _ReminderFormScreenState();
}

class _ReminderFormScreenState extends ConsumerState<ReminderFormScreen> {
  /// Recurrence types the lunar toggle applies to. Yearly/monthly repeat
  /// on a fixed lunar day(+month), which needs its own anchor field. The
  /// other two — a one-off due date and "every N days" — have no such
  /// anchor: "every N days" counts elapsed days regardless of calendar
  /// system, so lunar mode there (like for a one-off) is purely which
  /// picker backs the Start date field, not a change to how the next
  /// occurrence is computed.
  static const _lunarCapableTypes = {
    RecurrenceType.none,
    RecurrenceType.monthly,
    RecurrenceType.yearly,
    RecurrenceType.customIntervalDays,
  };

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;

  int? _categoryId;
  RecurrenceType _recurrenceType = RecurrenceType.none;
  bool _isLunar = false;
  int? _recurrenceDay;
  int? _recurrenceMonth;
  int? _recurrenceWeekday;
  int? _intervalDays;

  /// Null means no exclusion — daily fires every day, same as before this
  /// feature existed.
  DailyExclusionType? _dailyExclusionType;
  Set<int> _dailyExclusionWeekdays = {};
  bool _dailyExclusionExcludeEven = true;
  Set<int>? _dailyExclusionDays;
  late final TextEditingController _dailyExclusionDaysCtrl;

  late DateTime _startDate;
  TimeOfDay _time = const TimeOfDay(hour: 9, minute: 0);
  int _advanceNoticeDays = 0;
  int _advanceNoticeHours = 0;
  int _advanceNoticeMinutes = 0;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final r = widget.existing;
    _titleCtrl = TextEditingController(text: r?.title ?? '');
    _descCtrl = TextEditingController(text: r?.description ?? '');
    _categoryId = r?.categoryId ?? widget.initialCategoryId;
    if (r == null) {
      // New reminders can't start in the past — e.g. the "+" FAB prefills
      // whatever day is selected on the calendar, which may be a past day
      // being browsed. Clamp up to today rather than silently letting a
      // past start date through.
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final requested = widget.initialStartDate ?? today;
      _startDate = requested.isBefore(today) ? today : requested;
    } else {
      _startDate = r.startDate;
    }
    if (r != null) {
      final type = RecurrenceType.fromDbValue(r.recurrenceType);
      switch (type) {
        case RecurrenceType.lunarYearly:
          _recurrenceType = RecurrenceType.yearly;
          _isLunar = true;
        case RecurrenceType.lunarMonthly:
          _recurrenceType = RecurrenceType.monthly;
          _isLunar = true;
        default:
          _recurrenceType = type;
          // RecurrenceType.none has no dedicated lunar_* variant (its due
          // date is just its own solar nextDueDate/startDate either way) —
          // isLunar is the only signal for whether it was picked via the
          // lunar-annotated date picker.
          _isLunar = r.isLunar;
      }
      _recurrenceDay = r.recurrenceDay;
      _recurrenceMonth = r.recurrenceMonth;
      _recurrenceWeekday = r.recurrenceWeekday;
      _intervalDays = r.recurrenceInterval;
      if (_recurrenceType == RecurrenceType.monthly &&
          !_isLunar &&
          _recurrenceDay != null) {
        // The Start date field displays/derives _startDate directly now
        // (see its onTap) — for a non-lunar monthly reminder saved before
        // that (or from anywhere recurrenceDay and startDate.day could
        // otherwise disagree), align startDate's day-of-month to the
        // actually-active recurrenceDay so what's shown matches what's
        // really scheduled, without waiting for the user to touch the
        // field.
        final maxDay = DateTime(_startDate.year, _startDate.month + 1, 0).day;
        final day = _recurrenceDay!.clamp(1, maxDay);
        _startDate = DateTime(_startDate.year, _startDate.month, day);
      }
      if (_recurrenceType == RecurrenceType.yearly &&
          !_isLunar &&
          _recurrenceDay != null &&
          _recurrenceMonth != null) {
        // Same reasoning as the monthly block above, but yearly also
        // carries its own month — align both onto _startDate.
        final month = _recurrenceMonth!.clamp(1, 12);
        final maxDay = DateTime(_startDate.year, month + 1, 0).day;
        final day = _recurrenceDay!.clamp(1, maxDay);
        _startDate = DateTime(_startDate.year, month, day);
      }
      final exclusion = DailyExclusion.fromDb(
        r.dailyExclusionType,
        r.dailyExclusionValue,
      );
      if (exclusion != null) {
        _dailyExclusionType = exclusion.type;
        _dailyExclusionWeekdays = exclusion.weekdays ?? {};
        _dailyExclusionExcludeEven = exclusion.excludeEvenDays ?? true;
        _dailyExclusionDays = exclusion.days;
      }
      _advanceNoticeDays = r.advanceNoticeDays;
      _advanceNoticeHours = r.advanceNoticeHours;
      _advanceNoticeMinutes = r.advanceNoticeMinutes;
      final parts = r.reminderTime.split(':');
      _time = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
    // Re-derived from _dailyExclusionDays (canonical form) rather than
    // whatever the user originally typed — see formatDaysCompact.
    _dailyExclusionDaysCtrl = TextEditingController(
      text: _dailyExclusionDays == null
          ? ''
          : DailyExclusion.formatDaysCompact(_dailyExclusionDays!),
    );
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _dailyExclusionDaysCtrl.dispose();
    super.dispose();
  }

  String get _timeString =>
      '${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')}';

  /// A reminder's start date (solar or lunar-anchor) can't be picked
  /// further out than Dec 31 of next year — applies to every date picker
  /// on this form, native and lunar alike.
  DateTime get _maxStartDate {
    final year = DateTime.now().year;
    return DateTime(year + 1, 12, 31);
  }

  /// New reminders can't be backdated. An existing reminder's start date
  /// (or, for yearly/monthly lunar, whichever solar date its anchor was
  /// last picked from) may already be a legitimately past day — e.g. a
  /// yearly reminder created years ago — so editing keeps the wider range
  /// down to that value instead, both to avoid an assertion failure from
  /// the picker's initialDate falling outside [firstDate, lastDate] and
  /// to not force moving it forward just to open the picker at all.
  /// Applies to every date picker on this form, native and lunar alike —
  /// including the yearly/monthly lunar anchor, which sets _startDate
  /// from the same pick (see those onTap handlers).
  DateTime get _startDateFirstBound {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (widget.existing == null) return today;
    return _startDate.isBefore(today) ? _startDate : today;
  }

  /// Builds the exclusion rule to actually save, from whichever kind is
  /// currently selected — null if exclusion is off or this isn't a daily
  /// reminder at all (switching the Repeat dropdown away from Daily
  /// doesn't clear the picked-out state, so this must gate on the current
  /// type too, not just whether an exclusion type is set).
  DailyExclusion? _currentDailyExclusion() {
    if (_recurrenceType != RecurrenceType.daily) return null;
    switch (_dailyExclusionType) {
      case null:
        return null;
      case DailyExclusionType.weekdays:
        return DailyExclusion.weekdays(_dailyExclusionWeekdays);
      case DailyExclusionType.evenOdd:
        return DailyExclusion.evenOdd(_dailyExclusionExcludeEven);
      case DailyExclusionType.specificDay:
        return (_dailyExclusionDays == null || _dailyExclusionDays!.isEmpty)
            ? null
            : DailyExclusion.specificDay(_dailyExclusionDays!);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_categoryId == null) return;
    if (_recurrenceType == RecurrenceType.daily &&
        _dailyExclusionType == DailyExclusionType.weekdays &&
        (_dailyExclusionWeekdays.isEmpty ||
            _dailyExclusionWeekdays.length >= 7)) {
      // Not a FormField, so Form.validate() above doesn't catch this —
      // checked manually instead. Excluding all 7 weekdays would mean
      // "never fire", and an empty selection is just an incomplete pick.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).validationDailyExclusionWeekdays,
          ),
        ),
      );
      return;
    }
    setState(() => _saving = true);
    final actions = ref.read(reminderActionsProvider);
    final effectiveType = switch (_recurrenceType) {
      RecurrenceType.yearly when _isLunar => RecurrenceType.lunarYearly,
      RecurrenceType.monthly when _isLunar => RecurrenceType.lunarMonthly,
      _ => _recurrenceType,
    };
    final dailyExclusion = _currentDailyExclusion();
    try {
      bool scheduled;
      String? scheduleError;
      if (widget.existing == null) {
        final result = await actions.create(
          title: _titleCtrl.text.trim(),
          description: _descCtrl.text.trim().isEmpty
              ? null
              : _descCtrl.text.trim(),
          categoryId: _categoryId!,
          recurrenceType: effectiveType,
          recurrenceInterval: _intervalDays,
          recurrenceDay: _recurrenceDay,
          recurrenceMonth: _recurrenceMonth,
          recurrenceWeekday: _recurrenceWeekday,
          isLunar: _isLunar,
          dailyExclusion: dailyExclusion,
          startDate: _startDate,
          reminderTime: _timeString,
          advanceNoticeDays: _advanceNoticeDays,
          advanceNoticeHours: _advanceNoticeHours,
          advanceNoticeMinutes: _advanceNoticeMinutes,
        );
        scheduled = result.$2;
        scheduleError = result.$3;
      } else {
        final result = await actions.update(
          widget.existing!.copyWith(
            title: _titleCtrl.text.trim(),
            description: drift.Value(
              _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
            ),
            categoryId: _categoryId!,
            recurrenceType: effectiveType.dbValue,
            recurrenceInterval: drift.Value(_intervalDays),
            recurrenceDay: drift.Value(_recurrenceDay),
            recurrenceMonth: drift.Value(_recurrenceMonth),
            recurrenceWeekday: drift.Value(_recurrenceWeekday),
            isLunar: _isLunar,
            dailyExclusionType: drift.Value(dailyExclusion?.type.dbValue),
            dailyExclusionValue: drift.Value(dailyExclusion?.dbValue),
            startDate: _startDate,
            reminderTime: _timeString,
            advanceNoticeDays: _advanceNoticeDays,
            advanceNoticeHours: _advanceNoticeHours,
            advanceNoticeMinutes: _advanceNoticeMinutes,
          ),
        );
        scheduled = result.$1;
        scheduleError = result.$2;
      }
      if (mounted) {
        if (!scheduled) {
          final base = AppLocalizations.of(context).reminderScheduleWarning;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                scheduleError == null ? base : '$base\n$scheduleError',
              ),
              duration: const Duration(seconds: 10),
            ),
          );
        }
        Navigator.of(context).pop();
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).errorGeneric)),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  String _recurrenceLabel(AppLocalizations l10n, RecurrenceType type) {
    switch (type) {
      case RecurrenceType.none:
        return l10n.recurrenceNone;
      case RecurrenceType.daily:
        return l10n.recurrenceDaily;
      case RecurrenceType.weekly:
        return l10n.recurrenceWeekly;
      case RecurrenceType.monthly:
        return l10n.recurrenceMonthly;
      case RecurrenceType.yearly:
        return l10n.recurrenceYearly;
      case RecurrenceType.customIntervalDays:
        return l10n.recurrenceCustomIntervalDays;
      case RecurrenceType.lunarYearly:
        return l10n.recurrenceLunarYearly;
      case RecurrenceType.lunarMonthly:
        // Unreachable via the UI, same as lunarYearly below — see the
        // Repeat dropdown's `items` filter, which never offers this value
        // directly (monthly lunar is represented as
        // RecurrenceType.monthly + _isLunar instead).
        return l10n.recurrenceMonthly;
    }
  }

  String _weekdayLabel(AppLocalizations l10n, int weekday) {
    const labels = [
      null,
      'weekdayMonday',
      'weekdayTuesday',
      'weekdayWednesday',
      'weekdayThursday',
      'weekdayFriday',
      'weekdaySaturday',
      'weekdaySunday',
    ];
    switch (labels[weekday]) {
      case 'weekdayMonday':
        return l10n.weekdayMonday;
      case 'weekdayTuesday':
        return l10n.weekdayTuesday;
      case 'weekdayWednesday':
        return l10n.weekdayWednesday;
      case 'weekdayThursday':
        return l10n.weekdayThursday;
      case 'weekdayFriday':
        return l10n.weekdayFriday;
      case 'weekdaySaturday':
        return l10n.weekdaySaturday;
      default:
        return l10n.weekdaySunday;
    }
  }

  String _dailyExclusionKindLabel(
    AppLocalizations l10n,
    DailyExclusionType type,
  ) {
    switch (type) {
      case DailyExclusionType.weekdays:
        return l10n.dailyExclusionKindWeekdays;
      case DailyExclusionType.evenOdd:
        return l10n.dailyExclusionKindEvenOdd;
      case DailyExclusionType.specificDay:
        return l10n.dailyExclusionKindSpecificDay;
    }
  }

  /// Locale-aware Mon..Sun single/double-letter abbreviations (e.g. "T2" in
  /// Vietnamese, matching the Calendar tab's weekday header) — the full
  /// weekday names used elsewhere on this form (the weekly dropdown, the
  /// lunar toggle's own labels) don't fit seven across on one line here.
  String _shortWeekdayLabel(int weekday) {
    final sundayFirst = MaterialLocalizations.of(context).narrowWeekdays;
    final mondayFirst = [...sundayFirst.sublist(1), sundayFirst[0]];
    return mondayFirst[weekday - 1];
  }

  List<Widget> _buildDailyExclusionValueFields(AppLocalizations l10n) {
    switch (_dailyExclusionType!) {
      case DailyExclusionType.weekdays:
        final tooMany = _dailyExclusionWeekdays.length >= 7;
        return [
          Wrap(
            spacing: 8,
            children: List.generate(7, (i) {
              final weekday = i + 1;
              final selected = _dailyExclusionWeekdays.contains(weekday);
              return FilterChip(
                label: Text(_shortWeekdayLabel(weekday)),
                selected: selected,
                onSelected: (v) => setState(() {
                  if (v) {
                    _dailyExclusionWeekdays.add(weekday);
                  } else {
                    _dailyExclusionWeekdays.remove(weekday);
                  }
                }),
              );
            }),
          ),
          if (tooMany)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                l10n.validationDailyExclusionWeekdays,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
        ];
      case DailyExclusionType.evenOdd:
        return [
          SegmentedButton<bool>(
            segments: [
              ButtonSegment(
                value: true,
                label: Text(l10n.dailyExclusionEvenDays),
              ),
              ButtonSegment(
                value: false,
                label: Text(l10n.dailyExclusionOddDays),
              ),
            ],
            selected: {_dailyExclusionExcludeEven},
            onSelectionChanged: (s) =>
                setState(() => _dailyExclusionExcludeEven = s.first),
          ),
        ];
      case DailyExclusionType.specificDay:
        return [
          TextFormField(
            controller: _dailyExclusionDaysCtrl,
            decoration: InputDecoration(
              labelText: l10n.reminderFieldDailyExclusionDay,
              hintText: '1,3,5-7',
            ),
            onChanged: (v) {
              try {
                _dailyExclusionDays = DailyExclusion.parseDaysCompact(v);
              } on InvalidDaysCompactFormat {
                _dailyExclusionDays = null;
              }
            },
            validator: (v) {
              try {
                DailyExclusion.parseDaysCompact(v ?? '');
                return null;
              } on InvalidDaysCompactFormat {
                return l10n.validationDailyExclusionSpecificDay;
              }
            },
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(categoriesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.existing == null
              ? l10n.reminderFormTitleNew
              : l10n.reminderFormTitleEdit,
        ),
        actions: [
          SaveActionButton(
            label: l10n.actionSave,
            onPressed: _saving ? null : _submit,
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              categoriesAsync.when(
                data: (categories) => DropdownButtonFormField<int>(
                  initialValue: _categoryId,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: l10n.reminderFieldCategory,
                  ),
                  items: categories
                      .map(
                        (c) => DropdownMenuItem(
                          value: c.id,
                          child: Text(c.name, overflow: TextOverflow.ellipsis),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _categoryId = v),
                  validator: (v) => v == null ? l10n.validationRequired : null,
                ),
                loading: () => const LinearProgressIndicator(),
                error: (e, st) => Text(l10n.errorLoadFailed),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _titleCtrl,
                decoration: InputDecoration(labelText: l10n.reminderFieldTitle),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? l10n.reminderFieldTitleRequired
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descCtrl,
                decoration: InputDecoration(
                  labelText: l10n.reminderFieldDescription,
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<RecurrenceType>(
                initialValue: _recurrenceType,
                decoration: InputDecoration(
                  labelText: l10n.reminderFieldRecurrence,
                ),
                items: RecurrenceType.values
                    .where(
                      (t) =>
                          t != RecurrenceType.lunarYearly &&
                          t != RecurrenceType.lunarMonthly,
                    )
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(_recurrenceLabel(l10n, t)),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() {
                  _recurrenceType = v!;
                  // Lunar mode carries over across the three types that
                  // support it (a fixed lunar day, with or without a fixed
                  // lunar month) rather than resetting on every switch —
                  // only reset it for a type that has no lunar concept at
                  // all.
                  if (!_lunarCapableTypes.contains(_recurrenceType)) {
                    _isLunar = false;
                  }
                }),
              ),
              const SizedBox(height: 12),
              ..._buildRecurrenceFields(l10n),
              const SizedBox(height: 12),
              // A single shared date field for every recurrence type — none
              // of them keep a separate anchor UI anymore. Monthly reads
              // just the day-of-month component; yearly reads day+month;
              // none/customIntervalDays/daily/weekly ignore both (kept in
              // sync here anyway, harmless since unused). The lunar toggle
              // only changes which picker backs it (native vs
              // lunar-annotated), not what gets derived from the result.
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.reminderFieldStartDate),
                subtitle: Text(
                  _isLunar
                      ? l10n.reminderLunarDateLabel(
                          LunarConverter.formatDayMonth(_startDate),
                        )
                      : '${_startDate.year}-${_startDate.month.toString().padLeft(2, '0')}-${_startDate.day.toString().padLeft(2, '0')}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  if (_isLunar) {
                    final picked = await showLunarDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: _startDateFirstBound,
                      lastDate: _maxStartDate,
                    );
                    if (picked != null) {
                      final lunar = LunarConverter.solarToLunar(picked);
                      setState(() {
                        _startDate = picked;
                        _recurrenceDay = lunar.day;
                        _recurrenceMonth = lunar.month;
                      });
                    }
                    return;
                  }
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: _startDateFirstBound,
                    lastDate: _maxStartDate,
                  );
                  if (picked != null) {
                    setState(() {
                      _startDate = picked;
                      _recurrenceDay = picked.day;
                      _recurrenceMonth = picked.month;
                    });
                  }
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.reminderFieldTime),
                subtitle: Text(_timeString),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: _time,
                  );
                  if (picked != null) setState(() => _time = picked);
                },
              ),
              const SizedBox(height: 12),
              Text(
                l10n.reminderFieldAdvanceNotice,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _advanceNoticeDays.toString(),
                      decoration: InputDecoration(
                        labelText: l10n.reminderFieldAdvanceNoticeDays,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (v) =>
                          _advanceNoticeDays = int.tryParse(v) ?? 0,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      initialValue: _advanceNoticeHours.toString(),
                      decoration: InputDecoration(
                        labelText: l10n.reminderFieldAdvanceNoticeHours,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (v) =>
                          _advanceNoticeHours = int.tryParse(v) ?? 0,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      initialValue: _advanceNoticeMinutes.toString(),
                      decoration: InputDecoration(
                        labelText: l10n.reminderFieldAdvanceNoticeMinutes,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (v) =>
                          _advanceNoticeMinutes = int.tryParse(v) ?? 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  String? _validatePositiveInterval(AppLocalizations l10n, String? v) {
    final n = int.tryParse(v ?? '');
    if (n == null || n < 1) return l10n.validationPositiveInteger;
    return null;
  }

  List<Widget> _buildRecurrenceFields(AppLocalizations l10n) {
    switch (_recurrenceType) {
      case RecurrenceType.none:
        // No separate recurrence anchor to pick here — the lunar toggle
        // just switches which picker backs the "Start date" field below
        // (see its `if (_recurrenceType == RecurrenceType.none || ...)`
        // condition further down in build()).
        return [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.brightness_2_outlined),
            title: Text(l10n.reminderFieldLunarToggle),
            value: _isLunar,
            onChanged: (v) => setState(() => _isLunar = v),
          ),
        ];
      case RecurrenceType.daily:
        return [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.event_busy),
            title: Text(l10n.reminderFieldDailyExclusionToggle),
            value: _dailyExclusionType != null,
            onChanged: (v) => setState(() {
              _dailyExclusionType = v ? DailyExclusionType.weekdays : null;
            }),
          ),
          if (_dailyExclusionType != null) ...[
            DropdownButtonFormField<DailyExclusionType>(
              initialValue: _dailyExclusionType,
              decoration: InputDecoration(
                labelText: l10n.reminderFieldDailyExclusionKind,
              ),
              items: DailyExclusionType.values
                  .map(
                    (t) => DropdownMenuItem(
                      value: t,
                      child: Text(_dailyExclusionKindLabel(l10n, t)),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _dailyExclusionType = v),
            ),
            const SizedBox(height: 12),
            ..._buildDailyExclusionValueFields(l10n),
          ],
        ];
      case RecurrenceType.weekly:
        return [
          DropdownButtonFormField<int>(
            initialValue: _recurrenceWeekday,
            decoration: InputDecoration(
              labelText: l10n.reminderFieldRecurrenceWeekday,
            ),
            items: List.generate(
              7,
              (i) => DropdownMenuItem(
                value: i + 1,
                child: Text(_weekdayLabel(l10n, i + 1)),
              ),
            ),
            onChanged: (v) => setState(() => _recurrenceWeekday = v),
            validator: (v) => v == null ? l10n.validationRequired : null,
          ),
        ];
      case RecurrenceType.monthly:
        // No separate day field here — its day-of-month comes straight
        // from _startDate (kept in sync by the shared "Start date" field's
        // onTap below, both the solar and lunar branches), same pattern as
        // RecurrenceType.none.
        return [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.brightness_2_outlined),
            title: Text(l10n.reminderFieldLunarToggle),
            value: _isLunar,
            onChanged: (v) => setState(() => _isLunar = v),
          ),
        ];
      case RecurrenceType.yearly:
        // No separate day+month fields here either (see monthly above) —
        // both come straight from _startDate (solar month+day, or the
        // picked lunar day+month), kept in sync by the shared "Start date"
        // field's onTap below.
        return [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.brightness_2_outlined),
            title: Text(l10n.reminderFieldLunarToggle),
            value: _isLunar,
            onChanged: (v) => setState(() => _isLunar = v),
          ),
        ];
      case RecurrenceType.customIntervalDays:
        return [
          TextFormField(
            initialValue: _intervalDays?.toString() ?? '',
            decoration: InputDecoration(
              labelText: l10n.reminderFieldIntervalDays,
            ),
            keyboardType: TextInputType.number,
            onChanged: (v) => _intervalDays = int.tryParse(v),
            validator: (v) => _validatePositiveInterval(l10n, v),
          ),
          // No separate anchor here (same as RecurrenceType.none) — "every
          // N days" just counts elapsed days from _startDate regardless of
          // calendar system, so lunar mode only changes which picker backs
          // the Start date field below, not the interval math itself.
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.brightness_2_outlined),
            title: Text(l10n.reminderFieldLunarToggle),
            value: _isLunar,
            onChanged: (v) => setState(() => _isLunar = v),
          ),
        ];
      case RecurrenceType.lunarYearly:
      case RecurrenceType.lunarMonthly:
        // Unreachable via the UI: the Repeat dropdown never offers these
        // values directly (see its `items` filter above) — they're
        // represented as RecurrenceType.yearly/monthly + _isLunar instead,
        // so these cases only exist to keep the switch exhaustive over the
        // enum.
        return const [];
    }
  }
}
