import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/enums/recurrence_type.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../widgets/save_action_button.dart';

class ReminderFormScreen extends ConsumerStatefulWidget {
  final Reminder? existing;
  final int? initialCategoryId;

  const ReminderFormScreen({super.key, this.existing, this.initialCategoryId});

  @override
  ConsumerState<ReminderFormScreen> createState() => _ReminderFormScreenState();
}

class _ReminderFormScreenState extends ConsumerState<ReminderFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;

  int? _categoryId;
  RecurrenceType _recurrenceType = RecurrenceType.none;
  int? _recurrenceDay;
  int? _recurrenceMonth;
  int? _recurrenceWeekday;
  int? _intervalDays;
  DateTime _startDate = DateTime.now();
  TimeOfDay _time = const TimeOfDay(hour: 9, minute: 0);
  int _advanceNoticeDays = 0;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final r = widget.existing;
    _titleCtrl = TextEditingController(text: r?.title ?? '');
    _descCtrl = TextEditingController(text: r?.description ?? '');
    _categoryId = r?.categoryId ?? widget.initialCategoryId;
    if (r != null) {
      _recurrenceType = RecurrenceType.fromDbValue(r.recurrenceType);
      _recurrenceDay = r.recurrenceDay;
      _recurrenceMonth = r.recurrenceMonth;
      _recurrenceWeekday = r.recurrenceWeekday;
      _intervalDays = r.recurrenceInterval;
      _startDate = r.startDate;
      _advanceNoticeDays = r.advanceNoticeDays;
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
    try {
      if (widget.existing == null) {
        await actions.create(
          title: _titleCtrl.text.trim(),
          description: _descCtrl.text.trim().isEmpty
              ? null
              : _descCtrl.text.trim(),
          categoryId: _categoryId!,
          recurrenceType: _recurrenceType,
          recurrenceInterval: _intervalDays,
          recurrenceDay: _recurrenceDay,
          recurrenceMonth: _recurrenceMonth,
          recurrenceWeekday: _recurrenceWeekday,
          isLunar: _recurrenceType == RecurrenceType.lunarYearly,
          startDate: _startDate,
          reminderTime: _timeString,
          advanceNoticeDays: _advanceNoticeDays,
        );
      } else {
        await actions.update(
          widget.existing!.copyWith(
            title: _titleCtrl.text.trim(),
            description: drift.Value(
              _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
            ),
            categoryId: _categoryId!,
            recurrenceType: _recurrenceType.dbValue,
            recurrenceInterval: drift.Value(_intervalDays),
            recurrenceDay: drift.Value(_recurrenceDay),
            recurrenceMonth: drift.Value(_recurrenceMonth),
            recurrenceWeekday: drift.Value(_recurrenceWeekday),
            isLunar: _recurrenceType == RecurrenceType.lunarYearly,
            startDate: _startDate,
            reminderTime: _timeString,
            advanceNoticeDays: _advanceNoticeDays,
          ),
        );
      }
      if (mounted) Navigator.of(context).pop();
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
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(_recurrenceLabel(l10n, t)),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _recurrenceType = v!),
              ),
              const SizedBox(height: 12),
              ..._buildRecurrenceFields(l10n),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.reminderFieldStartDate),
                subtitle: Text(
                  '${_startDate.year}-${_startDate.month.toString().padLeft(2, '0')}-${_startDate.day.toString().padLeft(2, '0')}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime(2000),
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
              TextFormField(
                initialValue: _advanceNoticeDays.toString(),
                decoration: InputDecoration(
                  labelText: l10n.reminderFieldAdvanceNotice,
                ),
                keyboardType: TextInputType.number,
                onChanged: (v) => _advanceNoticeDays = int.tryParse(v) ?? 0,
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
        return [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: _recurrenceDay?.toString() ?? '',
                  decoration: InputDecoration(
                    labelText: l10n.reminderFieldLunarDay,
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
                    labelText: l10n.reminderFieldLunarMonth,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => _recurrenceMonth = int.tryParse(v),
                  validator: (v) => _validateMonth(l10n, v),
                ),
              ),
            ],
          ),
        ];
    }
  }
}
