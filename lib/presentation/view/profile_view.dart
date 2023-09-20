import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/navigation/router.dart';
import 'package:safe_bump/presentation/viewmodel/profile_viewmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/asset_helper.dart';
import '../screen/pregnancy_detail_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/safe_bump_app_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();

    var profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.getPregnancyDetails();  
  }

  static const List<Map<String, dynamic>> _articleData =
      AssetsHelper.articleData;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Consumer<ProfileViewModel>(
            builder: (context, profileViewModel, child) => Scaffold(
              appBar: SafeBumpAppBar(
                // leadingWidget: Icon(Icons.menu_rounded),
                title: profileViewModel.pregnancyDetails == null? "Profile" :
                    "Week: ${((DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).difference(DateTime.fromMillisecondsSinceEpoch(profileViewModel.pregnancyDetails?.startingDay == null ? 0 : ((profileViewModel.pregnancyDetails?.startingDay)!))).inDays) ~/ 7) + 1}",
              ),
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification? notification){
                  notification!.disallowIndicator();
                  return true;
                },
                child: LayoutBuilder(
                  builder: (context, constraints) => Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileViewModel.pregnancyDetails == null?
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
                          TableCalendar(
                              headerVisible: false,
                              daysOfWeekVisible: false,
                              focusedDay: profileViewModel.pregnancyDetails?.startingDay == null ? 
                                DateTime.fromMillisecondsSinceEpoch(0) : DateTime.now(),
                              firstDay: DateTime.fromMillisecondsSinceEpoch(
                                  profileViewModel.pregnancyDetails?.startingDay == null
                                      ? 0
                                      : (profileViewModel
                                          .pregnancyDetails?.startingDay)!),
                              lastDay: DateTime.fromMillisecondsSinceEpoch(
                                      profileViewModel.pregnancyDetails?.startingDay ==
                                              null
                                          ? 0
                                          : (profileViewModel
                                              .pregnancyDetails?.startingDay)!)
                                  .add(const Duration(days: 280)),
                              calendarFormat: CalendarFormat.week,
                              calendarBuilders: CalendarBuilders(
                                todayBuilder: (context, day, focusedDay) => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          color: Colors.pinkAccent,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          ((DateTime.fromMillisecondsSinceEpoch(
                                                      day.millisecondsSinceEpoch)
                                                  .difference(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          profileViewModel
                                                                      .pregnancyDetails
                                                                      ?.startingDay ==
                                                                  null
                                                              ? 0
                                                              : (profileViewModel
                                                                  .pregnancyDetails
                                                                  ?.startingDay)!))
                                                  .inDays))
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      )),
                                ),
                                defaultBuilder: (context, day, focusedDay) => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          (DateTime.fromMillisecondsSinceEpoch(
                                                      day.millisecondsSinceEpoch)
                                                  .difference(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          profileViewModel.pregnancyDetails?.startingDay == null ?
                                                          0 : (profileViewModel
                                                              .pregnancyDetails
                                                              ?.startingDay)!))
                                                  .inDays)
                                              .toString(),
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      )),
                                ),
                                outsideBuilder: (context, day, focusedDay) => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          (DateTime.fromMillisecondsSinceEpoch(
                                                      day.millisecondsSinceEpoch)
                                                  .difference(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          (profileViewModel
                                                                  .pregnancyDetails
                                                                  ?.startingDay)!))
                                                  .inDays)
                                              .toString(),
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      )),
                                ),
                              )), 
                          profileViewModel.pregnancyDetails == null? const SizedBox.shrink() : SizedBox(
                            height: 3.h,
                          ),
                          profileViewModel.pregnancyDetails == null? const SizedBox.shrink() : 
                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(15),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red.shade100,
                                    ),
                                    child: SvgPicture.asset(AssetsHelper.maternalImage)),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Baby Weight",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              (profileViewModel
                                                      .pregnancyDetails?.babyWeight)
                                                  .toString(),
                                              style:
                                                  Theme.of(context).textTheme.bodyLarge,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Days Left(approx.)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              (280 -
                                                      (DateTime.fromMillisecondsSinceEpoch(
                                                              DateTime.now()
                                                                  .millisecondsSinceEpoch)
                                                          .difference(DateTime
                                                              .fromMillisecondsSinceEpoch(
                                                                  profileViewModel
                                                                              .pregnancyDetails
                                                                              ?.startingDay ==
                                                                          null
                                                                      ? 0
                                                                      : (profileViewModel
                                                                          .pregnancyDetails
                                                                          ?.startingDay)!))
                                                          .inDays))
                                                  .toString(),
                                              style:
                                                  Theme.of(context).textTheme.bodyLarge,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Baby Height",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              (profileViewModel
                                                      .pregnancyDetails?.babyHeight)
                                                  .toString(),
                                              style:
                                                  Theme.of(context).textTheme.bodyLarge,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Week Left(approx.)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              ((280 -
                                                          (DateTime.fromMillisecondsSinceEpoch(
                                                                  DateTime.now()
                                                                      .millisecondsSinceEpoch)
                                                              .difference(DateTime.fromMillisecondsSinceEpoch(
                                                                  profileViewModel
                                                                              .pregnancyDetails
                                                                              ?.startingDay ==
                                                                          null
                                                                      ? 0
                                                                      : (profileViewModel
                                                                          .pregnancyDetails
                                                                          ?.startingDay)!))
                                                              .inDays)) ~/
                                                      7)
                                                  .toString(),
                                              style:
                                                  Theme.of(context).textTheme.bodyLarge,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Saved Videos",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.3,
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final data = _articleData[index + 3];
                                  return SavedVideoCard(
                                    image: data['image'],
                                  );
                                }),
                          ),
                          Text(
                            "Saved Article",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.3,
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final data = _articleData[index];
                                  return ArticleCard(
                                    image: data['image'],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              appBar: const SafeBumpAppBar(
                // leadingWidget: Icon(Icons.menu_rounded),
                title: 'Profile'
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.red.shade100,
                    child: const Icon(Icons.person_rounded, color: Colors.red, size: 90),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: CustomButton(
                      label: "Login",
                      onPressed: () {
                        Navigator.pushNamed(
                          context, NavigationRoutes.login
                        );
                      },
                      color: Colors.pinkAccent
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}

class SavedVideoCard extends StatelessWidget {
  final String image;

  const SavedVideoCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Stack(alignment: AlignmentDirectional.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              image,
              height: 30.h,
              fit: BoxFit.fill,
            ),
          ),
          const Card(
            shape: CircleBorder(),
            child: Icon(Icons.play_arrow_rounded),
          ),
        ]),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String image;

  const ArticleCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NavigationRoutes.article);
      },
      child: SizedBox(
        width: 70.w,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              image,
              height: 30.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
