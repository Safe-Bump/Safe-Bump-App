import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';

class SuggestedFoodScreen extends StatefulWidget {
  const SuggestedFoodScreen({Key? key}) : super(key: key);

  @override
  State<SuggestedFoodScreen> createState() => _SuggestedFoodScreenState();
}

class _SuggestedFoodScreenState extends State<SuggestedFoodScreen> {

  final List<Map<String, dynamic>> _foodData = AssetsHelper.foodData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SafeBumpAppBar(
        // leadingWidget: Icon(Icons.menu_rounded),
        trailingWidget: Icon(Icons.more_vert),
        title: 'Suggested Food',
      ),
      body: ListView.builder(
        itemCount: _foodData.length,
        itemBuilder: (context, index) {
          final data = _foodData[index];
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: const Color(0xffFFCDD2),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 10.w,
              height: 10.w,
              child: SvgPicture.asset(
                AssetsHelper.seedSvg,
                // ignore: deprecated_member_use
                color: Colors.pink,
              ),
            ),
            title: Text(data['food_name']),
            subtitle: Text('${data['description'].substring(0, 50)}...'),
          );
        },
      )
    );
  }
}
