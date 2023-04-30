import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/pregnancy_detail_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/custom_text_field.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';

import '../../navigation/router.dart';
import '../widgets/safe_bump_app_bar.dart';

class PregnancyDetailView extends StatefulWidget {
  const PregnancyDetailView({Key? key}) : super(key: key);

  @override
  State<PregnancyDetailView> createState() => _PregnancyDetailViewState();
}

class _PregnancyDetailViewState extends State<PregnancyDetailView> {
  var babyWeight = TextEditingController();
  var current = 0;
  var babyHeight = TextEditingController();
  CarouselController _carouselController = CarouselController();

  Future<void> animateScroll(int page) async {
    await _carouselController.animateToPage(
      max(min(page, 2), 0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PregnancyDetailViewModel>(
      builder: (context, pregnancyDetailViewModel, child) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.pinkAccent,
        bottomNavigationBar: BottomAppBar(
          color: Colors.pinkAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: current == 2
                ? IconButton(
                    onPressed: () async {
                      pregnancyDetailViewModel.onBabyHeightChanged(
                          double.parse(babyHeight.value.text));
                      pregnancyDetailViewModel.onBabyWeightChanged(
                          double.parse(babyWeight.value.text));
                      await pregnancyDetailViewModel.addPregnancyDetail();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.done_rounded,
                      color: Colors.white,
                    ))
                : IconButton(
                    onPressed: () {
                      animateScroll(current + 1);
                    },
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    )),
          ),
        ),
        body: CarouselSlider(
            carouselController: _carouselController,
            items: [
              BabyWeight(
                controller: babyWeight,
              ),
              BabyHeight(
                controller: babyHeight,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "First Day of Pregnancy",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CalendarDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                              lastDate: DateTime.fromMillisecondsSinceEpoch(
                                  DateTime.now()
                                      .add(const Duration(days: 90))
                                      .millisecondsSinceEpoch),
                              onDateChanged: (dateTime) {
                                pregnancyDetailViewModel.onStartingDayChanged(
                                    dateTime.millisecondsSinceEpoch);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
            options: CarouselOptions(
                height: 100.h,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
                onPageChanged: (value, reason) {
                  setState(() {
                    current = value;
                  });
                })),
      ),
    );
  }
}

class BabyWeight extends StatelessWidget {
  BabyWeight({Key? key, required this.controller}) : super(key: key);
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 20,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade50, width: 10)),
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset(AssetsHelper.baby_weight),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Weight of the Baby",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}

class BabyHeight extends StatelessWidget {
  BabyHeight({Key? key, required this.controller}) : super(key: key);
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 20,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade50, width: 10)),
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset(AssetsHelper.baby_height),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Height of the Baby",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}

class CalendarDatePickerSlide extends StatefulWidget {
  const CalendarDatePickerSlide({Key? key}) : super(key: key);

  @override
  State<CalendarDatePickerSlide> createState() =>
      _CalendarDatePickerSlideState();
}

class _CalendarDatePickerSlideState extends State<CalendarDatePickerSlide> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First Day of Pregnancy",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 2.h,
            ),
            Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                    lastDate: DateTime.fromMillisecondsSinceEpoch(DateTime.now()
                        .add(const Duration(days: 90))
                        .millisecondsSinceEpoch),
                    onDateChanged: (dateTime) {
                      dateTime.millisecondsSinceEpoch;
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
