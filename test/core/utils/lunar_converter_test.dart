import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/lunar_converter.dart';

void main() {
  test('formatDayMonth matches solarToLunar for the same date', () {
    final solarDate = DateTime(2026, 7, 11);
    final lunar = LunarConverter.solarToLunar(solarDate);

    expect(
      LunarConverter.formatDayMonth(solarDate),
      '${lunar.day}/${lunar.month}',
    );
  });

  test('lunarToSolar and solarToLunar round-trip', () {
    final solarDate = LunarConverter.lunarToSolar(2026, 6, 16);
    final backToLunar = LunarConverter.solarToLunar(solarDate);

    expect(backToLunar.year, 2026);
    expect(backToLunar.month, 6);
    expect(backToLunar.day, 16);
  });
}
