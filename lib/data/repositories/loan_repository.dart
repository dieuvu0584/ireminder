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
    return (_db.select(
      _db.loans,
    )..where((l) => l.id.equals(id))).getSingleOrNull();
  }

  Future<LoanInstallment?> getInstallmentById(int installmentId) {
    return (_db.select(
      _db.loanInstallments,
    )..where((i) => i.id.equals(installmentId))).getSingleOrNull();
  }

  Stream<List<LoanInstallment>> watchInstallments(int loanId) {
    return (_db.select(_db.loanInstallments)
          ..where((i) => i.loanId.equals(loanId))
          ..orderBy([(i) => OrderingTerm.asc(i.installmentNumber)]))
        .watch();
  }

  /// Every pending or overdue (but not yet paid) installment across every
  /// active loan, joined with its loan (for name/category display) — used
  /// to fold installment due dates into the Calendar/Task List tabs
  /// alongside reminders, since a payment coming due is also "something
  /// to be reminded about on a date." Overdue ones stay in this feed
  /// (locked, grayed out in the UI) rather than disappearing, matching
  /// how an auto-skipped reminder still shows on the day it was missed.
  Stream<List<(LoanInstallment, Loan)>> watchUnpaidInstallmentsWithLoan() {
    final query =
        _db.select(_db.loanInstallments).join([
            innerJoin(
              _db.loans,
              _db.loans.id.equalsExp(_db.loanInstallments.loanId),
            ),
          ])
          ..where(
            _db.loanInstallments.status.isIn([
                  InstallmentStatus.pending.dbValue,
                  InstallmentStatus.overdue.dbValue,
                ]) &
                _db.loans.isActive.equals(true),
          )
          ..orderBy([OrderingTerm.asc(_db.loanInstallments.dueDate)]);
    return query.watch().map(
      (rows) => rows
          .map(
            (row) =>
                (row.readTable(_db.loanInstallments), row.readTable(_db.loans)),
          )
          .toList(),
    );
  }

  /// Transitions any installment whose due date has fully passed while
  /// still 'pending' to 'overdue' — mirrors ReminderRepository's
  /// autoSkipOverdue, run once at app start rather than computed live, so
  /// the UI can trust the stored status instead of re-deriving it (and so
  /// it can lock a missed installment the same way a skipped reminder
  /// gets locked, instead of leaving it perpetually tappable).
  Future<void> autoMarkOverdueInstallments() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    await (_db.update(_db.loanInstallments)..where(
          (i) =>
              i.status.equals(InstallmentStatus.pending.dbValue) &
              i.dueDate.isSmallerThanValue(today),
        ))
        .write(
          LoanInstallmentsCompanion(
            status: Value(InstallmentStatus.overdue.dbValue),
          ),
        );
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
    String? reminderTime,
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
      final loanId = await _db
          .into(_db.loans)
          .insert(
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
              reminderTime: Value(reminderTime),
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
        final installment = await (_db.select(
          _db.loanInstallments,
        )..where((i) => i.id.equals(id))).getSingle();
        await (_db.update(
          _db.loanInstallments,
        )..where((i) => i.id.equals(id))).write(
          LoanInstallmentsCompanion(
            status: Value(InstallmentStatus.paid.dbValue),
            paidDate: Value(paidDate),
            paidAmount: Value(installment.amount),
          ),
        );
      }

      final paidCount =
          await (_db.selectOnly(_db.loanInstallments)
                ..addColumns([_db.loanInstallments.id.count()])
                ..where(
                  _db.loanInstallments.loanId.equals(loanId) &
                      _db.loanInstallments.status.equals(
                        InstallmentStatus.paid.dbValue,
                      ),
                ))
              .map((row) => row.read(_db.loanInstallments.id.count()) ?? 0)
              .getSingle();

      final loan = await (_db.select(
        _db.loans,
      )..where((l) => l.id.equals(loanId))).getSingle();

      await (_db.update(_db.loans)..where((l) => l.id.equals(loanId))).write(
        LoansCompanion(
          paidInstallments: Value(paidCount),
          isActive: Value(paidCount < loan.totalInstallments),
        ),
      );
    });
  }

  /// Reverts a paid installment back to pending, undoing [markPaid]. The
  /// caller only offers this while the due date hasn't passed yet (see
  /// InstallmentCard/LoanDetailScreen's lock logic — once it has, paid or
  /// not, it's locked the same way an overdue one is), so this always
  /// resets straight to 'pending' rather than needing to reconstruct
  /// whatever status came before.
  Future<void> markUnpaid({
    required int loanId,
    required int installmentId,
  }) async {
    await _db.transaction(() async {
      await (_db.update(
        _db.loanInstallments,
      )..where((i) => i.id.equals(installmentId))).write(
        LoanInstallmentsCompanion(
          status: Value(InstallmentStatus.pending.dbValue),
          paidDate: const Value(null),
          paidAmount: const Value(null),
        ),
      );

      final paidCount =
          await (_db.selectOnly(_db.loanInstallments)
                ..addColumns([_db.loanInstallments.id.count()])
                ..where(
                  _db.loanInstallments.loanId.equals(loanId) &
                      _db.loanInstallments.status.equals(
                        InstallmentStatus.paid.dbValue,
                      ),
                ))
              .map((row) => row.read(_db.loanInstallments.id.count()) ?? 0)
              .getSingle();

      final loan = await (_db.select(
        _db.loans,
      )..where((l) => l.id.equals(loanId))).getSingle();

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
    return (_db.select(_db.loanInstallments)..where(
          (i) =>
              i.loanId.equals(loanId) &
              i.status.equals(InstallmentStatus.pending.dbValue) &
              i.dueDate.isSmallerThanValue(todayOnly),
        ))
        .get();
  }

  /// Deletes installments explicitly rather than relying on the schema's
  /// `onDelete: cascade` — SQLite only honors that when `PRAGMA foreign_keys
  /// = ON` has been executed on the connection, which this app doesn't do,
  /// so leaving it to the FK constraint alone orphans every installment row.
  Future<void> delete(int loanId) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.loanInstallments,
      )..where((i) => i.loanId.equals(loanId))).go();
      await (_db.delete(_db.loans)..where((l) => l.id.equals(loanId))).go();
    });
  }
}
