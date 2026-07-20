import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/lunar_converter.dart';
import '../../../domain/enums/loan_frequency.dart';
import '../../providers/category_providers.dart';
import '../../providers/loan_providers.dart';
import '../../widgets/currency_input_formatter.dart';
import '../../widgets/lunar_date_picker.dart';
import '../../widgets/save_action_button.dart';

/// Every frequency generateInstallments() steps forward by whole months
/// for (as opposed to weekly/biweekly's flat day counts) — these are the
/// ones a fixed "due day of month" actually applies to.
bool _isMonthBasedFrequency(LoanFrequency frequency) => switch (frequency) {
  LoanFrequency.monthly ||
  LoanFrequency.quarterly ||
  LoanFrequency.semiAnnually ||
  LoanFrequency.yearly => true,
  LoanFrequency.weekly || LoanFrequency.biweekly => false,
};

class LoanFormScreen extends ConsumerStatefulWidget {
  /// Prefills the Start date field — e.g. the day currently selected on
  /// the Calendar tab, so creating a loan while browsing a specific day
  /// there starts from that day instead of always defaulting to today.
  /// Null (or a past day) falls back to today.
  final DateTime? initialStartDate;

  const LoanFormScreen({super.key, this.initialStartDate});

  @override
  ConsumerState<LoanFormScreen> createState() => _LoanFormScreenState();
}

