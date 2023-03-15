import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/safe_bump_app_bar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        trailingWidget: Icon(Icons.add),
        title: "Calendar",
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
                daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (day, dy) =>
                        DateFormat.E().format(day)[0]),
                headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonVisible: false,
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.pinkAccent) as TextStyle,
                    leftChevronIcon: Container(
                        decoration: BoxDecoration(
                            border: Border.fromBorderSide(
                                BorderSide(width: 3, color: Colors.grey)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.arrow_back)),
                    rightChevronIcon: Container(
                        decoration: BoxDecoration(
                            border: Border.fromBorderSide(
                                BorderSide(width: 3, color: Colors.grey)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.arrow_forward))),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: Colors.pinkAccent, shape: BoxShape.circle)),
              ),
              Container(
                width: constraints.maxWidth,
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notes Created",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
