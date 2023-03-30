import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/screen/article_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import '../widgets/safe_bump_app_bar.dart';

class ArticleListView extends StatefulWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  State<ArticleListView> createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  List<Map<String, dynamic>> _articleData = AssetsHelper.articleData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        // leadingWidget: Icon(Icons.menu_rounded),
        trailingWidget: Icon(Icons.more_vert),
        title: "Article",
      ),
      body: LayoutBuilder(
        builder: (context, constraints) =>
            SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _articleData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = _articleData[index];
                    return ArticleListCard(
                      index: index,
                      title: data['title'],
                      detail: data['detail'],
                      image: data['image'],
                    );
                  },
                ),
              ),
            ),
      ),
    );
  }
}

class ArticleListCard extends StatelessWidget {
  final String title;
  final String detail;
  final String image;
  final int index;

  const ArticleListCard({
    Key? key,
    required this.title,
    required this.detail,
    required this.image, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticleScreen(
              index: index,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  image,
                  height: 30.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
              SizedBox(height: 1.h),
              Text(
                '${detail.substring(0, 80)}...',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Save for Later",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.pinkAccent),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border_rounded),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
