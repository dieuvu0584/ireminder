import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';
import '../../domain/enums/loan_frequency.dart';
import 'notification_providers.dart';
import 'repository_providers.dart';

final loanInstallmentsStreamProvider =
    StreamProvider.family<List<LoanInstallment>, int>((ref, loanId) {
      return ref.watch(loanRepositoryProvider).watchInstallments(loanId);
    });

/// Every pending or overdue installment across every active loan, joined
/// with its loan — feeds the Calendar/Task List tabs so installment due
/// dates show up alongside reminders.
final unpaidInstallmentsWithLoanStreamProvider =
    StreamProvider<List<(LoanInstallment, Loan)>>((ref) {
      return ref
          .watch(loanRepositoryProvider)
          .watchUnpaidInstallmentsWithLoan();
    });

final loanActionsProvider = Provider<LoanActions>((ref) {
  return LoanActions(ref);
});

class LoanActions {
  final Ref _ref;
  LoanActions(this._ref);

  Future<int> create({
    required String name,
    int? categoryId,
    double? totalAmount,
    required double installmentAmount,
    required int totalInstallments,
    required LoanFrequency frequency,
    int? dueDayOfMonth,
    required DateTime startDate,
    int reminderAdvanceDays = 3,
    String? reminderTime,
    String? notes,
  }) async {
    final loanId = await _ref
        .read(loanRepositoryProvider)
        .create(
          name: name,
          categoryId: categoryId,
          totalAmount: totalAmount,
          installmentAmount: installmentAmount,
          totalInstallments: totalInstallments,
          frequency: frequency,
          dueDayOfMonth: dueDayOfMonth,
          startDate: startDate,
          reminderAdvanceDays: reminderAdvanceDays,
          reminderTime: reminderTime,
          notes: notes,
        );
    await _scheduleAllForLoan(loanId);
    return loanId;
  }

  Future<void> markPaid({
    required int loanId,
    required List<int> installmentIds,
    required DateTime paidDate,
  }) async {
    await _ref
        .read(loanRepositoryProvider)
        .markPaid(
          loanId: loanId,
          installmentIds: installmentIds,
          paidDate: paidDate,
        );
    final scheduler = _ref.read(alarmSchedulerServiceProvider);
    for (final id in installmentIds) {
      await scheduler.cancelForInstallment(id);
    }
  }

  Future<void> markUnpaid({
    required int loanId,
    required int installmentId,
  }) async {
    await _ref
        .read(loanRepositoryProvider)
        .markUnpaid(loanId: loanId, installmentId: installmentId);
    // markPaid cancelled this installment's notification, so undoing it
    // needs to restore that alarm — mirrors _scheduleAllForLoan, just for
    // the one installment instead of every one on the loan.
    final loan = await _ref.read(loanRepositoryProvider).getById(loanId);
    final installment = await _ref
        .read(loanRepositoryProvider)
        .getInstallmentById(installmentId);
    if (loan == null || installment == null) return;
    final settings = await _ref.read(settingsRepositoryProvider).get();
    await _ref
        .read(alarmSchedulerServiceProvider)
        .scheduleForInstallment(
          installment,
          loan,
          settings.defaultReminderTime,
        );
  }

  Future<void> delete(int loanId) async {
    final installments = await _ref
        .read(loanRepositoryProvider)
        .watchInstallments(loanId)
        .first;
    final scheduler = _ref.read(alarmSchedulerServiceProvider);
    for (final installment in installments) {
      await scheduler.cancelForInstallment(installment.id);
    }
    await _ref.read(loanRepositoryProvider).delete(loanId);
  }

  Future<void> _scheduleAllForLoan(int loanId) async {
    final loan = await _ref.read(loanRepositoryProvider).getById(loanId);
    if (loan == null) return;
    final settings = await _ref.read(settingsRepositoryProvider).get();
    final installments = await _ref
        .read(loanRepositoryProvider)
        .watchInstallments(loanId)
        .first;
    final scheduler = _ref.read(alarmSchedulerServiceProvider);
    for (final installment in installments) {
      await scheduler.scheduleForInstallment(
        installment,
        loan,
        settings.defaultReminderTime,
      );
    }
  }
}
