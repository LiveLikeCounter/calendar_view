import 'package:calendar_view/calendar/models/calendar_event.dart';

final Map<DateTime, List<CalendarEvent>> calendarEvents = {
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
    CalendarEvent(
      summary: 'Flutter Stockholm',
      startTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        0,
        0,
      ),
      endTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        0,
        0,
      ),
    ),
  ],
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2): [
    CalendarEvent(
      summary: 'Flutter Amsterdam',
      startTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 2,
        0,
        0,
      ),
      endTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 2,
        0,
        0,
      ),
    ),
  ],
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 8): [
    CalendarEvent(
      summary: 'Flutter New York',
      startTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 8,
        0,
        0,
      ),
      endTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 8,
        0,
        0,
      ),
    ),
  ],
};
