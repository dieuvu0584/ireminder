import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:file_picker/file_picker.dart';

import '../database/app_database.dart';

enum BackupImportResult { success, cancelled, failed }

const int kBackupFormatVersion = 1;

/// Exports/imports the entire local database as a single JSON file so a
/// family can move their data between phones without any cloud service.
class BackupService {
  final AppDatabase _db;

  BackupService(this._db);

  Future<bool> exportBackup() async {
    final payload = await _buildExportPayload();
    final bytes = utf8.encode(const JsonEncoder.withIndent('  ').convert(payload));
    final fileName =
        'ireminder_backup_${DateTime.now().toIso8601String().split('T').first}.json';

    final path = await FilePicker.platform.saveFile(
      fileName: fileName,
      bytes: bytes,
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (path == null) return false;

    // Some platforms return a path without writing bytes themselves.
    final file = File(path);
    if (!await file.exists()) {
      await file.writeAsBytes(bytes);
    }
    return true;
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

  Future<BackupImportResult> importBackup() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    final path = result?.files.single.path;
    if (path == null) return BackupImportResult.cancelled;

    try {
      final content = await File(path).readAsString();
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
        await _db.into(_db.categories).insert(
              Category.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['reminders'] as List)) {
        await _db.into(_db.reminders).insert(
              Reminder.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['reminderLogs'] as List)) {
        await _db.into(_db.reminderLogs).insert(
              ReminderLog.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['loans'] as List)) {
        await _db.into(_db.loans).insert(
              Loan.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      for (final row in (json['loanInstallments'] as List)) {
        await _db.into(_db.loanInstallments).insert(
              LoanInstallment.fromJson(row as Map<String, dynamic>),
              mode: drift.InsertMode.insertOrReplace,
            );
      }
      if (json['appSettings'] != null) {
        final settings =
            AppSetting.fromJson(json['appSettings'] as Map<String, dynamic>);
        await _db.into(_db.appSettings).insert(
              settings,
              mode: drift.InsertMode.insertOrReplace,
            );
      }
    });
  }
}
