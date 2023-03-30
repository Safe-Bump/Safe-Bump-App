import 'package:flutter/cupertino.dart';
import 'package:safe_bump/presentation/view/article_view.dart';

class ArticleScreen extends StatelessWidget {
  final int index;

  const ArticleScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleView(
      index: index,
    );
  }
}
