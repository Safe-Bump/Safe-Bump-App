import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/calendar_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/safe_bump_app_bar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  void initState() {
    super.initState();
    var calendarViewModel =
        Provider.of<CalendarViewModel>(context, listen: false);
    calendarViewModel.onSelectedDateChanged(DateTime.now());
    calendarViewModel.getCalendarNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarViewModel>(
      builder: (context, calendarViewModel, child) => calendarViewModel
              .isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              drawer: NavigationDrawer(
                backgroundColor: Colors.grey.shade50,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.dashboard_outlined),
                      title: Text("Dashboard"),
                      tileColor: Colors.white,
                      selectedTileColor: Colors.pinkAccent,
                      selectedColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.calendar_today_outlined),
                      title: Text("Calendar"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.view_timeline_outlined),
                      title: Text("Timeline"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.person_outline_rounded),
                      title: Text("Profile"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
              appBar: SafeBumpAppBar(
                // leadingWidget: Icon(Icons.menu_rounded),
                trailingWidget: IconButton(
                    onPressed: () {
                      final TextEditingController _notesController =
                          TextEditingController();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              icon: Icon(Icons.note),
                              iconColor: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: const Text('Add Notes'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                        "Selected Date: ${DateFormat('yyyy-MM-dd').format(calendarViewModel.selectedDate!)}"),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    CustomTextField(
                                        controller: _notesController,
                                        hint: "Enter Notes"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    calendarViewModel
                                        .addNotes(_notesController.text);
                                    _notesController.clear();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.add)),
                title: "Calendar",
              ),
              body: LayoutBuilder(
                builder: (context, constraints) => Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: SingleChildScrollView(
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
                                      ?.copyWith(color: Colors.pinkAccent)
                                  as TextStyle,
                              leftChevronIcon: Container(
                                  decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide(
                                          width: 3, color: Colors.grey)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.arrow_back)),
                              rightChevronIcon: Container(
                                  decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(width: 3, color: Colors.grey)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.arrow_forward))),
                          focusedDay: calendarViewModel.focusedDate == null
                              ? DateTime.now()
                              : calendarViewModel.focusedDate!,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          currentDay: calendarViewModel.selectedDate,
                          calendarStyle: CalendarStyle(
                              todayDecoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  shape: BoxShape.circle)),
                          onDaySelected: (selectedDay, focusedDay) {
                            calendarViewModel
                                .onSelectedDateChanged(selectedDay);
                            calendarViewModel.onFocusedDateChanged(focusedDay);
                            calendarViewModel.getCalendarNotes();
                          },
                        ),
                        Container(
                          width: constraints.maxWidth,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Notes Created",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                                child: ListView.builder(
                                  itemBuilder: (context, index) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.pinkAccent,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(calendarViewModel
                                              .notesList![index]),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            calendarViewModel
                                                .deleteNotes(index);
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_rounded,
                                            color: Colors.black,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                  itemCount:
                                      calendarViewModel.notesList?.length,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
