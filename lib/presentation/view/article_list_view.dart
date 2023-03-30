import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/navigation/router.dart';
import 'package:sizer/sizer.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import '../widgets/safe_bump_app_bar.dart';

class ArticleListView extends StatefulWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  State<ArticleListView> createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  List<Map<String, dynamic>> _articleData = [
    {
      'title': 'Maintaining a Healthy Pregnancy',
      'detail':
          'Nutrition Tips and Strategies for Expectant Mothers" - This article would provide an in-depth look at the importance of maintaining a healthy diet during pregnancy. It could cover topics such as the role of nutrients like folic acid and iron in fetal development, tips for managing pregnancy-related discomforts like morning sickness and food aversions, and strategies for incorporating healthy foods into your diet. The article could also include recipes and meal plans designed specifically for pregnant women.',
      'image': AssetsHelper.pregnant_woman
    },
    {
      'title': 'Prenatal Yoga',
      'detail':
          'A Guide to Safe and Effective Yoga Practices for Expectant Mothers" - This article would provide an introduction to the benefits of practicing prenatal yoga during pregnancy. It could cover topics such as the physical and emotional benefits of yoga for expectant mothers, tips for modifying yoga poses to accommodate a growing belly, and precautions to take when practicing yoga during pregnancy. The article could also include a sequence of prenatal yoga poses designed to help expectant mothers relieve common discomforts such as back pain and improve their overall well-being.',
      'image': AssetsHelper.pregnant_woman
    },
    {
      'title': 'Preparing for Labor and Delivery',
      'detail':
          'Exercises and Techniques for Expectant Mothers" - This article would provide an overview of exercises and techniques designed to help expectant mothers prepare for labor and delivery. It could cover topics such as kegel exercises to strengthen the pelvic floor muscles, perineal massage to reduce the risk of tearing during delivery, and breathing and relaxation techniques to manage pain during labor. The article could also include advice on how to create a birth plan and what to expect during different stages of labor.',
      'image': AssetsHelper.pregnant_woman
    },
    {
      'title': 'Mental Health and Pregnancy',
      'detail':
          'Strategies for Managing Stress and Anxiety" - This article would provide tips and strategies for managing stress and anxiety during pregnancy. It could cover topics such as the link between stress and pregnancy complications, the importance of self-care during pregnancy, and techniques for managing stress and anxiety, such as mindfulness meditation and cognitive-behavioral therapy. The article could also include advice on how to seek professional help if needed.',
      'image': AssetsHelper.pregnant_woman
    },
    {
      'title': 'The Fourth Trimester',
      'detail':
          'A Guide to Postpartum Recovery and Self-Care" - This article would provide an overview of the "fourth trimester," the period of time after delivery when the mothers body is recovering and adjusting to life with a newborn. It could cover topics such as postpartum physical recovery, the emotional challenges of the postpartum period, and tips for self-care during this time. The article could also include advice on how to seek help if needed, such as from a postpartum doula or mental health professional.',
      'image': AssetsHelper.pregnant_woman
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        // leadingWidget: Icon(Icons.menu_rounded),
        trailingWidget: Icon(Icons.more_vert),
        title: "Article",
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: SizedBox(
            height: constraints.maxHeight,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _articleData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = _articleData[index];
                return ArticleListCard(
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

  const ArticleListCard({
    Key? key,
    required this.title,
    required this.detail,
    required this.image,
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
              Image.asset(
                image,
                height: 30.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 2.h),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 1.h),
              Text(
                  '${detail.substring(0, 80)}...',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Save for Later",
                    style: Theme.of(context)
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
