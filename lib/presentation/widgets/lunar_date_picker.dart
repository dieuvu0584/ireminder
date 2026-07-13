import 'package:flutter/material.dart';

import 'month_calendar_grid.dart';

/// A month-grid date picker matching the Calendar tab's look (solar day
/// numbers with each day's lunar day/month shown underneath), used
/// wherever picking a date needs the lunar day visible at a glance — the
/// reminder form's lunar-yearly date field, for one, where the native
/// [showDatePicker] would show a bare Gregorian grid with no lunar
/// annotation, forcing the user to already know the lunar day/month to
/// pick the right one.
Future<DateTime?> showLunarDatePicker({
  required BuildContext context,
  required DateTime initialDate,
}) {
  return showDialog<DateTime>(
    context: context,
    builder: (context) => _LunarDatePickerDialog(initialDate: initialDate),
  );
}

class _LunarDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;

  const _LunarDatePickerDialog({required this.initialDate});

  @override
  State<_LunarDatePickerDialog> createState() => _LunarDatePickerDialogState();
}

class _LunarDatePickerDialogState extends State<_LunarDatePickerDialog> {
  late DateTime _visibleMonth;

  @override
  void initState() {
    super.initState();
    _visibleMonth = DateTime(widget.initialDate.year, widget.initialDate.month);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SizedBox(
          width: 340,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MonthCalendarHeader(
                month: _visibleMonth,
                onPrev: () => setState(() {
                  _visibleMonth = DateTime(
                    _visibleMonth.year,
                    _visibleMonth.month - 1,
                  );
                }),
                onNext: () => setState(() {
                  _visibleMonth = DateTime(
                    _visibleMonth.year,
                    _visibleMonth.month + 1,
                  );
                }),
              ),
              const WeekdayHeader(),
              MonthCalendarGrid(
                month: _visibleMonth,
                selectedDay: widget.initialDate,
                // A tap picks and closes in one step, same as the Calendar
                // tab's own day grid — no separate OK step needed since
                // there's nothing else to configure in this dialog.
                onSelectDay: (day) => Navigator.of(context).pop(day),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, right: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      MaterialLocalizations.of(context).cancelButtonLabel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
