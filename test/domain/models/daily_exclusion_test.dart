import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/domain/models/daily_exclusion.dart';

void main() {
  group('parseDaysCompact', () {
    test('parses a mix of single days and ranges', () {
      final result = DailyExclusion.parseDaysCompact('1,2,3,6-9,15');
      expect(result, {1, 2, 3, 6, 7, 8, 9, 15});
    });

    test('parses a single day', () {
      expect(DailyExclusion.parseDaysCompact('15'), {15});
    });

    test('parses a single range', () {
      expect(DailyExclusion.parseDaysCompact('5-7'), {5, 6, 7});
    });

    test('tolerates surrounding whitespace', () {
      expect(DailyExclusion.parseDaysCompact(' 1 , 3 , 5 - 7 '), {
        1,
        3,
        5,
        6,
        7,
      });
    });

    test('throws on empty input', () {
      expect(
        () => DailyExclusion.parseDaysCompact(''),
        throwsA(isA<InvalidDaysCompactFormat>()),
      );
    });

    test('throws on a day out of 1-31 range', () {
      expect(
        () => DailyExclusion.parseDaysCompact('32'),
        throwsA(isA<InvalidDaysCompactFormat>()),
      );
      expect(
        () => DailyExclusion.parseDaysCompact('0'),
        throwsA(isA<InvalidDaysCompactFormat>()),
      );
    });

    test('throws on a backwards range', () {
      expect(
        () => DailyExclusion.parseDaysCompact('9-6'),
        throwsA(isA<InvalidDaysCompactFormat>()),
      );
    });

    test('throws on non-numeric input', () {
      expect(
        () => DailyExclusion.parseDaysCompact('abc'),
        throwsA(isA<InvalidDaysCompactFormat>()),
      );
    });

    test('throws on a dangling comma', () {
      expect(
        () => DailyExclusion.parseDaysCompact('1,,3'),
        throwsA(isA<InvalidDaysCompactFormat>()),
      );
    });
  });

  group('formatDaysCompact', () {
    test('collapses consecutive runs into ranges, sorted ascending', () {
      final result = DailyExclusion.formatDaysCompact({
        15,
        3,
        1,
        2,
        9,
        6,
        8,
        7,
      });
      expect(result, '1-3,6-9,15');
    });

    test('round-trips through parseDaysCompact', () {
      const input = {1, 2, 3, 6, 7, 8, 9, 15};
      final compact = DailyExclusion.formatDaysCompact(input);
      expect(DailyExclusion.parseDaysCompact(compact), input);
    });
  });

  group('DailyExclusion.specificDay.excludes', () {
    test('excludes any day in the parsed set', () {
      final exclusion = DailyExclusion.specificDay(
        DailyExclusion.parseDaysCompact('1,2,3,6-9,15'),
      );
      expect(exclusion.excludes(DateTime(2026, 7, 7)), isTrue);
      expect(exclusion.excludes(DateTime(2026, 7, 15)), isTrue);
      expect(exclusion.excludes(DateTime(2026, 7, 10)), isFalse);
    });
  });
}
