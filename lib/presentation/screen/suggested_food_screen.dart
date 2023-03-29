import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class SuggestedFoodScreen extends StatefulWidget {
  const SuggestedFoodScreen({Key? key}) : super(key: key);

  @override
  State<SuggestedFoodScreen> createState() => _SuggestedFoodScreenState();
}

class _SuggestedFoodScreenState extends State<SuggestedFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        // leadingWidget: Icon(Icons.menu_rounded),
        trailingWidget: Icon(Icons.more_vert),
        title: 'Suggested Food',
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TableCalendar(
                    weekNumbersVisible: true,
                    headerVisible: false,
                    daysOfWeekVisible: false,
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    calendarFormat: CalendarFormat.week,
                    calendarBuilders: CalendarBuilders(
                        todayBuilder: (context, day, focusedDay) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      day.day.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.pinkAccent,
                                      shape: BoxShape.circle)),
                            ),
                        defaultBuilder: (context, day, focusedDay) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      day.day.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.circle)),
                            ))),
                Container(
                  height: 40.h,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFCDD2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 10.w,
                            height: 10.w,
                            child: SvgPicture.asset(
                              AssetsHelper.seedSvg,
                              color: Colors.pink,
                            ),
                          ),
                          title: Text('Spinach'),
                          subtitle: Text('One serving per week'),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
