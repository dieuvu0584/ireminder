import 'package:drift/drift.dart';

class AiChatHistory extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// "user" | "assistant"
  TextColumn get role => text()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
}
