import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../domain/enums/loan_frequency.dart';
import '../../providers/category_providers.dart';
import '../../providers/loan_providers.dart';

class LoanFormScreen extends ConsumerStatefulWidget {
  const LoanFormScreen({super.key});

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
  DateTime _startDate = DateTime.now();
  bool _saving = false;

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
      await ref.read(loanActionsProvider).create(
            name: _nameCtrl.text.trim(),
            categoryId: _categoryId,
            totalAmount: double.tryParse(_totalAmountCtrl.text),
            installmentAmount: double.parse(_installmentAmountCtrl.text),
            totalInstallments: int.parse(_totalInstallmentsCtrl.text),
            frequency: _frequency,
            dueDayOfMonth: _frequency == LoanFrequency.monthly
                ? int.tryParse(_dueDayCtrl.text)
                : null,
            startDate: _startDate,
            reminderAdvanceDays:
                int.tryParse(_reminderAdvanceCtrl.text) ?? 3,
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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loanFormTitleNew),
        actions: [
          TextButton(
            onPressed: _saving ? null : _submit,
            child: Text(l10n.actionSave),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: InputDecoration(labelText: l10n.loanFieldName),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? '' : null,
            ),
            const SizedBox(height: 12),
            categoriesAsync.when(
              data: (categories) => DropdownButtonFormField<int>(
                initialValue: _categoryId,
                decoration:
                    InputDecoration(labelText: l10n.loanFieldCategory),
                items: categories
                    .map((c) =>
                        DropdownMenuItem(value: c.id, child: Text(c.name)))
                    .toList(),
                onChanged: (v) => setState(() => _categoryId = v),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _totalAmountCtrl,
              decoration:
                  InputDecoration(labelText: l10n.loanFieldTotalAmount),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _installmentAmountCtrl,
              decoration: InputDecoration(
                  labelText: l10n.loanFieldInstallmentAmount),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (v) =>
                  (double.tryParse(v ?? '') == null) ? '' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _totalInstallmentsCtrl,
              decoration: InputDecoration(
                  labelText: l10n.loanFieldTotalInstallments),
              keyboardType: TextInputType.number,
              validator: (v) => (int.tryParse(v ?? '') == null) ? '' : null,
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
              ],
              onChanged: (v) => setState(() => _frequency = v!),
            ),
            if (_frequency == LoanFrequency.monthly) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _dueDayCtrl,
                decoration:
                    InputDecoration(labelText: l10n.loanFieldDueDayOfMonth),
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.loanFieldStartDate),
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
            const SizedBox(height: 12),
            TextFormField(
              controller: _reminderAdvanceCtrl,
              decoration: InputDecoration(
                  labelText: l10n.loanFieldReminderAdvanceDays),
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
    );
  }
}
