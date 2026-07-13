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
  DateTime? firstDate,
  DateTime? lastDate,
}) {
  return showDialog<DateTime>(
    context: context,
    builder: (context) => _LunarDatePickerDialog(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ),
  );
}

class _LunarDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const _LunarDatePickerDialog({
    required this.initialDate,
    this.firstDate,
    this.lastDate,
  });

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

  bool get _canGoPrev {
    final first = widget.firstDate;
    if (first == null) return true;
    return _visibleMonth.isAfter(DateTime(first.year, first.month));
  }

  bool get _canGoNext {
    final last = widget.lastDate;
    if (last == null) return true;
    return _visibleMonth.isBefore(DateTime(last.year, last.month));
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
                onPrev: _canGoPrev
                    ? () => setState(() {
                        _visibleMonth = DateTime(
                          _visibleMonth.year,
                          _visibleMonth.month - 1,
                        );
                      })
                    : null,
                onNext: _canGoNext
                    ? () => setState(() {
                        _visibleMonth = DateTime(
                          _visibleMonth.year,
                          _visibleMonth.month + 1,
                        );
                      })
                    : null,
              ),
              const WeekdayHeader(),
              MonthCalendarGrid(
                month: _visibleMonth,
                selectedDay: widget.initialDate,
                firstSelectableDay: widget.firstDate,
                lastSelectableDay: widget.lastDate,
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
