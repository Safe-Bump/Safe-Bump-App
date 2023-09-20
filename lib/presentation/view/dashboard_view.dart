import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

import '../screen/pregnancy_detail_screen.dart';


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
    var selectedIndex = 0;
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
          final user = FirebaseAuth.instance.currentUser;
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification? notification){
              notification!.disallowIndicator();
              return true;
            },
            child: Scaffold(
              drawer: NavigationDrawer(
                backgroundColor: Colors.grey.shade50,
                selectedIndex: selectedIndex,
                children: [
                  const DrawerHeader(
                      child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.dashboard_outlined),
                      title: const Text("Dashboard"),
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
                      leading: const Icon(Icons.calendar_today_outlined),
                      title: const Text("Calendar"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.view_timeline_outlined),
                      title: const Text("Timeline"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  user == null?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.person_outline_rounded),
                      title: const Text("Login"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context, NavigationRoutes.login
                        );
                      },
                    ),
                  ):
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.person_outline_rounded),
                      title: const Text("Profile"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      
                    ),
                  ),
                  user == null?
                  const SizedBox.shrink():
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.person_outline_rounded),
                      title: const Text("Logout"),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        
                      },
                    ),
                  )
                ],
              ),
              appBar: SafeBumpAppBar(
                trailingWidget: user != null ? 
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                    .collection("User")
                    .doc(user.uid)
                    .snapshots(),
                  builder: (context, snapshot){
                    if (snapshot.hasError) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var userData = snapshot.data!.data() as Map<String, dynamic>;
                    return CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userData['photoUrl']),
                    );
                  }
                )
                : const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
                title: "Home",
              ),
              body: Consumer<DashboardViewModel>(
                builder: (context, dashboardViewModel, child) => LayoutBuilder(
                  builder: (context, constraints) => Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          user == null?
                          const SizedBox.shrink():
                          Text(
                            "Hi ${dashboardViewModel.user?.name}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          user == null ?
                          ListTile(
                            leading: const Icon(Icons.person_outline_rounded),
                            title: const Text("Login"),
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context, NavigationRoutes.login
                              );
                            },
                          ):
                          dashboardViewModel.pregnancyDetails == null?
                          SizedBox(
                            width: constraints.maxWidth,
                            height: 12.h,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context, 
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  isScrollControlled: true,
                                  shape:const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                  ),
                                  builder: (BuildContext context){
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).viewInsets.bottom),
                                      child: const PregnancyDetailScreen(),
                                    );
                                  }
                                );
                              },
                              child: Card(
                                color: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add Pregnancy Details!!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.arrow_circle_right,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ):
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                "${((DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).difference(DateTime.fromMillisecondsSinceEpoch((dashboardViewModel.pregnancyDetails?.startingDay) == null ? 1 : (dashboardViewModel.pregnancyDetails?.startingDay)!)).inDays) ~/ 7) + 1} Week of Pregnancy",
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TableCalendar(
                                focusedDay: date,
                                firstDay:
                                    date.subtract(Duration(days: date.weekday - 1)),
                                lastDay: date.add(Duration(
                                    days: DateTime.daysPerWeek - date.weekday)),
                                calendarFormat: CalendarFormat.week,
                                headerVisible: false,
                                daysOfWeekVisible: false,
                                rowHeight: 80,
                                calendarBuilders: CalendarBuilders(
                                    defaultBuilder: (context, day, focusedDay) =>
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3.0, horizontal: 1),
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              height: 40.h,
                                              width: 20.w,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                              )),
                                        ),
                                    todayBuilder: (context, day, focusedDay) =>
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(vertical: 10),
                                              height: 40.h,
                                              width: 20.w,
                                              decoration: const BoxDecoration(
                                                  color: Colors.pinkAccent,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    DateFormat('EEE').format(day),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                            color: Colors.white),
                                                  ),
                                                  Text(
                                                    day.day.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                            color: Colors.white),
                                                  ),
                                                ],
                                              )),
                                        )),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                padding: const EdgeInsets.all(25),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(15),
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red.shade100,
                                            ),
                                            child: SvgPicture.asset(
                                                AssetsHelper.maternalImage)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "Baby is size of pear",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Baby Height",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(color: Colors.grey),
                                            ),
                                            Text(
                                                "${(dashboardViewModel
                                                        .pregnancyDetails?.babyHeight)
                                                    .toString()} ft",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge)
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Baby Weight",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(color: Colors.grey),
                                            ),
                                            Text(
                                                "${(dashboardViewModel
                                                        .pregnancyDetails?.babyWeight)
                                                    .toString()} kg",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge)
                                          ],
                                        ),
                                        // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Text(
                                        //       "Baby Height",
                                        //       style: Theme.of(context)
                                        //           .textTheme
                                        //           .bodyMedium
                                        //           ?.copyWith(color: Colors.grey),
                                        //     ),
                                        //     Text("17 cm",
                                        //         style: Theme.of(context)
                                        //             .textTheme
                                        //             .bodyLarge)
                                        //   ],
                                        // )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          GridView(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, NavigationRoutes.predictor);
                                },
                                child: const DashboardCard(
                                  icon: Icons.medical_information,
                                  name: "Prediction",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, NavigationRoutes.map);
                                },
                                child: const DashboardCard(
                                  icon: Icons.local_hospital,
                                  name: "Hospitals",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, NavigationRoutes.exercise);
                                },
                                child: const DashboardCard(
                                  icon: Icons.fitness_center,
                                  name: "Exercises",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, NavigationRoutes.articleList);
                                },
                                child: const DashboardCard(
                                  icon: Icons.article,
                                  name: "Articles",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, NavigationRoutes.video_list);
                                },
                                child: const DashboardCard(
                                  icon: Icons.video_collection,
                                  name: "Videos",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, NavigationRoutes.food);
                                },
                                child: const DashboardCard(
                                  icon: Icons.food_bank,
                                  name: "Food",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
      }
    );
  }
}

String getDayOfMonthSuffix(int dayNum) {
  if(!(dayNum >= 1 && dayNum <= 31)) {
    throw Exception('Invalid day of month');
  }

  if(dayNum >= 11 && dayNum <= 13) {
    return 'th';
  }

  switch(dayNum % 10) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}
