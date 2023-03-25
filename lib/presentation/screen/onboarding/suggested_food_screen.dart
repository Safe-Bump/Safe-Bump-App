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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        trailingWidget: Icon(Icons.more_vert),
        title: 'Suggested Food',
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 20.h,
                  child:
                      Center(child: Text("Chandra please insert stuff here")),
                ),
                Container(
                  height: 40.h,
                  child: ListView.builder(itemCount: 4,itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFCDD2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 10.w,
                        height: 10.w,
                        child: SvgPicture.asset(
                          AssetsHelper.seedSvg,
                          color: Colors.pink,
                        ),
                      ),
                      title: Text('Spinach'),
                      subtitle: Text('One serving per week'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
