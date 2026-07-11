import 'package:lunar/lunar.dart';

/// Thin wrapper around the `lunar` package for solar <-> lunar conversion.
class LunarConverter {
  static DateTime lunarToSolar(int lunarYear, int lunarMonth, int lunarDay) {
    final lunar = Lunar.fromYmd(lunarYear, lunarMonth, lunarDay);
    final solar = lunar.getSolar();
    return DateTime(solar.getYear(), solar.getMonth(), solar.getDay());
  }

  static ({int year, int month, int day}) solarToLunar(DateTime solarDate) {
    final lunar = Lunar.fromDate(
      DateTime(solarDate.year, solarDate.month, solarDate.day),
    );
    return (
      year: lunar.getYear(),
      month: lunar.getMonth(),
      day: lunar.getDay(),
    );
  }

  /// "day/month" for the lunar date corresponding to [solarDate] — the
  /// compact form shown next to a lunar-recurring reminder so its solar
  /// due date (which shifts every year) doesn't obscure the fixed lunar
  /// occasion it actually represents.
  static String formatDayMonth(DateTime solarDate) {
    final lunar = solarToLunar(solarDate);
    return '${lunar.day}/${lunar.month}';
  }
}
