import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/asset_helper.dart';
import '../widgets/safe_bump_app_bar.dart';

class ArticleView extends StatefulWidget {
  final int index;

  const ArticleView({Key? key, required this.index}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    var article = AssetsHelper.articleData[widget.index];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SafeBumpAppBar(
        // leadingWidget: Icon(Icons.menu_rounded),
        trailingWidget: Icon(Icons.more_vert),
        title: "Article",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              article["image"],
              height: 30.h,
              fit: BoxFit.cover,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article["title"],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.pinkAccent),
                          ),
                          Icon(Icons.bookmark_border_rounded)
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(article["detail"],
                          style: Theme.of(context).textTheme.bodyMedium),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
