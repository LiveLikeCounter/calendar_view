import 'package:calendar_view/calendar/models/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'calendar_tile.dart';
import 'package:calendar_view/shared/shared.dart';
import 'package:calendar_view/calendar/data/calendar_events.dart';

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

  void handleSelectedDateAndUserCallback(DateTime day) {
    setState(() {
      _selectedDate = day;
      selectedMonthsDays = _daysInMonth(day);
    });

    if (widget.onDateSelected != null) widget.onDateSelected!(day);
  }

  List<Widget> calendarBuilder() {
    List<Widget> dayWidgets = [];
    List<DateTime> selectedMonthsDays = _daysInMonth(_selectedDate);
    CalendarEvent calendarEvent = CalendarEvent();

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

      if (calendarEvents[day]?.first != null) {
        calendarEvent = calendarEvents[day]?.first as CalendarEvent;
      } else {
        calendarEvent = CalendarEvent();
      }

      dayWidgets.add(
        CalendarTile(
          todayColor: AppColors.primaryDark,
          eventColor: AppColors.primary,
          calendarEvent: calendarEvent,
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
