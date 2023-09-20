// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entities/onboarding_entities.dart';

class OnboardingStack extends StatelessWidget {
  final int index;
  const OnboardingStack({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 60.w,
              child: SvgPicture.asset(
                mainOnboardings[index].image,
                height: height / 2,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}