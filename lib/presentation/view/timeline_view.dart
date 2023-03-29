import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/timeline_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({Key? key}) : super(key: key);

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  @override
  void initState() {
    super.initState();
    var timelineViewModel =
    Provider.of<TimelineViewModel>(context, listen: false);
    timelineViewModel.getPregnancyDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimelineViewModel>(
      builder: (context, timelineViewModel, _) => Scaffold(
        appBar: SafeBumpAppBar(
          title: "Timeline",
          trailingWidget: Icon(Icons.more_vert),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: timelineViewModel.weeks.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 5.w,
                      child: SvgPicture.asset(
                        AssetsHelper.timelineIndicator,
                        color: i ==
                                ((DateTime.fromMillisecondsSinceEpoch(
                                                DateTime.now()
                                                    .millisecondsSinceEpoch)
                                            .difference(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    (timelineViewModel
                                                            .pregnancyDetails
                                                            ?.startingDay)! *
                                                        (24 * 60 * 60 * 1000)))
                                            .inDays) ~/
                                        7)
                            ? Colors.pink
                            : Color(0xFFFFCDD2),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timelineViewModel.weeks[i][0],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 83.w,
                          child: Text(
                            timelineViewModel.weeks[i][1],
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
