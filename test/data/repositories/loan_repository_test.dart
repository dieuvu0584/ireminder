import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/data/database/app_database.dart';
import 'package:ireminder/data/repositories/loan_repository.dart';
import 'package:ireminder/domain/enums/loan_frequency.dart';

void main() {
  late AppDatabase db;
  late LoanRepository loans;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    loans = LoanRepository(db);
  });

  tearDown(() => db.close());

  test('create() generates all installments up front', () async {
    final loanId = await loans.create(
      name: 'Motorcycle loan',
      installmentAmount: 800000,
      totalInstallments: 12,
      frequency: LoanFrequency.monthly,
      startDate: DateTime(2026, 1, 10),
    );

    final installments = await loans.watchInstallments(loanId).first;
    expect(installments, hasLength(12));
    final loan = await loans.getById(loanId);
    expect(loan!.endDate, installments.last.dueDate);
  });

  test(
    'markPaid updates paid_installments and deactivates loan when done',
    () async {
      final loanId = await loans.create(
        name: 'Small loan',
        installmentAmount: 100,
        totalInstallments: 2,
        frequency: LoanFrequency.weekly,
        startDate: DateTime(2026, 1, 1),
      );
      final installments = await loans.watchInstallments(loanId).first;

      await loans.markPaid(
        loanId: loanId,
        installmentIds: [installments[0].id],
        paidDate: DateTime(2026, 1, 1),
      );
      var loan = await loans.getById(loanId);
      expect(loan!.paidInstallments, 1);
      expect(loan.isActive, isTrue);

      await loans.markPaid(
        loanId: loanId,
        installmentIds: [installments[1].id],
        paidDate: DateTime(2026, 1, 8),
      );
      loan = await loans.getById(loanId);
      expect(loan!.paidInstallments, 2);
      expect(loan.isActive, isFalse);
    },
  );

  test('markUnpaid reverts a paid installment back to pending and undoes the '
      'loan-level paid count / reactivation', () async {
    final loanId = await loans.create(
      name: 'Undo loan',
      installmentAmount: 100,
      totalInstallments: 2,
      frequency: LoanFrequency.weekly,
      startDate: DateTime(2026, 1, 1),
    );
    final installments = await loans.watchInstallments(loanId).first;

    await loans.markPaid(
      loanId: loanId,
      installmentIds: [installments[0].id, installments[1].id],
      paidDate: DateTime(2026, 1, 1),
    );
    var loan = await loans.getById(loanId);
    expect(loan!.paidInstallments, 2);
    expect(loan.isActive, isFalse);

    await loans.markUnpaid(loanId: loanId, installmentId: installments[1].id);
    loan = await loans.getById(loanId);
    expect(loan!.paidInstallments, 1);
    expect(loan.isActive, isTrue);

    final reverted = (await loans.watchInstallments(loanId).first).firstWhere(
      (i) => i.id == installments[1].id,
    );
    expect(reverted.status, InstallmentStatus.pending.dbValue);
    expect(reverted.paidDate, isNull);
    expect(reverted.paidAmount, isNull);
  });

  test(
    'markPaid supports batch pay-ahead of multiple installments at once',
    () async {
      final loanId = await loans.create(
        name: 'Batch loan',
        installmentAmount: 50,
        totalInstallments: 4,
        frequency: LoanFrequency.biweekly,
        startDate: DateTime(2026, 1, 1),
      );
      final installments = await loans.watchInstallments(loanId).first;

      await loans.markPaid(
        loanId: loanId,
        installmentIds: installments.take(3).map((i) => i.id).toList(),
        paidDate: DateTime(2026, 2, 1),
      );

      final loan = await loans.getById(loanId);
      expect(loan!.paidInstallments, 3);
      expect(loan.isActive, isTrue);
    },
  );

  test(
    'watchActive() stream re-emits the updated paidInstallments after markPaid',
    () async {
      final loanId = await loans.create(
        name: 'Reactive loan',
        installmentAmount: 100,
        totalInstallments: 3,
        frequency: LoanFrequency.monthly,
        startDate: DateTime(2026, 1, 1),
      );
      final installments = await loans.watchInstallments(loanId).first;

      final emissionsFuture = loans
          .watchActive()
          .map(
            (list) => list.firstWhere((l) => l.id == loanId).paidInstallments,
          )
          .distinct()
          .take(2)
          .toList();

      // Let the stream attach before writing, matching how a screen watches
      // it before the user takes any action.
      await Future<void>.delayed(Duration.zero);

      await loans.markPaid(
        loanId: loanId,
        installmentIds: installments.take(2).map((i) => i.id).toList(),
        paidDate: DateTime(2026, 1, 1),
      );

      final emissions = await emissionsFuture.timeout(
        const Duration(seconds: 5),
      );
      expect(emissions, [0, 2]);
    },
  );

  test(
    'getOverdueInstallments finds only past-due pending installments',
    () async {
      final loanId = await loans.create(
        name: 'Overdue check',
        installmentAmount: 100,
        totalInstallments: 3,
        frequency: LoanFrequency.monthly,
        startDate: DateTime(2020, 1, 1),
      );

      final overdue = await loans.getOverdueInstallments(loanId);
      expect(overdue, hasLength(3));
    },
  );

  test('watchUnpaidInstallmentsWithLoan excludes paid installments and '
      'installments of inactive loans', () async {
    final loanId = await loans.create(
      name: 'Agenda loan',
      installmentAmount: 100,
      totalInstallments: 2,
      frequency: LoanFrequency.monthly,
      startDate: DateTime(2026, 1, 1),
    );
    final installments = await loans.watchInstallments(loanId).first;

    final beforePaying = await loans.watchUnpaidInstallmentsWithLoan().first;
    expect(beforePaying.where((p) => p.$1.loanId == loanId), hasLength(2));

    // Paying off every installment deactivates the loan (see markPaid),
    // so both the paid installment and the still-pending one (there
    // shouldn't be one here, but this loan only has one left) must drop
    // out of the agenda feed once the loan itself is no longer active.
    await loans.markPaid(
      loanId: loanId,
      installmentIds: installments.map((i) => i.id).toList(),
      paidDate: DateTime(2026, 1, 1),
    );

    final afterPaying = await loans.watchUnpaidInstallmentsWithLoan().first;
    expect(afterPaying.where((p) => p.$1.loanId == loanId), isEmpty);
  });

  test('autoMarkOverdueInstallments transitions only past-due pending '
      'installments, leaving paid and future ones alone', () async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final loanId = await loans.create(
      name: 'Overdue transition loan',
      installmentAmount: 100,
      totalInstallments: 3,
      frequency: LoanFrequency.weekly,
      // Weekly steps land the 3 installments at day 0, 7, 14 from
      // startDate — starting 10 days ago puts #1 in the past (should
      // become overdue), #2 today (should stay pending — not yet
      // "fully passed"), and #3 in the future (stays pending too).
      startDate: today.subtract(const Duration(days: 10)),
    );
    final installments = await loans.watchInstallments(loanId).first;
    await loans.markPaid(
      loanId: loanId,
      installmentIds: [installments[0].id],
      paidDate: today,
    );
    final paidId = installments[0].id;
    final stillPastDueId = installments[1].id; // day -3, unpaid
    final futureId = installments[2].id; // day +4, unpaid

    await loans.autoMarkOverdueInstallments();

    final refreshed = await loans.watchInstallments(loanId).first;
    final byId = {for (final i in refreshed) i.id: i};
    expect(byId[paidId]!.status, InstallmentStatus.paid.dbValue);
    expect(byId[stillPastDueId]!.status, InstallmentStatus.overdue.dbValue);
    expect(byId[futureId]!.status, InstallmentStatus.pending.dbValue);
  });
}
