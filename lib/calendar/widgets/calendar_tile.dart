import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import 'package:calendar_view/shared/shared.dart';
import 'package:calendar_view/calendar/models/calendar_event.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback? onDateSelected;
  final DateTime? date;
  final String? dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final bool inMonth;
  final CalendarEvent? calendarEvent;
  final TextStyle? dayOfWeekStyle;
  final TextStyle? dateStyles;
  final Widget? child;
  final Color? selectedColor;
  final Color? todayColor;
  final Color? eventColor;
  final Color? eventDoneColor;
  final int? position;

  const CalendarTile({
    Key? key,
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyle,
    this.isDayOfWeek = false,
    this.isSelected = false,
    this.inMonth = true,
    this.calendarEvent,
    this.selectedColor,
    this.todayColor,
    this.eventColor,
    this.eventDoneColor,
    this.position,
  }) : super(key: key);

  Widget renderDateOrDayOfWeek(BuildContext context) {
    BorderRadius borderRadiusOfDay;

    const BorderRadius borderRadiusLeft = BorderRadius.only(
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
    );

    final BorderRadius borderRadiusNone = BorderRadius.zero;

    const BorderRadius borderRadiusRight = BorderRadius.only(
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10),
    );

    if (position == 0) {
      borderRadiusOfDay = borderRadiusLeft;
    } else if (position == 6) {
      borderRadiusOfDay = borderRadiusRight;
    } else {
      borderRadiusOfDay = borderRadiusNone;
    }

    BoxDecoration boxDecorationOfDay;
    Color colorOfDay;

    if (calendarEvent?.startTime == date && isSelected) {
      boxDecorationOfDay = BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      );
      colorOfDay = Colors.white;
    } else if (calendarEvent?.startTime == date) {
      boxDecorationOfDay = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      );
      colorOfDay = AppColors.black;
    } else if (isSelected) {
      boxDecorationOfDay = BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Theme.of(context).primaryColor,
      );
      colorOfDay = Colors.white;
    } else {
      boxDecorationOfDay = const BoxDecoration();
      colorOfDay = AppColors.black;
    }

    if (isDayOfWeek) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.2),
          borderRadius: borderRadiusOfDay,
        ),
        child: Text(
          dayOfWeek ?? '',
          style: const TextStyle(
            color: AppColors.greyDark,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onDateSelected,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: boxDecorationOfDay,
            alignment: Alignment.center,
            child: Text(
              date != null ? DateFormat('d').format(date!) : '',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Utils.isSameDay(date!, DateTime.now())
                    ? todayColor
                    : inMonth
                        ? colorOfDay
                        : Colors.grey,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return GestureDetector(
        child: child,
        onTap: onDateSelected,
      );
    }

    return Container(child: renderDateOrDayOfWeek(context));
  }
}
