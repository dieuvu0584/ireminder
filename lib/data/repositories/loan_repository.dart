import 'package:drift/drift.dart';

import '../../core/utils/loan_installment_generator.dart';
import '../../domain/enums/loan_frequency.dart';
import '../database/app_database.dart';

class LoanRepository {
  final AppDatabase _db;

  LoanRepository(this._db);

  Stream<List<Loan>> watchActive() {
    return (_db.select(_db.loans)
          ..where((l) => l.isActive.equals(true))
          ..orderBy([(l) => OrderingTerm.asc(l.startDate)]))
        .watch();
  }

  Future<Loan?> getById(int id) {
    return (_db.select(_db.loans)..where((l) => l.id.equals(id)))
        .getSingleOrNull();
  }

  Future<LoanInstallment?> getInstallmentById(int installmentId) {
    return (_db.select(_db.loanInstallments)
          ..where((i) => i.id.equals(installmentId)))
        .getSingleOrNull();
  }

  Stream<List<LoanInstallment>> watchInstallments(int loanId) {
    return (_db.select(_db.loanInstallments)
          ..where((i) => i.loanId.equals(loanId))
          ..orderBy([(i) => OrderingTerm.asc(i.installmentNumber)]))
        .watch();
  }

  /// Creates a loan and immediately generates all of its installments.
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
    String? notes,
  }) async {
    final drafts = generateInstallments(
      startDate: startDate,
      totalInstallments: totalInstallments,
      installmentAmount: installmentAmount,
      frequency: frequency,
      dueDayOfMonth: dueDayOfMonth,
    );
    final endDate = drafts.last.dueDate;

    return _db.transaction(() async {
      final loanId = await _db.into(_db.loans).insert(
            LoansCompanion.insert(
              name: name,
              categoryId: Value(categoryId),
              totalAmount: Value(totalAmount),
              installmentAmount: installmentAmount,
              totalInstallments: totalInstallments,
              frequency: frequency.dbValue,
              dueDayOfMonth: Value(dueDayOfMonth),
              startDate: startDate,
              endDate: Value(endDate),
              reminderAdvanceDays: Value(reminderAdvanceDays),
              notes: Value(notes),
              createdAt: DateTime.now(),
            ),
          );

      await _db.batch((batch) {
        batch.insertAll(
          _db.loanInstallments,
          drafts.map(
            (d) => LoanInstallmentsCompanion.insert(
              loanId: loanId,
              installmentNumber: d.installmentNumber,
              dueDate: d.dueDate,
              amount: d.amount,
            ),
          ),
        );
      });

      return loanId;
    });
  }

  /// Marks one or more installments as paid (batch pay-ahead supported),
  /// then updates the parent loan's `paid_installments` count and
  /// deactivates the loan once every installment is paid.
  Future<void> markPaid({
    required int loanId,
    required List<int> installmentIds,
    required DateTime paidDate,
  }) async {
    await _db.transaction(() async {
      for (final id in installmentIds) {
        final installment = await (_db.select(_db.loanInstallments)
              ..where((i) => i.id.equals(id)))
            .getSingle();
        await (_db.update(_db.loanInstallments)
              ..where((i) => i.id.equals(id)))
            .write(
          LoanInstallmentsCompanion(
            status: Value(InstallmentStatus.paid.dbValue),
            paidDate: Value(paidDate),
            paidAmount: Value(installment.amount),
          ),
        );
      }

      final paidCount = await (_db.selectOnly(_db.loanInstallments)
            ..addColumns([_db.loanInstallments.id.count()])
            ..where(_db.loanInstallments.loanId.equals(loanId) &
                _db.loanInstallments.status.equals(
                  InstallmentStatus.paid.dbValue,
                )))
          .map((row) => row.read(_db.loanInstallments.id.count()) ?? 0)
          .getSingle();

      final loan =
          await (_db.select(_db.loans)..where((l) => l.id.equals(loanId)))
              .getSingle();

      await (_db.update(_db.loans)..where((l) => l.id.equals(loanId))).write(
        LoansCompanion(
          paidInstallments: Value(paidCount),
          isActive: Value(paidCount < loan.totalInstallments),
        ),
      );
    });
  }

  /// Runtime overdue check: any pending installment whose due date has
  /// passed is reported as overdue. Computed on read, no cronjob needed.
  Future<List<LoanInstallment>> getOverdueInstallments(int loanId) async {
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    return (_db.select(_db.loanInstallments)
          ..where((i) =>
              i.loanId.equals(loanId) &
              i.status.equals(InstallmentStatus.pending.dbValue) &
              i.dueDate.isSmallerThanValue(todayOnly)))
        .get();
  }

  Future<void> delete(int loanId) {
    return (_db.delete(_db.loans)..where((l) => l.id.equals(loanId))).go();
  }
}
