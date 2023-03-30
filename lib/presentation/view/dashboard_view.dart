import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/navigation/router.dart';
import 'package:safe_bump/presentation/viewmodel/dashboard_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/dashboard_card.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../domain/entities/user_model.dart';
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
    final dashBoardViewModel =
        Provider.of<DashboardViewModel>(context, listen: false);
    dashBoardViewModel.getUserDetail();
    dashBoardViewModel.getPregnancyDetails();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    var selectedIndex = 0;
    return Scaffold(
      drawer: NavigationDrawer(
        backgroundColor: Colors.grey.shade50,
        selectedIndex: selectedIndex,
        children: [
          DrawerHeader(
              child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage("https://picsum.photos/200"),
          )),
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
        trailingWidget: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              user != null ? user.photoURL! : "https://picsum.photos/200"),
        ),
        title: "Home",
      ),
      body: Consumer<DashboardViewModel>(
        builder: (context, dashboardViewModel, child) => LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi " +
                        (dashboardViewModel.user?.name != null
                            ? (dashboardViewModel.user?.name)!
                            : "User"),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "${((DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).difference(DateTime.fromMillisecondsSinceEpoch((dashboardViewModel.pregnancyDetails?.startingDay) == null ? 1 : (dashboardViewModel.pregnancyDetails?.startingDay)! * (24 * 60 * 60 * 1000))).inDays) ~/ 7) + 1}st Week of Pregnancy",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TableCalendar(
                    focusedDay: date,
                    firstDay: date.subtract(Duration(days: date.weekday - 1)),
                    lastDay: date.add(
                        Duration(days: DateTime.daysPerWeek - date.weekday)),
                    calendarFormat: CalendarFormat.week,
                    headerVisible: false,
                    daysOfWeekVisible: false,

                    rowHeight: 80,
                    calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                        todayBuilder: (context, day, focusedDay) => Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
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
                                child: SvgPicture.asset(
                                    AssetsHelper.maternalImage),
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
                                Text(
                                    (dashboardViewModel
                                            .pregnancyDetails?.babyHeight)
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Baby Weight",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.grey),
                                ),
                                Text(
                                    (dashboardViewModel
                                            .pregnancyDetails?.babyWeight)
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)
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
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)
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
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, NavigationRoutes.predictor);
                          },
                          child: DashboardCard(
                            icon: Icons.medical_information,
                            name: "Medicine",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, NavigationRoutes.map);
                          },
                          child: DashboardCard(
                            icon: Icons.local_hospital,
                            name: "Hospitals",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, NavigationRoutes.exercise);
                          },
                          child: DashboardCard(
                            icon: Icons.fitness_center,
                            name: "Exercises",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, NavigationRoutes.articleList);
                          },
                          child: DashboardCard(
                            icon: Icons.article,
                            name: "Articles",
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, NavigationRoutes.video_list);
                          },
                          child: DashboardCard(
                            icon: Icons.video_collection,
                            name: "Videos",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, NavigationRoutes.food);
                          },
                          child: DashboardCard(
                            icon: Icons.food_bank,
                            name: "Food",
                          ),
                        )
                      ],
                    ),
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
