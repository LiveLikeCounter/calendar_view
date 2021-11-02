import 'package:flutter/material.dart';

import 'package:calendar_view/calendar/calendar_screen.dart';

import 'shared/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: AppThemeData.defaultTheme,
      debugShowCheckedModeBanner: false,
      home: const CalendarScreen(),
    );
  }
}
