import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_information,
            color: Colors.pinkAccent,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Medicines",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
