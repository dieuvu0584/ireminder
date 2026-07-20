import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../data/database/app_database.dart';
import '../../providers/loan_providers.dart';

class LoanDetailScreen extends ConsumerWidget {
  final Loan loan;

  const LoanDetailScreen({super.key, required this.loan});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final installmentsAsync = ref.watch(
      loanInstallmentsStreamProvider(loan.id),
    );
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    return Scaffold(
      appBar: AppBar(
        title: Text(loan.name, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(l10n.loanDeleteConfirmTitle),
                  content: Text(
                    l10n.loanDeleteConfirmBody(loan.totalInstallments),
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
                await ref.read(loanActionsProvider).delete(loan.id);
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
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: installments.length,
              itemBuilder: (context, index) {
                final installment = installments[index];
                final isOverdue =
                    installment.status == 'pending' &&
                    installment.dueDate.isBefore(todayOnly);
                final isPaid = installment.status == 'paid';
                return CheckboxListTile(
                  // Ticking the box marks it paid immediately — no
                  // separate confirm step. A staged "select several, then
                  // confirm" flow here made the checkbox itself look like
                  // it didn't do anything, since nothing was actually
                  // saved until a second tap on a FAB that only appeared
                  // once something was selected.
                  value: isPaid,
                  onChanged: isPaid
                      ? null
                      : (checked) async {
                          if (checked != true) return;
                          final messenger = ScaffoldMessenger.of(context);
                          try {
                            await ref
                                .read(loanActionsProvider)
                                .markPaid(
                                  loanId: loan.id,
                                  installmentIds: [installment.id],
                                  paidDate: DateTime.now(),
                                );
                            messenger.showSnackBar(
                              SnackBar(content: Text(l10n.loanMarkPaidSuccess)),
                            );
                          } catch (_) {
                            messenger.showSnackBar(
                              SnackBar(content: Text(l10n.errorGeneric)),
                            );
                          }
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
    );
  }
}
