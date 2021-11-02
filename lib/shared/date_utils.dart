import 'package:intl/intl.dart';

class Utils {
  static final DateFormat _yearFormat = DateFormat('yyyy');
  static final DateFormat _monthFormat = DateFormat('MMMM');
  static final DateFormat _dayFormat = DateFormat('dd');
  static final DateFormat _firstDayFormat = DateFormat('MMM dd');
  static final DateFormat _fullDayFormat = DateFormat('EEE MMM dd, yyyy');
  static final DateFormat _apiDayFormat = DateFormat('yyyy-MM-dd');

  static String formatYear(DateTime d) => _yearFormat.format(d);

  static String formatMonth(DateTime d) => _monthFormat.format(d);

  static String formatDay(DateTime d) => _dayFormat.format(d);

  static String formatFirstDay(DateTime d) => _firstDayFormat.format(d);

  static String fullDayFormat(DateTime d) => _fullDayFormat.format(d);

  static String apiDayFormat(DateTime d) => _apiDayFormat.format(d);

  static const List<String> weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  static List<DateTime> daysInMonth(DateTime month) {
    final DateTime first = firstDayOfMonth(month);
    final int daysBefore = first.weekday;
    final DateTime firstToDisplay = first.subtract(Duration(days: daysBefore));
    final DateTime last = Utils.lastDayOfMonth(month);
    int daysAfter = 7 - last.weekday;

    if (daysAfter == 0) daysAfter = 7;

    final DateTime lastToDisplay = last.add(Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  static bool isFirstDayOfMonth(DateTime day) {
    return isSameDay(firstDayOfMonth(day), day);
  }

  static bool isLastDayOfMonth(DateTime day) {
    return isSameDay(lastDayOfMonth(day), day);
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  static DateTime firstDayOfWeek(DateTime day) {
    day = DateTime.utc(day.year, day.month, day.day, 12);

    final int decreaseNum = day.weekday % 7;
    return day.subtract(Duration(days: decreaseNum));
  }

  static DateTime lastDayOfWeek(DateTime day) {
    day = DateTime.utc(day.year, day.month, day.day, 12);

    final int increaseNum = day.weekday % 7;
    return day.add(Duration(days: 7 - increaseNum));
  }

  static DateTime lastDayOfMonth(DateTime month) {
    final beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    DateTime i = start;
    Duration offset = start.timeZoneOffset;

    while (i.isBefore(end)) {
      yield i;
      i = i.add(const Duration(days: 1));
      final Duration timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(
          Duration(seconds: timeZoneDiff.inSeconds),
        );
      }
    }
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isSameWeek(DateTime a, DateTime b) {
    a = DateTime.utc(a.year, a.month, a.day);
    b = DateTime.utc(b.year, b.month, b.day);

    final int diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) return false;

    final DateTime min = a.isBefore(b) ? a : b;
    final DateTime max = a.isBefore(b) ? b : a;
    final bool result = max.weekday % 7 - min.weekday % 7 >= 0;
    return result;
  }

  static DateTime previousMonth(DateTime m) {
    int year = m.year;
    int month = m.month;

    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month);
  }

  static DateTime nextMonth(DateTime m) {
    int year = m.year;
    int month = m.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month);
  }

  static DateTime previousWeek(DateTime w) {
    return w.subtract(const Duration(days: 7));
  }

  static DateTime nextWeek(DateTime w) {
    return w.add(const Duration(days: 7));
  }
}
