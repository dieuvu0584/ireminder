import 'package:drift/drift.dart';
import 'loans_table.dart';

class LoanInstallments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get loanId =>
      integer().references(Loans, #id, onDelete: KeyAction.cascade)();
  IntColumn get installmentNumber => integer()();
  DateTimeColumn get dueDate => dateTime()();
  RealColumn get amount => real()();

  /// pending | paid | overdue
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get paidDate => dateTime().nullable()();
  RealColumn get paidAmount => real().nullable()();
}
