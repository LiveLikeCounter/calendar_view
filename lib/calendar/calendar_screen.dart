import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import 'package:calendar_view/calendar/widgets/calendar.dart';
import 'package:calendar_view/calendar/widgets/text_card.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenRatio.setScreenRatio(MediaQuery.of(context));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: ScreenRatio.absoluteWidth,
          height: ScreenRatio.absoluteHeight,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TextCard(),
              SizedBox(height: 30),
              Calendar(),
            ],
          ),
        ),
      ),
    );
  }
}
