import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../domain/entities/onboarding_entities.dart';
import 'OnboardingStack.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int current = 0;
  int totalSlides = 4;
  CarouselController _carouselController = CarouselController();

  Future<void> animateScroll(int page) async {
    await _carouselController.animateToPage(
      max(min(page, 3), 0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  _storeOnBoardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoard', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text:
                        "${mainOnboardings[this.current].title.split(' ')[0]} ",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "ProductSans",
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: mainOnboardings[this.current].title.split(' ')[1],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50.h,
            child: CarouselSlider(
              items: [
                OnboardingStack(index: 0),
                OnboardingStack(index: 1),
                OnboardingStack(index: 2),
                OnboardingStack(index: 3),
              ],
              options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 4),
                  height: 100.h,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  onPageChanged: (value, reason) {
                    setState(() {
                      current = value;
                    });
                  }),
            ),
          ),
          this.current == 0
              ? Text(
                  "Welcome",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              : SizedBox(
                  height: 0,
                ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 80.w,
            child: Text(
              mainOnboardings[this.current].description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          this.current == 3
              ? CustomButton(
                  label: "Get Started",
                  onPressed: () {
                    _storeOnBoardInfo();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  color: Colors.pinkAccent)
              : SizedBox(
                  height: 0,
                ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      animateScroll(3);
                    },
                    child: Text("SKIP"),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: current.ceil(),
                    count: 4,
                    onDotClicked: (index) => animateScroll(index),
                    duration: const Duration(milliseconds: 500),
                    effect: WormEffect(
                      dotHeight: 8,
                      activeDotColor: Colors.pink,
                      spacing: 8,
                      dotColor: Colors.grey,
                      dotWidth: 8,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      animateScroll(current + 1);
                    },
                    child: Text("NEXT"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
