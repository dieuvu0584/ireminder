import 'package:drift/drift.dart';
import 'categories_table.dart';

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  IntColumn get categoryId =>
      integer().references(Categories, #id)();

  /// none | daily | weekly | monthly | yearly | custom_interval_days | lunar_yearly
  TextColumn get recurrenceType => text()();
  IntColumn get recurrenceInterval => integer().nullable()();
  IntColumn get recurrenceDay => integer().nullable()();
  IntColumn get recurrenceMonth => integer().nullable()();
  IntColumn get recurrenceWeekday => integer().nullable()();
  BoolColumn get isLunar => boolean().withDefault(const Constant(false))();

  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get nextDueDate => dateTime()();
  TextColumn get reminderTime => text()(); // "HH:mm"
  IntColumn get advanceNoticeDays =>
      integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get snoozeUntil => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
