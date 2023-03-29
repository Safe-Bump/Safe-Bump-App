import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/view/profile_view.dart';
import 'package:sizer/sizer.dart';

import '../../navigation/router.dart';
import '../widgets/safe_bump_app_bar.dart';

class VideoListView extends StatefulWidget {
  const VideoListView({Key? key}) : super(key: key);

  @override
  State<VideoListView> createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        // leadingWidget: Icon(Icons.menu_rounded),
        trailingWidget: Icon(Icons.more_vert),
        title: "Videos",
      ),
      body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return VideoListCard();
                      }),
                ),
              )),
    );
  }
}

class VideoListCard extends StatelessWidget {
  const VideoListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NavigationRoutes.article);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Stack(alignment:AlignmentDirectional.center,children: [
                  Placeholder(),
                  Card(
                    child: Icon(Icons.play_arrow_rounded,size: 50,),
                    shape: CircleBorder(),
                  ),
                ]),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Yoga",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("Lore", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Save for Later",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.pinkAccent)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
