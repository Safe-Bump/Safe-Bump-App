import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/safe_bump_app_bar.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  @override
  Widget build(BuildContext context) {
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
            Placeholder(
              fallbackHeight: 40.h,
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
                            "Yoga",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.pinkAccent),
                          ),
                          Icon(Icons.bookmark_border_rounded)
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text("data",
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
