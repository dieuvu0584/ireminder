import 'package:flutter/material.dart';

import '../../core/localization/gen/app_localizations.dart';
import '../../core/utils/date_formatter.dart';
import '../../data/database/app_database.dart';
import 'color_picker.dart';
import 'icon_catalog.dart';

/// Same card look as [ReminderCard] (lib/presentation/widgets/
/// reminder_card.dart) so a loan installment due on a given day reads as
/// just another entry in the Calendar/Task List tabs rather than a
/// visually distinct "other kind of thing" — a payment coming due is
/// something to be reminded about on a date too. Simpler than
/// ReminderCard though: only ever shown pending (paid installments drop
/// out of the query backing these tabs entirely), so there's no
/// completed/historical/lunar state to render, and no snooze action.
class InstallmentCard extends StatelessWidget {
  final LoanInstallment installment;
  final Loan loan;
  final Category? category;
  final bool isOverdue;
  final VoidCallback onTap;
  final VoidCallback onMarkPaid;

  const InstallmentCard({
    super.key,
    required this.installment,
    required this.loan,
    required this.category,
    required this.isOverdue,
    required this.onTap,
    required this.onMarkPaid,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final color = category != null
        ? parseHexColor(category!.color)
        : Colors.grey;

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
          '${isOverdue ? ' · ${l10n.loanStatusOverdue}' : ''}',
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.check_circle_outline,
            color: isOverdue
                ? Theme.of(context).colorScheme.error
                : Colors.orange,
          ),
          onPressed: onMarkPaid,
        ),
      ),
    );
  }
}
