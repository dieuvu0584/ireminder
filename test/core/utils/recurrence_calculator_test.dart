import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/recurrence_calculator.dart';
import 'package:ireminder/domain/enums/recurrence_type.dart';
import 'package:ireminder/domain/models/recurrence_params.dart';

void main() {
  group('daily', () {
    test('adds one day', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.daily),
        DateTime(2026, 1, 1),
      );
      expect(result, DateTime(2026, 1, 2));
    });
  });

  group('weekly', () {
    test('finds nearest target weekday strictly after fromDate', () {
      // 2026-07-09 is a Thursday (weekday=4). Target Monday (1).
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.weekly, weekday: 1),
        DateTime(2026, 7, 9),
      );
      expect(result, DateTime(2026, 7, 13)); // next Monday
    });

    test('when fromDate is already the target weekday, jumps a full week',
        () {
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.weekly, weekday: 4),
        DateTime(2026, 7, 9), // Thursday
      );
      expect(result, DateTime(2026, 7, 16));
    });
  });

  group('monthly - day=31 clamped into shorter months', () {
    test('January 31 -> February (28 days, non-leap) clamps to 28', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 31),
        DateTime(2026, 1, 31),
      );
      expect(result, DateTime(2026, 2, 28));
    });

    test('January 31 -> February (29 days, leap year) clamps to 29', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 31),
        DateTime(2028, 1, 31),
      );
      expect(result, DateTime(2028, 2, 29));
    });

    test('April 30 -> May 31 keeps full day when month has 31 days', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 31),
        DateTime(2026, 4, 1),
      );
      expect(result, DateTime(2026, 5, 31));
    });

    test('December rolls over into next January', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 15),
        DateTime(2026, 12, 1),
      );
      expect(result, DateTime(2027, 1, 15));
    });
  });

  group('yearly - Feb 29 across normal and leap years', () {
    test('non-leap target year clamps Feb 29 -> Feb 28', () {
      // fromDate in 2027 -> next year is 2028... use 2023 -> 2024(leap) etc.
      final result = calculateNextDueDate(
        const RecurrenceParams(
          type: RecurrenceType.yearly,
          day: 29,
          month: 2,
        ),
        DateTime(2026, 6, 1), // -> next year 2027, not a leap year
      );
      expect(result, DateTime(2027, 2, 28));
    });

    test('leap target year keeps Feb 29', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(
          type: RecurrenceType.yearly,
          day: 29,
          month: 2,
        ),
        DateTime(2027, 6, 1), // -> next year 2028, a leap year
      );
      expect(result, DateTime(2028, 2, 29));
    });
  });

  group('custom_interval_days - month/year boundaries', () {
    test('crosses end of month', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(
          type: RecurrenceType.customIntervalDays,
          intervalDays: 5,
        ),
        DateTime(2026, 1, 29),
      );
      expect(result, DateTime(2026, 2, 3));
    });

    test('crosses end of year', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(
          type: RecurrenceType.customIntervalDays,
          intervalDays: 10,
        ),
        DateTime(2026, 12, 28),
      );
      expect(result, DateTime(2027, 1, 7));
    });

    test('90-day interval from a leap-day start', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(
          type: RecurrenceType.customIntervalDays,
          intervalDays: 90,
        ),
        DateTime(2028, 2, 29),
      );
      expect(result, DateTime(2028, 5, 29));
    });
  });

  group('lunar_yearly - resolves a different solar date each year', () {
    test('consecutive years give strictly increasing, distinct solar dates',
        () {
      // Lunar Tet (month=1, day=1) tracked across 3 consecutive years.
      const params = RecurrenceParams(
        type: RecurrenceType.lunarYearly,
        month: 1,
        day: 1,
      );

      final first = calculateNextDueDate(params, DateTime(2025, 6, 1));
      final second = calculateNextDueDate(params, first);
      final third = calculateNextDueDate(params, second);

      expect(first.isAfter(DateTime(2025, 6, 1)), isTrue);
      expect(second.isAfter(first), isTrue);
      expect(third.isAfter(second), isTrue);

      // Solar dates for Lunar New Year drift year to year (not a fixed
      // solar month/day), so all three must differ.
      expect(first, isNot(equals(second)));
      expect(second, isNot(equals(third)));
      expect(first, isNot(equals(third)));

      // Roughly one solar year apart each time (lunar year length varies
      // 353-385 days).
      expect(second.difference(first).inDays, inInclusiveRange(300, 400));
      expect(third.difference(second).inDays, inInclusiveRange(300, 400));
    });

    test('always returns a date strictly after fromDate', () {
      const params = RecurrenceParams(
        type: RecurrenceType.lunarYearly,
        month: 7,
        day: 15,
      );
      final result = calculateNextDueDate(params, DateTime(2026, 8, 27));
      expect(result.isAfter(DateTime(2026, 8, 27)), isTrue);
    });
  });
}
