import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:calendar_view/shared/shared.dart';

import 'calendar_tile.dart';

typedef DayBuilder(BuildContext context, DateTime day);

class Calendar extends StatefulWidget {
  const Calendar({
    this.onDateSelected,
    Key? key,
  }) : super(key: key);

  final ValueChanged<DateTime>? onDateSelected;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late List<DateTime> selectedMonthsDays;
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  @override
  void initState() {
    super.initState();
    selectedMonthsDays = _daysInMonth(_selectedDate);
  }

  List<DateTime> _daysInMonth(DateTime month) {
    final DateTime first = Utils.firstDayOfMonth(month);
    final int daysBefore = first.weekday;
    final DateTime firstToDisplay = first.subtract(Duration(days: daysBefore));
    final DateTime last = Utils.lastDayOfMonth(month);
    int daysAfter = 7 - last.weekday;

    if (daysAfter == 0) daysAfter = 7;

    final lastToDisplay = last.add(Duration(days: daysAfter));
    return Utils.daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  TextStyle? configureDateStyle(monthStarted, monthEnded) {
    TextStyle? dateStyles;
    final TextStyle? body1Style = Theme.of(context).textTheme.bodyText2;

    final TextStyle body1StyleDisabled = body1Style!.copyWith(
      color: Color.fromARGB(
        100,
        body1Style.color!.red,
        body1Style.color!.green,
        body1Style.color!.blue,
      ),
    );

    dateStyles = monthStarted && !monthEnded ? body1Style : body1StyleDisabled;
    return dateStyles;
  }

  _firstDayOfWeek(DateTime date) {
    final DateTime day = DateTime.utc(
        _selectedDate.year, _selectedDate.month, _selectedDate.day, 12);
    return day.weekday == 7 ? day : day.subtract(Duration(days: day.weekday));
  }

  _lastDayOfWeek(DateTime date) {
    return _firstDayOfWeek(date).add(const Duration(days: 7));
  }

  void handleSelectedDateAndUserCallback(DateTime day) {
    var firstDayOfCurrentWeek = _firstDayOfWeek(day);
    var lastDayOfCurrentWeek = _lastDayOfWeek(day);

    // Check if the selected day falls into the next month. If this is the case,
    // then we need to additionaly check, if a day in next year was selected.
    // if (_selectedDate.month > day.month) {
    //   // Day in next year selected? Switch to next month.
    //   if (_selectedDate.year < day.year) {
    //     nextMonth();
    //   } else {
    //     previousMonth();
    //   }
    // }

    // Check if the selected day falls into the last month. If this is the case,
    // then we need to additionaly check, if a day in last year was selected.
    // if (_selectedDate.month < day.month) {
    //   // Day in next last selected? Switch to next month.
    //   if (_selectedDate.year > day.year) {
    //     previousMonth();
    //   } else {
    //     nextMonth();
    //   }
    // }

    setState(() {
      _selectedDate = day;
      selectedMonthsDays = _daysInMonth(day);
      // _selectedEvents = widget.events?[_selectedDate] ?? [];
    });

    if (widget.onDateSelected != null) {
      widget.onDateSelected!(day);
    }
  }

  List<Widget> calendarBuilder() {
    List<Widget> dayWidgets = [];
    List<DateTime> selectedMonthsDays = _daysInMonth(_selectedDate);

    Utils.weekdays.forEachIndexed((index, day) {
      dayWidgets.add(
        CalendarTile(
          isDayOfWeek: true,
          dayOfWeek: day,
          position: index,
        ),
      );
    });

    bool monthStarted = false;
    bool monthEnded = false;

    for (DateTime day in selectedMonthsDays) {
      if (day.hour > 0) {
        day = day.toLocal();
        day = day.subtract(Duration(hours: day.hour));
      }

      if (monthStarted && day.day == 01) monthEnded = true;

      if (Utils.isFirstDayOfMonth(day)) monthStarted = true;

      dayWidgets.add(
        CalendarTile(
          todayColor: AppColors.primaryDark,
          eventColor: AppColors.primary,
          // events: events![day],
          onDateSelected: () => handleSelectedDateAndUserCallback(day),
          date: day,
          dateStyles: configureDateStyle(monthStarted, monthEnded),
          isSelected: Utils.isSameDay(selectedDate, day),
          inMonth: day.month == selectedDate.month,
        ),
      );
    }
    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            '${Utils.formatMonth(DateTime.now())} ${Utils.formatYear(DateTime.now())}',
            style: TextStyle(
              color: Theme.of(context).textTheme.headline1?.color,
              fontSize: Theme.of(context).textTheme.headline1?.fontSize,
              fontWeight: Theme.of(context).textTheme.headline1?.fontWeight,
            ),
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          childAspectRatio: 1.5,
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 7,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(0),
          children: calendarBuilder(),
        ),
      ],
    );
  }
}
