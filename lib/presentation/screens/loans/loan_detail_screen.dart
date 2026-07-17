import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../data/database/app_database.dart';
import '../../providers/loan_providers.dart';

class LoanDetailScreen extends ConsumerStatefulWidget {
  final Loan loan;

  const LoanDetailScreen({super.key, required this.loan});

  @override
  ConsumerState<LoanDetailScreen> createState() => _LoanDetailScreenState();
}

class _LoanDetailScreenState extends ConsumerState<LoanDetailScreen> {
  final Set<int> _selected = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final installmentsAsync = ref.watch(
      loanInstallmentsStreamProvider(widget.loan.id),
    );
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.loan.name, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(l10n.loanDeleteConfirmTitle),
                  content: Text(
                    l10n.loanDeleteConfirmBody(widget.loan.totalInstallments),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: Text(l10n.actionCancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: Text(l10n.actionDelete),
                    ),
                  ],
                ),
              );
              if (confirmed == true) {
                await ref.read(loanActionsProvider).delete(widget.loan.id);
                if (context.mounted) Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: installmentsAsync.when(
          data: (installments) {
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 88),
              itemCount: installments.length,
              itemBuilder: (context, index) {
                final installment = installments[index];
                final isOverdue =
                    installment.status == 'pending' &&
                    installment.dueDate.isBefore(todayOnly);
                final isPaid = installment.status == 'paid';
                return CheckboxListTile(
                  // A paid installment's box must show checked+green on its
                  // own — _selected is only ever a staging set for the
                  // batch-pay action below and never holds a paid id (it's
                  // cleared right after markPaid succeeds).
                  value: isPaid || _selected.contains(installment.id),
                  onChanged: isPaid
                      ? null
                      : (checked) {
                          setState(() {
                            if (checked == true) {
                              _selected.add(installment.id);
                            } else {
                              _selected.remove(installment.id);
                            }
                          });
                        },
                  // Checkbox.fillColor/checkColor aren't state-dimmed the
                  // way the surrounding disabled ListTile text is, so a
                  // paid (disabled) box still renders fully green+checked
                  // instead of Flutter's default grayed-out disabled look.
                  fillColor: isPaid
                      ? WidgetStateProperty.all(Colors.green)
                      : null,
                  checkColor: isPaid ? Colors.white : null,
                  title: Text(
                    l10n.loanInstallmentNumber(installment.installmentNumber),
                  ),
                  subtitle: Text(
                    '${DateFormatter.formatDate(installment.dueDate, locale)} · '
                    '${DateFormatter.formatCurrency(installment.amount, locale)}',
                  ),
                  secondary: Chip(
                    label: Text(
                      isPaid
                          ? l10n.loanStatusPaid
                          : isOverdue
                          ? l10n.loanStatusOverdue
                          : l10n.loanStatusPending,
                    ),
                    backgroundColor: isPaid
                        ? Colors.green.withValues(alpha: 0.15)
                        : isOverdue
                        ? Colors.red.withValues(alpha: 0.15)
                        : null,
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
        ),
      ),
      floatingActionButton: _selected.isEmpty
          ? null
          : FloatingActionButton.extended(
              icon: const Icon(Icons.check),
              label: Text(l10n.loanMarkPaidBatch(_selected.length)),
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                try {
                  await ref
                      .read(loanActionsProvider)
                      .markPaid(
                        loanId: widget.loan.id,
                        installmentIds: _selected.toList(),
                        paidDate: DateTime.now(),
                      );
                  if (mounted) {
                    setState(_selected.clear);
                    // Explicit success feedback — checking a box only
                    // stages a selection, and without this the only sign
                    // the tap actually committed anything is the status
                    // chip quietly changing color a moment later.
                    messenger.showSnackBar(
                      SnackBar(content: Text(l10n.loanMarkPaidSuccess)),
                    );
                  }
                } catch (_) {
                  if (mounted) {
                    messenger.showSnackBar(
                      SnackBar(content: Text(l10n.errorGeneric)),
                    );
                  }
                }
              },
            ),
    );
  }
}
