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

  test('markPaid updates paid_installments and deactivates loan when done',
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
  });

  test('markPaid supports batch pay-ahead of multiple installments at once',
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
  });

  test('getOverdueInstallments finds only past-due pending installments',
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
  });
}
