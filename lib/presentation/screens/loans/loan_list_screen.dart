import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../providers/loan_providers.dart';
import '../../widgets/loan_progress_card.dart';
import 'loan_detail_screen.dart';
import 'loan_form_screen.dart';

class LoanListScreen extends ConsumerWidget {
  const LoanListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final loansAsync = ref.watch(activeLoansStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.loanListTitle)),
      body: loansAsync.when(
        data: (loans) {
          if (loans.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.payments_outlined, size: 48),
                  const SizedBox(height: 12),
                  Text(l10n.homeEmptyBody, textAlign: TextAlign.center),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 88),
            itemCount: loans.length,
            itemBuilder: (context, index) {
              final loan = loans[index];
              return LoanProgressCard(
                loan: loan,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LoanDetailScreen(loan: loan),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const LoanFormScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
