import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Groups a plain-integer amount field with locale-aware thousands
/// separators as the user types (e.g. 13000000 -> 13.000.000 for vi/de,
/// 13,000,000 for en). Loan amounts are whole currency units in practice
/// (particularly VND, this app's primary market), so this intentionally
/// doesn't support decimal input — keeping the grouping unambiguous
/// without having to disambiguate "." as a thousands vs. decimal separator
/// per locale.
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final String locale;

  ThousandsSeparatorInputFormatter(this.locale);

  static final _nonDigits = RegExp(r'[^0-9]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(_nonDigits, '');
    if (digits.isEmpty) {
      return const TextEditingValue(text: '');
    }
    final formatted = NumberFormat.decimalPattern(
      locale,
    ).format(int.parse(digits));
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Strips locale-formatted grouping back out to a plain digit string
/// parseable by [int.tryParse]/[double.tryParse].
String unformatAmount(String text) => text.replaceAll(RegExp(r'[^0-9]'), '');

/// Short currency symbol for the given locale (e.g. "₫", "$", "€"), for use
/// as a field suffix/prefix next to an amount input.
String currencySymbolFor(String locale) =>
    NumberFormat.simpleCurrency(locale: locale).currencySymbol;
