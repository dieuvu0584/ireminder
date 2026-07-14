import '../../domain/enums/recurrence_type.dart';
import '../localization/gen/app_localizations.dart';

/// Localized display label for a reminder's actual stored recurrence type
/// — unlike the reminder form's own dropdown label (which folds
/// lunarMonthly into "Monthly" since the dropdown never offers it as a
/// separate option), this always reflects what's really scheduled, so
/// list/detail views can show e.g. "Monthly (lunar calendar)" as-is.
String recurrenceTypeLabel(AppLocalizations l10n, RecurrenceType type) {
  switch (type) {
    case RecurrenceType.none:
      return l10n.recurrenceNone;
    case RecurrenceType.daily:
      return l10n.recurrenceDaily;
    case RecurrenceType.weekly:
      return l10n.recurrenceWeekly;
    case RecurrenceType.monthly:
      return l10n.recurrenceMonthly;
    case RecurrenceType.yearly:
      return l10n.recurrenceYearly;
    case RecurrenceType.customIntervalDays:
      return l10n.recurrenceCustomIntervalDays;
    case RecurrenceType.lunarYearly:
      return l10n.recurrenceLunarYearly;
    case RecurrenceType.lunarMonthly:
      return l10n.recurrenceLunarMonthly;
  }
}
