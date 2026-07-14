import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/lunar_converter.dart';
import 'package:ireminder/core/utils/recurrence_calculator.dart';
import 'package:ireminder/domain/enums/recurrence_type.dart';
import 'package:ireminder/domain/models/daily_exclusion.dart';
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

    test('weekday exclusion: skips excluded days entirely, lands on the '
        'next non-excluded one', () {
      // 2026-07-10 is a Friday. Excluding Sat/Sun should jump to Monday.
      final params = RecurrenceParams(
        type: RecurrenceType.daily,
        dailyExclusion: DailyExclusion.weekdays({6, 7}),
      );
      final result = calculateNextDueDate(params, DateTime(2026, 7, 10));
      expect(result, DateTime(2026, 7, 13)); // Monday
      expect(result.weekday, DateTime.monday);
    });

    test('even/odd exclusion: excluding even days always lands on an odd '
        'day-of-month', () {
      final params = RecurrenceParams(
        type: RecurrenceType.daily,
        dailyExclusion: const DailyExclusion.evenOdd(true),
      );
      // From an odd day (excludeEven doesn't touch odd days), next day is
      // even and excluded, so it should skip to the day after.
      final result = calculateNextDueDate(params, DateTime(2026, 7, 9));
      expect(result, DateTime(2026, 7, 11));
      expect(result.day.isOdd, isTrue);
    });

    test('specific-day exclusion: skips that day-of-month, lands the day '
        'after', () {
      final params = RecurrenceParams(
        type: RecurrenceType.daily,
        dailyExclusion: const DailyExclusion.specificDay({15}),
      );
      final result = calculateNextDueDate(params, DateTime(2026, 7, 14));
      expect(result, DateTime(2026, 7, 16)); // skips the 15th
    });

    test('specific-day exclusion: skips a whole run of consecutive '
        'excluded days', () {
      final params = RecurrenceParams(
        type: RecurrenceType.daily,
        dailyExclusion: const DailyExclusion.specificDay({15, 16, 17}),
      );
      final result = calculateNextDueDate(params, DateTime(2026, 7, 14));
      expect(result, DateTime(2026, 7, 18));
    });

    test('calculateFirstOccurrenceOnOrAfter rolls forward if fromDate '
        'itself is excluded', () {
      // 2026-07-11 is a Saturday.
      final params = RecurrenceParams(
        type: RecurrenceType.daily,
        dailyExclusion: DailyExclusion.weekdays({6, 7}),
      );
      final result = calculateFirstOccurrenceOnOrAfter(
        params,
        DateTime(2026, 7, 11),
      );
      expect(result, DateTime(2026, 7, 13)); // next Monday
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

    test('when fromDate is already the target weekday, jumps a full week', () {
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
        const RecurrenceParams(type: RecurrenceType.yearly, day: 29, month: 2),
        DateTime(2026, 6, 1), // -> next year 2027, not a leap year
      );
      expect(result, DateTime(2027, 2, 28));
    });

    test('leap target year keeps Feb 29', () {
      final result = calculateNextDueDate(
        const RecurrenceParams(type: RecurrenceType.yearly, day: 29, month: 2),
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
    test(
      'consecutive years give strictly increasing, distinct solar dates',
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
      },
    );

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

  group('lunar_monthly - recurs on a fixed lunar day every lunar month', () {
    test('next occurrence has the target lunar day and is strictly after '
        'fromDate', () {
      const params = RecurrenceParams(
        type: RecurrenceType.lunarMonthly,
        day: 15,
      );
      final from = DateTime(2026, 7, 13);
      final result = calculateNextDueDate(params, from);
      expect(result.isAfter(from), isTrue);
      expect(LunarConverter.solarToLunar(result).day, 15);
    });

    test(
      'consecutive occurrences are roughly a lunar month (29-30 days) apart',
      () {
        // Day 1 (mùng một) exists in every lunar month regardless of
        // whether it's a 29- or 30-day month, unlike day 30.
        const params = RecurrenceParams(
          type: RecurrenceType.lunarMonthly,
          day: 1,
        );
        final first = calculateNextDueDate(params, DateTime(2026, 1, 1));
        final second = calculateNextDueDate(params, first);
        expect(LunarConverter.solarToLunar(first).day, 1);
        expect(LunarConverter.solarToLunar(second).day, 1);
        expect(second.difference(first).inDays, inInclusiveRange(29, 30));
      },
    );

    test('calculateFirstOccurrenceOnOrAfter includes fromDate itself when it '
        'already matches, unlike calculateNextDueDate', () {
      const params = RecurrenceParams(
        type: RecurrenceType.lunarMonthly,
        day: 1,
      );
      final lunarDayOne = calculateNextDueDate(params, DateTime(2026, 1, 1));
      final result = calculateFirstOccurrenceOnOrAfter(params, lunarDayOne);
      expect(result, lunarDayOne);
    });
  });

  group('yearly - same-year date still upcoming', () {
    test(
      'uses this year, not next, when the target date has not passed yet',
      () {
        final result = calculateNextDueDate(
          const RecurrenceParams(
            type: RecurrenceType.yearly,
            day: 25,
            month: 12,
          ),
          DateTime(2026, 1, 1),
        );
        expect(result, DateTime(2026, 12, 25));
      },
    );
  });

  group('calculateFirstOccurrenceOnOrAfter', () {
    test(
      'weekly: returns fromDate itself when its weekday already matches',
      () {
        // 2026-07-13 is a Monday.
        final result = calculateFirstOccurrenceOnOrAfter(
          const RecurrenceParams(type: RecurrenceType.weekly, weekday: 1),
          DateTime(2026, 7, 13),
        );
        expect(result, DateTime(2026, 7, 13));
      },
    );

    test('monthly: uses this month when the target day has not passed yet', () {
      final result = calculateFirstOccurrenceOnOrAfter(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 20),
        DateTime(2026, 7, 5),
      );
      expect(result, DateTime(2026, 7, 20));
    });

    test('monthly: rolls to next month when the target day already passed', () {
      final result = calculateFirstOccurrenceOnOrAfter(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 3),
        DateTime(2026, 7, 5),
      );
      expect(result, DateTime(2026, 8, 3));
    });

    test('yearly: uses this year when the target date has not passed yet', () {
      final result = calculateFirstOccurrenceOnOrAfter(
        const RecurrenceParams(type: RecurrenceType.yearly, day: 25, month: 12),
        DateTime(2026, 1, 1),
      );
      expect(result, DateTime(2026, 12, 25));
    });

    test('yearly: rolls to next year when the target date already passed', () {
      final result = calculateFirstOccurrenceOnOrAfter(
        const RecurrenceParams(type: RecurrenceType.yearly, day: 1, month: 1),
        DateTime(2026, 6, 1),
      );
      expect(result, DateTime(2027, 1, 1));
    });

    test('lunar_yearly: uses this year when the converted solar date has '
        'not passed yet, regardless of fromDate', () {
      // Reproduces the reported bug directly: a reminder created today
      // must resolve to the correct lunar-derived solar date this year,
      // not just echo fromDate back.
      const params = RecurrenceParams(
        type: RecurrenceType.lunarYearly,
        month: 6,
        day: 10,
      );
      final expected = LunarConverter.lunarToSolar(2026, 6, 10);
      final result = calculateFirstOccurrenceOnOrAfter(
        params,
        DateTime(2026, 7, 11),
      );
      expect(result, expected);
      expect(result, isNot(equals(DateTime(2026, 7, 11))));
    });
  });

  group('occurrenceInYear', () {
    test('yearly: returns the (month, day) within the given year', () {
      final result = occurrenceInYear(
        const RecurrenceParams(type: RecurrenceType.yearly, day: 25, month: 12),
        2028,
      );
      expect(result, DateTime(2028, 12, 25));
    });

    test('lunar_yearly: returns a date that actually falls within the '
        'given year', () {
      final result = occurrenceInYear(
        const RecurrenceParams(
          type: RecurrenceType.lunarYearly,
          month: 6,
          day: 10,
        ),
        2028,
      );
      expect(result, isNotNull);
      expect(result!.year, 2028);
    });

    test('returns null for recurrence types with no single per-year date', () {
      final result = occurrenceInYear(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 15),
        2028,
      );
      expect(result, isNull);
    });
  });

  group('occurrencesInMonth', () {
    test('monthly: returns exactly one occurrence, clamped to the month', () {
      final result = occurrencesInMonth(
        const RecurrenceParams(type: RecurrenceType.monthly, day: 31),
        DateTime(2026, 2, 1), // February, only 28 days
      );
      expect(result, [DateTime(2026, 2, 28)]);
    });

    test('lunar_monthly: every returned date actually has the target '
        'lunar day', () {
      final result = occurrencesInMonth(
        const RecurrenceParams(type: RecurrenceType.lunarMonthly, day: 15),
        DateTime(2026, 8, 1),
      );
      expect(result, isNotEmpty);
      for (final date in result) {
        expect(date.year, 2026);
        expect(date.month, 8);
        expect(LunarConverter.solarToLunar(date).day, 15);
      }
    });

    test('returns an empty list for recurrence types with no monthly '
        'occurrence', () {
      final result = occurrencesInMonth(
        const RecurrenceParams(type: RecurrenceType.yearly, day: 1, month: 1),
        DateTime(2026, 8, 1),
      );
      expect(result, isEmpty);
    });
  });
}
