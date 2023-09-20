import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/navigation/router.dart';
import 'package:safe_bump/presentation/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../domain/entities/onboarding_entities.dart';
import 'onboardingStack.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int current = 0;
  int totalSlides = 4;
  final CarouselController _carouselController = CarouselController();

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text:
                          "${mainOnboardings[current].title.split(' ')[0]} ",
                      style: Theme.of(context).textTheme.headlineLarge),
                  TextSpan(
                      text: mainOnboardings[current].title.split(' ')[1],
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.pinkAccent)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50.h,
              child: CarouselSlider(
                items: const [
                  OnboardingStack(index: 0),
                  OnboardingStack(index: 1),
                  OnboardingStack(index: 2),
                  OnboardingStack(index: 3),
                ],
                carouselController: _carouselController,
                options: CarouselOptions(
                    height: 100.h,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    onPageChanged: (value, reason) {
                      setState(() {
                        current = value;
                      });
                    }),
              ),
            ),
            current == 0
                ? Text("Welcome", style: Theme.of(context).textTheme.headlineMedium)
                : const SizedBox(
                    height: 0,
                  ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 80.w,
              child: Text(
                mainOnboardings[current].description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            current == 3
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                        label: "Get Started",
                        onPressed: () {
                          _storeOnBoardInfo();
                          Navigator.pushReplacementNamed(context, NavigationRoutes.login);
                        },
                        color: Colors.pinkAccent),
                  )
                : const SizedBox(
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
                      child: const Text("SKIP"),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: current.ceil(),
                      count: 4,
                      onDotClicked: (index) => animateScroll(index),
                      duration: const Duration(milliseconds: 500),
                      effect: const WormEffect(
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
                      child: const Text("NEXT"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
