import 'package:drift/drift.dart';

import '../database/app_database.dart';

class AiChatRepository {
  final AppDatabase _db;

  AiChatRepository(this._db);

  Stream<List<AiChatHistoryData>> watchHistory() {
    return (_db.select(_db.aiChatHistory)
          ..orderBy([(h) => OrderingTerm.asc(h.createdAt)]))
        .watch();
  }

  Future<void> addMessage({required String role, required String content}) {
    return _db.into(_db.aiChatHistory).insert(
          AiChatHistoryCompanion.insert(
            role: role,
            content: content,
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> clearHistory() {
    return _db.delete(_db.aiChatHistory).go();
  }
}
