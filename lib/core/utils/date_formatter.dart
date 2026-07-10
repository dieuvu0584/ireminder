import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date, String locale) {
    return DateFormat.yMMMd(locale).format(date);
  }

  static String formatDateTime(DateTime date, String locale) {
    return DateFormat.yMMMd(locale).add_Hm().format(date);
  }

  static String formatTime(String hhmm, String locale) {
    final parts = hhmm.split(':');
    final dt = DateTime(2000, 1, 1, int.parse(parts[0]), int.parse(parts[1]));
    return DateFormat.Hm(locale).format(dt);
  }

  static String formatCurrency(double amount, String locale) {
    // No currency picker in Settings (not in scope), so fall back to each
    // locale's own default currency via CLDR data rather than assuming USD.
    return NumberFormat.currency(locale: locale).format(amount);
  }
}
