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
  final List<CalendarEvent>? events;
  final TextStyle? dayOfWeekStyle;
  final TextStyle? dateStyles;
  final Widget? child;
  final Color? selectedColor;
  final Color? todayColor;
  final Color? eventColor;
  final Color? eventDoneColor;
  final int? position;

  const CalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyle,
    this.isDayOfWeek = false,
    this.isSelected = false,
    this.inMonth = true,
    this.events,
    this.selectedColor,
    this.todayColor,
    this.eventColor,
    this.eventDoneColor,
    this.position,
  });

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
      // int eventCount = 0;

      return GestureDetector(
        onTap: onDateSelected,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: isSelected && date != null
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedColor != null
                        ? Utils.isSameDay(date!, DateTime.now())
                            ? Colors.red
                            : selectedColor
                        : Theme.of(context).primaryColor,
                  )
                : const BoxDecoration(),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  date != null ? DateFormat("d").format(date!) : '',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: isSelected && date != null
                        ? Colors.white
                        : Utils.isSameDay(date!, DateTime.now())
                            ? todayColor
                            : inMonth
                                ? Colors.black
                                : Colors.grey,
                  ),
                ),
                // events != null && events!.isNotEmpty
                //     ? Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: events!.map(
                //           (event) {
                //             eventCount++;
                //             if (eventCount > 3) return Container();

                //             return Container(
                //               margin: const EdgeInsets.only(
                //                 left: 2.0,
                //                 right: 2.0,
                //                 top: 1.0,
                //               ),
                //               width: 5.0,
                //               height: 5.0,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: (() {
                //                   if (event.isDone) {
                //                     return eventDoneColor ??
                //                         Theme.of(context).primaryColor;
                //                   }
                //                   if (isSelected) return Colors.white;
                //                   return eventColor ??
                //                       Theme.of(context)
                //                           .textTheme
                //                           .bodyText1
                //                           ?.color;
                //                 }()),
                //               ),
                //             );
                //           },
                //         ).toList(),
                //       )
                //     : Container(),
              ],
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
