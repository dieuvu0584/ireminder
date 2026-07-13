import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/lunar_converter.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/enums/recurrence_type.dart';
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
      if (type == RecurrenceType.lunarYearly) {
        _recurrenceType = RecurrenceType.yearly;
        _isLunar = true;
      } else {
        _recurrenceType = type;
      }
      _recurrenceDay = r.recurrenceDay;
      _recurrenceMonth = r.recurrenceMonth;
      _recurrenceWeekday = r.recurrenceWeekday;
      _intervalDays = r.recurrenceInterval;
      _advanceNoticeDays = r.advanceNoticeDays;
      _advanceNoticeHours = r.advanceNoticeHours;
      _advanceNoticeMinutes = r.advanceNoticeMinutes;
      final parts = r.reminderTime.split(':');
      _time = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  String get _timeString =>
      '${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')}';

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_categoryId == null) return;
    setState(() => _saving = true);
    final actions = ref.read(reminderActionsProvider);
    final effectiveType = _recurrenceType == RecurrenceType.yearly && _isLunar
        ? RecurrenceType.lunarYearly
        : _recurrenceType;
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
          isLunar: effectiveType == RecurrenceType.lunarYearly,
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
            isLunar: effectiveType == RecurrenceType.lunarYearly,
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
              DropdownButtonFormField<RecurrenceType>(
                initialValue: _recurrenceType,
                decoration: InputDecoration(
                  labelText: l10n.reminderFieldRecurrence,
                ),
                items: RecurrenceType.values
                    .where((t) => t != RecurrenceType.lunarYearly)
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(_recurrenceLabel(l10n, t)),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() {
                  _recurrenceType = v!;
                  if (_recurrenceType != RecurrenceType.yearly) {
                    _isLunar = false;
                  }
                }),
              ),
              const SizedBox(height: 12),
              ..._buildRecurrenceFields(l10n),
              const SizedBox(height: 12),
              // The lunar date picker (built into _buildRecurrenceFields'
              // yearly case above) already sets both the lunar day/month
              // anchor *and* _startDate from the same pick — showing this
              // solar start-date field too would be redundant and let the
              // two disagree, so it's hidden while lunar is on.
              if (!_isLunar)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.reminderFieldStartDate),
                  subtitle: Text(
                    '${_startDate.year}-${_startDate.month.toString().padLeft(2, '0')}-${_startDate.day.toString().padLeft(2, '0')}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    // New reminders can't be backdated (see initState); an
                    // existing reminder's start date may already anchor a
                    // legitimately past day (e.g. a yearly reminder created
                    // years ago), so editing keeps the wider range to avoid
                    // an assertion failure if _startDate itself predates
                    // today, without inviting a *new* past date to be picked.
                    final now = DateTime.now();
                    final today = DateTime(now.year, now.month, now.day);
                    final firstDate = widget.existing == null
                        ? today
                        : (_startDate.isBefore(today) ? _startDate : today);
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: firstDate,
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) setState(() => _startDate = picked);
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

  String? _validateDayOfMonth(AppLocalizations l10n, String? v) {
    final n = int.tryParse(v ?? '');
    if (n == null || n < 1 || n > 31) return l10n.validationDayOfMonth;
    return null;
  }

  String? _validateMonth(AppLocalizations l10n, String? v) {
    final n = int.tryParse(v ?? '');
    if (n == null || n < 1 || n > 12) return l10n.validationMonth;
    return null;
  }

  String? _validatePositiveInterval(AppLocalizations l10n, String? v) {
    final n = int.tryParse(v ?? '');
    if (n == null || n < 1) return l10n.validationPositiveInteger;
    return null;
  }

  List<Widget> _buildRecurrenceFields(AppLocalizations l10n) {
    switch (_recurrenceType) {
      case RecurrenceType.none:
      case RecurrenceType.daily:
        return const [];
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
        return [
          TextFormField(
            initialValue: _recurrenceDay?.toString() ?? '',
            decoration: InputDecoration(
              labelText: l10n.reminderFieldRecurrenceDay,
            ),
            keyboardType: TextInputType.number,
            onChanged: (v) => _recurrenceDay = int.tryParse(v),
            validator: (v) => _validateDayOfMonth(l10n, v),
          ),
        ];
      case RecurrenceType.yearly:
        return [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.brightness_2_outlined),
            title: Text(l10n.reminderFieldLunarToggle),
            value: _isLunar,
            onChanged: (v) => setState(() {
              _isLunar = v;
              // Most people don't know offhand what lunar day/month a given
              // date falls on — default to today's so the picker below
              // always opens on a valid value instead of forcing a manual
              // lookup before it can be used at all.
              if (v && _recurrenceDay == null && _recurrenceMonth == null) {
                final today = LunarConverter.solarToLunar(DateTime.now());
                _recurrenceDay = today.day;
                _recurrenceMonth = today.month;
              }
            }),
          ),
          if (_isLunar)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.reminderFieldLunarDay),
              subtitle: Text(
                l10n.reminderLunarDateLabel(
                  '$_recurrenceDay/$_recurrenceMonth',
                ),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                // Seed the picker at this lunar day/month's nearest solar
                // equivalent so it opens already showing roughly the right
                // spot, rather than always jumping back to today's month.
                final approxSolar = LunarConverter.lunarToSolar(
                  DateTime.now().year,
                  _recurrenceMonth!,
                  _recurrenceDay!,
                );
                final picked = await showLunarDatePicker(
                  context: context,
                  initialDate: approxSolar,
                );
                if (picked != null) {
                  final lunar = LunarConverter.solarToLunar(picked);
                  setState(() {
                    _recurrenceDay = lunar.day;
                    _recurrenceMonth = lunar.month;
                    // The solar start-date field is hidden while lunar is
                    // on (see above) but still backs the actual DB row —
                    // keep it in sync with whatever solar date the lunar
                    // day/month anchor was just picked from.
                    _startDate = picked;
                  });
                }
              },
            )
          else
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: _recurrenceDay?.toString() ?? '',
                    decoration: InputDecoration(
                      labelText: l10n.reminderFieldRecurrenceDay,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (v) => _recurrenceDay = int.tryParse(v),
                    validator: (v) => _validateDayOfMonth(l10n, v),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    initialValue: _recurrenceMonth?.toString() ?? '',
                    decoration: InputDecoration(
                      labelText: l10n.reminderFieldRecurrenceMonth,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (v) => _recurrenceMonth = int.tryParse(v),
                    validator: (v) => _validateMonth(l10n, v),
                  ),
                ),
              ],
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
        ];
      case RecurrenceType.lunarYearly:
        // Unreachable via the UI: the Repeat dropdown never offers this
        // value directly (see its `items` filter above) — lunar yearly is
        // represented as RecurrenceType.yearly + _isLunar instead, so this
        // case only exists to keep the switch exhaustive over the enum.
        return const [];
    }
  }
}
