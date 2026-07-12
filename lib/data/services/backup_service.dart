import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../database/app_database.dart';

enum BackupImportResult { success, cancelled, failed }

const int kBackupFormatVersion = 1;

/// Exports/imports the entire local database as a single JSON file so a
/// family can move their data between phones without any cloud service.
///
/// Deliberately avoids a file-picker plugin: every backup lives in one
/// app-owned folder under external storage (visible to the phone's Files
/// app, no extra permission needed on modern Android), and restoring means
/// picking from the list of files already there — including ones a user
/// copied in manually from another device. One fewer native dependency,
/// one fewer thing that can break a release build.
class BackupService {
  final AppDatabase _db;

  BackupService(this._db);

  Future<Directory> _backupDir() async {
    final base =
        await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, 'backups'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<String> exportBackup() async {
    final payload = await _buildExportPayload();
    final bytes = utf8.encode(
      const JsonEncoder.withIndent('  ').convert(payload),
    );
    final fileName =
        'ireminder_backup_${DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first}.json';

    final dir = await _backupDir();
    final file = File(p.join(dir.path, fileName));
    await file.writeAsBytes(bytes);
    return file.path;
  }

  /// Backup files available to restore from, newest first.
  Future<List<File>> listBackups() async {
    final dir = await _backupDir();
    final entries = await dir
        .list()
        .where((e) => e is File && e.path.endsWith('.json'))
        .cast<File>()
        .toList();
    entries.sort(
      (a, b) => b.statSync().modified.compareTo(a.statSync().modified),
    );
    return entries;
  }

  Future<Map<String, dynamic>> _buildExportPayload() async {
    final categories = await _db.select(_db.categories).get();
    final reminders = await _db.select(_db.reminders).get();
    final reminderLogs = await _db.select(_db.reminderLogs).get();
    final loans = await _db.select(_db.loans).get();
    final loanInstallments = await _db.select(_db.loanInstallments).get();
    final settings = await _db.select(_db.appSettings).getSingle();

    return {
      'formatVersion': kBackupFormatVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'categories': categories.map((c) => c.toJson()).toList(),
      'reminders': reminders.map((r) => r.toJson()).toList(),
      'reminderLogs': reminderLogs.map((r) => r.toJson()).toList(),
      'loans': loans.map((l) => l.toJson()).toList(),
      'loanInstallments': loanInstallments.map((i) => i.toJson()).toList(),
      'appSettings': settings.toJson(),
    };
  }

  Future<BackupImportResult> importBackup(File file) async {
    try {
      final content = await file.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;
      await _restoreFromPayload(json);
      return BackupImportResult.success;
    } catch (_) {
      return BackupImportResult.failed;
    }
  }

  Future<void> _restoreFromPayload(Map<String, dynamic> json) async {
    await _db.transaction(() async {
      await _db.delete(_db.loanInstallments).go();
      await _db.delete(_db.reminderLogs).go();
      await _db.delete(_db.loans).go();
      await _db.delete(_db.reminders).go();
      await _db.delete(_db.categories).go();

      for (final row in (json['categories'] as List)) {
        await _db
            .into(_db.categories)
            .insert(
              Category.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['reminders'] as List)) {
        await _db
            .into(_db.reminders)
            .insert(
              Reminder.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['reminderLogs'] as List)) {
        await _db
            .into(_db.reminderLogs)
            .insert(
              ReminderLog.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['loans'] as List)) {
        await _db
            .into(_db.loans)
            .insert(
              Loan.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['loanInstallments'] as List)) {
        await _db
            .into(_db.loanInstallments)
            .insert(
              LoanInstallment.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      if (json['appSettings'] != null) {
        final settings = AppSetting.fromJson(
          json['appSettings'] as Map<String, dynamic>,
        );
        await _db
            .into(_db.appSettings)
            .insert(settings, mode: drift.InsertMode.insertOrReplace);
      }
      // 'aiSettings'/'aiChatHistory' keys from a backup made before the AI
      // assistant was removed are simply ignored — those tables no longer
      // exist, and there's nothing to restore them into.
    });
  }
}
