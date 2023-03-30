import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/view/profile_view.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';

import '../../navigation/router.dart';
import '../widgets/safe_bump_app_bar.dart';

class VideoListView extends StatefulWidget {
  const VideoListView({Key? key}) : super(key: key);

  @override
  State<VideoListView> createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  List<Map<String, dynamic>> _videoData = AssetsHelper.articleData;
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
                      itemCount: _videoData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = _videoData[index];
                        return VideoListCard(
                          title: data['title'],
                          detail: data['detail'],
                          image: data['image'],
                        );
                      }),
                ),
              )),
    );
  }
}

class VideoListCard extends StatelessWidget {
  final String title;
  final String detail;
  final String image;

  const VideoListCard({
    Key? key,
    required this.title,
    required this.detail,
    required this.image
  }) : super(key: key);

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      image,
                      height: 30.h,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text('${detail.substring(0, 50)}...', style: Theme.of(context).textTheme.bodySmall),
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
