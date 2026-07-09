import '../../domain/enums/loan_frequency.dart';

class InstallmentDraft {
  final int installmentNumber;
  final DateTime dueDate;
  final double amount;

  const InstallmentDraft({
    required this.installmentNumber,
    required this.dueDate,
    required this.amount,
  });
}

int _daysInMonth(int year, int month) {
  final firstOfNextMonth =
      month == 12 ? DateTime(year + 1, 1, 1) : DateTime(year, month + 1, 1);
  return firstOfNextMonth.subtract(const Duration(days: 1)).day;
}

/// Pure function: generates all installment rows for a new loan up-front.
/// [totalInstallments] rows are produced, numbered 1..totalInstallments,
/// each carrying [installmentAmount] so that the sum always equals
/// `installmentAmount * totalInstallments`.
List<InstallmentDraft> generateInstallments({
  required DateTime startDate,
  required int totalInstallments,
  required double installmentAmount,
  required LoanFrequency frequency,
  int? dueDayOfMonth,
}) {
  final start = DateTime(startDate.year, startDate.month, startDate.day);

  return List.generate(totalInstallments, (n) {
    final DateTime dueDate;
    switch (frequency) {
      case LoanFrequency.weekly:
        dueDate = start.add(Duration(days: 7 * n));
        break;
      case LoanFrequency.biweekly:
        dueDate = start.add(Duration(days: 14 * n));
        break;
      case LoanFrequency.monthly:
        final day = dueDayOfMonth ?? start.day;
        var year = start.year;
        var month = start.month + n;
        year += (month - 1) ~/ 12;
        month = ((month - 1) % 12) + 1;
        final clampedDay = day.clamp(1, _daysInMonth(year, month));
        dueDate = DateTime(year, month, clampedDay);
        break;
    }
    return InstallmentDraft(
      installmentNumber: n + 1,
      dueDate: dueDate,
      amount: installmentAmount,
    );
  });
}
