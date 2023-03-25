import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/dashboard_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/dashboard_card.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../domain/entities/User.dart';
import '../viewmodel/auth_viewmodel.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    // final dashBoardViewModel =
    //     Provider.of<DashboardViewModel>(context, listen: false);

    // dashBoardViewModel.getUserDetail();
    // dashBoardViewModel.getPregnancyDetails();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    // var dashboardViewModel=Provider.of<DashboardViewModel>(context);
    return Scaffold(
      appBar: SafeBumpAppBar(
        trailingWidget: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              user != null ? user.photoURL! : "https://picsum.photos/200"),
        ),
        title: "Home",
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi " + (user != null ? user.displayName.toString() : "User"),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "${(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).difference(DateTime.fromMillisecondsSinceEpoch((1)! * (24 * 60 * 60 * 1000))).inDays)/7}th Week of Pregnancy",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 2.h,
              ),
              TableCalendar(
                focusedDay: date,
                firstDay: date.subtract(Duration(days: date.weekday - 1)),
                lastDay: date
                    .add(Duration(days: DateTime.daysPerWeek - date.weekday)),
                calendarFormat: CalendarFormat.week,
                headerVisible: false,
                daysOfWeekVisible: false,
                rowHeight: 80,
                calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          height: 40.h,
                          width: 20.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(DateFormat('EEE').format(day),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall),
                              Text(
                                day.day.toString(),
                                style:
                                Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)))),
                    ),
                    todayBuilder: (context, day, focusedDay) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          height: 40.h,
                          width: 20.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('EEE').format(day),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.white),
                              ),
                              Text(
                                day.day.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)))),
                    )),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(15),
                            width: 70,
                            height: 70,
                            child:
                            SvgPicture.asset(AssetsHelper.maternalImage),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade100,
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Baby is size of pear",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Baby Height",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                            Text("17 cm",
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Baby Height",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                            Text("17 cm",
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Baby Height",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                            Text("17 cm",
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              SizedBox(
                height: constraints.maxHeight * .8,
                child: GridView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    DashboardCard(),
                    DashboardCard(),
                    DashboardCard(),
                    DashboardCard(),
                    DashboardCard(),
                    DashboardCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
