class AiContextReminderInput {
  final int categoryId;
  final String title;
  final DateTime dueDate;

  const AiContextReminderInput({
    required this.categoryId,
    required this.title,
    required this.dueDate,
  });
}

class AiContextLoanInput {
  final int? categoryId;
  final String name;
  final int totalInstallments;
  final int paidInstallments;
  final DateTime? nextDueDate;

  const AiContextLoanInput({
    required this.categoryId,
    required this.name,
    required this.totalInstallments,
    required this.paidInstallments,
    required this.nextDueDate,
  });
}

class AiContextCategoryInput {
  final int id;
  final String name;

  const AiContextCategoryInput({required this.id, required this.name});
}

/// Builds a neutral, plain-text context block from the user's local data —
/// never the raw DB rows — to hand to whichever [AiProvider] is active.
/// Each provider adapter converts this same neutral string into its own
/// request format, per PROMPT.md §9.6.
///
/// Security-critical: only [AiContextReminderInput]/[AiContextLoanInput]
/// entries whose categoryId is in [allowedCategoryIds] are ever included.
/// A loan with no category is excluded rather than assumed safe, since it
/// can't be verified against the allow-list. Covered by
/// test/core/utils/ai_context_builder_test.dart.
String buildAiContext({
  required List<AiContextReminderInput> reminders,
  required List<AiContextLoanInput> loans,
  required List<AiContextCategoryInput> categories,
  required Set<int> allowedCategoryIds,
  required DateTime now,
}) {
  final categoryNames = {
    for (final c in categories)
      if (allowedCategoryIds.contains(c.id)) c.id: c.name,
  };

  final horizon = now.add(const Duration(days: 30));
  final upcomingReminders = reminders.where((r) =>
      allowedCategoryIds.contains(r.categoryId) &&
      !r.dueDate.isBefore(now) &&
      !r.dueDate.isAfter(horizon));

  final visibleLoans = loans.where(
    (l) => l.categoryId != null && allowedCategoryIds.contains(l.categoryId),
  );

  final buffer = StringBuffer();

  buffer.writeln('Categories: ${categoryNames.values.join(', ')}');
  buffer.writeln();

  buffer.writeln('Upcoming reminders (next 30 days):');
  if (upcomingReminders.isEmpty) {
    buffer.writeln('(none)');
  } else {
    for (final r in upcomingReminders) {
      final catName = categoryNames[r.categoryId] ?? '';
      final due = r.dueDate.toIso8601String().split('T').first;
      buffer.writeln('- [$catName] ${r.title} — due $due');
    }
  }
  buffer.writeln();

  buffer.writeln('Loan / installment summary:');
  if (visibleLoans.isEmpty) {
    buffer.writeln('(none)');
  } else {
    for (final l in visibleLoans) {
      final due = l.nextDueDate == null
          ? 'n/a'
          : l.nextDueDate!.toIso8601String().split('T').first;
      buffer.writeln(
        '- ${l.name}: ${l.paidInstallments}/${l.totalInstallments} '
        'installments paid, next due $due',
      );
    }
  }

  return buffer.toString();
}
