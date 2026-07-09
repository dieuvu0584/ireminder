import 'package:flutter/material.dart';

import '../../core/localization/gen/app_localizations.dart';
import '../../data/database/app_database.dart';

class LoanProgressCard extends StatelessWidget {
  final Loan loan;
  final VoidCallback onTap;

  const LoanProgressCard({super.key, required this.loan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final progress = loan.totalInstallments == 0
        ? 0.0
        : loan.paidInstallments / loan.totalInstallments;

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(loan.name, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress.clamp(0, 1),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.loanProgress(loan.paidInstallments, loan.totalInstallments),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
