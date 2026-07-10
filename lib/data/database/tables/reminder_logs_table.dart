import 'package:drift/drift.dart';
import 'reminders_table.dart';

class ReminderLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reminderId =>
      integer().references(Reminders, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get completedAt => dateTime()();

  /// completed | snoozed | skipped
  TextColumn get action => text()();
  TextColumn get note => text().nullable()();
}
