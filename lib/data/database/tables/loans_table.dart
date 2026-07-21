import 'package:drift/drift.dart';
import 'categories_table.dart';

class Loans extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
  RealColumn get totalAmount => real().nullable()();
  RealColumn get installmentAmount => real()();
  IntColumn get totalInstallments => integer()();
  IntColumn get paidInstallments => integer().withDefault(const Constant(0))();

  /// monthly | weekly | biweekly
  TextColumn get frequency => text()();
  IntColumn get dueDayOfMonth => integer().nullable()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get reminderAdvanceDays =>
      integer().withDefault(const Constant(3))();

  /// "HH:mm" — the time of day installment notifications fire at, picked
  /// per-loan at creation. Null on loans created before this existed,
  /// which fall back to the app-wide default reminder time instead (see
  /// AlarmSchedulerService.scheduleForInstallment).
  TextColumn get reminderTime => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}
