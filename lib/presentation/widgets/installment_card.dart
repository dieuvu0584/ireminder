import 'package:flutter/material.dart';

import '../../core/localization/gen/app_localizations.dart';
import '../../core/utils/date_formatter.dart';
import '../../data/database/app_database.dart';
import '../../domain/enums/loan_frequency.dart';
import 'color_picker.dart';
import 'icon_catalog.dart';

/// Same card look as [ReminderCard] (lib/presentation/widgets/
/// reminder_card.dart), same 3-state scheme too: orange while still
/// pending and actionable, green once paid, gray+locked once auto-marked
/// overdue (see LoanRepository.autoMarkOverdueInstallments) — a payment
/// coming due is "something to be reminded about on a date" just like a
/// reminder, so it gets the same visual language everywhere it shows up.
class InstallmentCard extends StatelessWidget {
  final LoanInstallment installment;
  final Loan loan;
  final Category? category;
  final VoidCallback onTap;
  final VoidCallback onMarkPaid;

  const InstallmentCard({
    super.key,
    required this.installment,
    required this.loan,
    required this.category,
    required this.onTap,
    required this.onMarkPaid,
  });

  bool get _isPaid => installment.status == InstallmentStatus.paid.dbValue;
  bool get _isOverdue =>
      installment.status == InstallmentStatus.overdue.dbValue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final color = category != null
        ? parseHexColor(category!.color)
        : Colors.grey;
    // Once overdue, a missed installment locks the same way an
    // auto-skipped reminder does — there's no "next cycle" to catch up
    // on later the way a recurring reminder gets, but it's still the
    // same "this window has closed" signal.
    final locked = _isPaid || _isOverdue;

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(
            category != null
                ? resolveCategoryIcon(category!.icon)
                : Icons.payments,
            color: color,
          ),
        ),
        title: Text(loan.name, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          '${l10n.loanInstallmentNumber(installment.installmentNumber)} · '
          '${DateFormatter.formatCurrency(installment.amount, locale)}'
          '${_isPaid
              ? ' · ${l10n.loanStatusPaid}'
              : _isOverdue
              ? ' · ${l10n.loanStatusOverdue}'
              : ''}',
        ),
        trailing: IconButton(
          icon: Icon(
            locked ? Icons.check_circle : Icons.check_circle_outline,
            color: _isPaid
                ? Colors.green
                : _isOverdue
                ? Theme.of(context).colorScheme.outline
                : Colors.orange,
          ),
          onPressed: locked ? null : onMarkPaid,
        ),
      ),
    );
  }
}
