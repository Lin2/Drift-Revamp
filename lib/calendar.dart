import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _calendarController;

  static const Color textColor = Color(0xFFFFFFFF);
  static const Color subColor = Color(0xBBBBBBBB);

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.2,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: textColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: _buildTableCalendar(),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      calendarStyle: CalendarStyle(
        weekdayStyle: TextStyle().copyWith(color: textColor),
        weekendStyle: TextStyle().copyWith(color: textColor),
        outsideWeekendStyle: TextStyle().copyWith(color: subColor),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: textColor, fontSize: 12),
        formatButtonDecoration: BoxDecoration(
          border: Border.all(
            color: textColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        titleTextStyle: TextStyle().copyWith(color: textColor),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle().copyWith(color: textColor),
        weekendStyle: TextStyle().copyWith(color: textColor),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Toggle',
        CalendarFormat.week: 'Toggle',
      },
      onDaySelected: _onDaySelected,
    );
  }
}
