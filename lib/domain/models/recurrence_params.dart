import '../enums/recurrence_type.dart';

/// Pure-data recurrence description, decoupled from the Drift row type so
/// [calculateNextDueDate] stays a pure function that is easy to unit test.
class RecurrenceParams {
  final RecurrenceType type;
  final int? intervalDays;
  final int? day; // day-of-month (monthly) or lunar day (lunarYearly)
  final int? month; // fixed month (yearly, lunarYearly)
  final int? weekday; // 1 (Mon) - 7 (Sun), for weekly

  const RecurrenceParams({
    required this.type,
    this.intervalDays,
    this.day,
    this.month,
    this.weekday,
  });
}
