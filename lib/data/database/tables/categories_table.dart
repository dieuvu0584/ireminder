import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  TextColumn get color => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isSystemDefault =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
}
