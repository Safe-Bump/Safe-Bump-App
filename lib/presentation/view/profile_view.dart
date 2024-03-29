import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/navigation/router.dart';
import 'package:safe_bump/presentation/viewmodel/profile_viewmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/asset_helper.dart';
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
    return Consumer<ProfileViewModel>(
      builder: (context, profileViewModel, child) => Scaffold(
        appBar: SafeBumpAppBar(
          // leadingWidget: Icon(Icons.menu_rounded),
          title:
              "Week: ${((DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).difference(DateTime.fromMillisecondsSinceEpoch(profileViewModel.pregnancyDetails?.startingDay == null ? 0 : ((profileViewModel.pregnancyDetails?.startingDay)!))).inDays) ~/ 7) + 1}",
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                      headerVisible: false,
                      daysOfWeekVisible: false,
                      focusedDay: DateTime.now(),
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
                          .add(Duration(days: 280)),
                      calendarFormat: CalendarFormat.week,
                      calendarBuilders: CalendarBuilders(
                        todayBuilder: (context, day, focusedDay) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              padding: EdgeInsets.all(5),
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
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle)),
                        ),
                        outsideBuilder: (context, day, focusedDay) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              padding: EdgeInsets.all(5),
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
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle)),
                        ),
                      )),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            padding: EdgeInsets.all(15),
                            width: 70,
                            height: 70,
                            child: SvgPicture.asset(AssetsHelper.maternalImage),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade100,
                            )),
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
                                      "Baby Weight",
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
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
    );
    ;
  }
}

class SavedVideoCard extends StatelessWidget {
  final String image;

  const SavedVideoCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      child: Card(
        shape: RoundedRectangleBorder(
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
          Card(
            child: Icon(Icons.play_arrow_rounded),
            shape: CircleBorder(),
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
      child: Container(
        width: 70.w,
        child: Card(
          shape: RoundedRectangleBorder(
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