class _LoanFormScreenState extends ConsumerState<LoanFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _totalAmountCtrl = TextEditingController();
  final _installmentAmountCtrl = TextEditingController();
  final _totalInstallmentsCtrl = TextEditingController();
  final _dueDayCtrl = TextEditingController();
  final _reminderAdvanceCtrl = TextEditingController(text: '3');
  final _notesCtrl = TextEditingController();

  int? _categoryId;
  LoanFrequency _frequency = LoanFrequency.monthly;
  late DateTime _startDate;
  // Purely a picker-UI convenience, unlike reminders' lunar mode — a loan
  // has no recurring lunar-day concept to anchor, so this only decides
  // which picker the Start date field opens (with lunar day labels or
  // without); the stored startDate is the same plain solar date either
  // way.
  bool _isLunar = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final requested = widget.initialStartDate ?? today;
    _startDate = requested.isBefore(today) ? today : requested;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _totalAmountCtrl.dispose();
    _installmentAmountCtrl.dispose();
    _totalInstallmentsCtrl.dispose();
    _dueDayCtrl.dispose();
    _reminderAdvanceCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      await ref
          .read(loanActionsProvider)
          .create(
            name: _nameCtrl.text.trim(),
            categoryId: _categoryId,
            totalAmount: double.tryParse(unformatAmount(_totalAmountCtrl.text)),
            installmentAmount: double.parse(
              unformatAmount(_installmentAmountCtrl.text),
            ),
            totalInstallments: int.parse(_totalInstallmentsCtrl.text),
            frequency: _frequency,
            dueDayOfMonth: _isMonthBasedFrequency(_frequency)
                ? int.tryParse(_dueDayCtrl.text)
                : null,
            startDate: _startDate,
            reminderAdvanceDays: int.tryParse(_reminderAdvanceCtrl.text) ?? 3,
            notes: _notesCtrl.text.trim().isEmpty
                ? null
                : _notesCtrl.text.trim(),
          );
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final locale = Localizations.localeOf(context).toString();
    final currencySymbol = currencySymbolFor(locale);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loanFormTitleNew),
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
                controller: _nameCtrl,
                decoration: InputDecoration(labelText: l10n.loanFieldName),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? l10n.validationRequired
                    : null,
              ),
              const SizedBox(height: 12),
              categoriesAsync.when(
                data: (categories) => DropdownButtonFormField<int>(
                  initialValue: _categoryId,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: l10n.loanFieldCategory,
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
                ),
                loading: () => const LinearProgressIndicator(),
                error: (e, st) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _totalAmountCtrl,
                decoration: InputDecoration(
                  labelText: l10n.loanFieldTotalAmount,
                  suffixText: currencySymbol,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [ThousandsSeparatorInputFormatter(locale)],
                validator: (v) {
                  final digits = unformatAmount(v ?? '');
                  if (digits.isEmpty) return null;
                  final n = double.tryParse(digits);
                  return (n == null || n <= 0)
                      ? l10n.validationPositiveNumber
                      : null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _installmentAmountCtrl,
                decoration: InputDecoration(
                  labelText: l10n.loanFieldInstallmentAmount,
                  suffixText: currencySymbol,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [ThousandsSeparatorInputFormatter(locale)],
                validator: (v) {
                  final n = double.tryParse(unformatAmount(v ?? ''));
                  return (n == null || n <= 0)
                      ? l10n.validationPositiveNumber
                      : null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _totalInstallmentsCtrl,
                decoration: InputDecoration(
                  labelText: l10n.loanFieldTotalInstallments,
                ),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final n = int.tryParse(v ?? '');
                  return (n == null || n <= 0)
                      ? l10n.validationPositiveInteger
                      : null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<LoanFrequency>(
                initialValue: _frequency,
                decoration: InputDecoration(labelText: l10n.loanFieldFrequency),
                items: [
                  DropdownMenuItem(
                    value: LoanFrequency.monthly,
                    child: Text(l10n.loanFrequencyMonthly),
                  ),
                  DropdownMenuItem(
                    value: LoanFrequency.weekly,
                    child: Text(l10n.loanFrequencyWeekly),
                  ),
                  DropdownMenuItem(
                    value: LoanFrequency.biweekly,
                    child: Text(l10n.loanFrequencyBiweekly),
                  ),
                  DropdownMenuItem(
                    value: LoanFrequency.quarterly,
                    child: Text(l10n.loanFrequencyQuarterly),
                  ),
                  DropdownMenuItem(
                    value: LoanFrequency.semiAnnually,
                    child: Text(l10n.loanFrequencySemiAnnually),
                  ),
                  DropdownMenuItem(
                    value: LoanFrequency.yearly,
                    child: Text(l10n.loanFrequencyYearly),
                  ),
                ],
                onChanged: (v) => setState(() => _frequency = v!),
              ),
              if (_isMonthBasedFrequency(_frequency)) ...[
                const SizedBox(height: 12),
                TextFormField(
                  controller: _dueDayCtrl,
                  decoration: InputDecoration(
                    labelText: l10n.loanFieldDueDayOfMonth,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return null;
                    final n = int.tryParse(v);
                    return (n == null || n < 1 || n > 31)
                        ? l10n.validationDayOfMonth
                        : null;
                  },
                ),
              ],
              const SizedBox(height: 12),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                secondary: const Icon(Icons.brightness_2_outlined),
                title: Text(l10n.reminderFieldLunarToggle),
                value: _isLunar,
                onChanged: (v) => setState(() => _isLunar = v),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.loanFieldStartDate),
                subtitle: Text(
                  _isLunar
                      ? l10n.reminderLunarDateLabel(
                          LunarConverter.formatDayMonth(_startDate),
                        )
                      : '${_startDate.year}-${_startDate.month.toString().padLeft(2, '0')}-${_startDate.day.toString().padLeft(2, '0')}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  // No edit flow for loans (this screen is create-only), so
                  // unlike the reminder form there's no existing-date
                  // exception to account for — always today at the low
                  // end. Same Dec 31 of next year cap as reminders.
                  final now = DateTime.now();
                  final today = DateTime(now.year, now.month, now.day);
                  final lastDate = DateTime(now.year + 1, 12, 31);
                  if (_isLunar) {
                    final picked = await showLunarDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: today,
                      lastDate: lastDate,
                    );
                    if (picked != null) setState(() => _startDate = picked);
                    return;
                  }
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: today,
                    lastDate: lastDate,
                  );
                  if (picked != null) setState(() => _startDate = picked);
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _reminderAdvanceCtrl,
                decoration: InputDecoration(
                  labelText: l10n.loanFieldReminderAdvanceDays,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notesCtrl,
                decoration: InputDecoration(labelText: l10n.loanFieldNotes),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
