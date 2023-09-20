// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/navigation/router.dart';
import 'package:safe_bump/presentation/viewmodel/pregnancy_detail_viewmodel.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';

class PregnancyDetailView extends StatefulWidget {
  const PregnancyDetailView({Key? key}) : super(key: key);

  @override
  State<PregnancyDetailView> createState() => _PregnancyDetailViewState();
}

class _PregnancyDetailViewState extends State<PregnancyDetailView> with TickerProviderStateMixin{
  var babyWeight = TextEditingController();
  var current = 0;
  var babyHeight = TextEditingController();
  late TabController tabController;
  final babyWeightForm = GlobalKey<FormState>();
  final babyHeightForm = GlobalKey<FormState>();

 void animateScroll(int page) {
    tabController.animateTo(
      max(min(page, 2), 0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  @override
  void initState(){
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose(){
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PregnancyDetailViewModel>(
      builder: (context, pregnancyDetailViewModel, child) => 
      ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: () {
            switch (current) {
              case 0:
                return 61.h; // Set maxHeight for current == 0
              case 1:
                return 61.h; // Set maxHeight for current == 1
              case 2:
                return 64.h; // Set maxHeight for current == 2
              default:
                return 64.h; // Default maxHeight when current is not 0, 1, or 2
            }
          }(),
        ),
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Form(
                  key: babyWeightForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Baby Weight",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.red.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Image.asset(AssetsHelper.baby_weight),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        controller: babyWeight,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Weight can not be empty!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Enter Weight of the Baby (in kg)",
                          hintText: "Enter Weight of the Baby (in kg)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        ),
                      ),
                      SizedBox(
                        height: 3.h
                      ),
                      ElevatedButton(
                        onPressed: (){
                          if(babyWeightForm.currentState!.validate()){
                            animateScroll(current + 1);
                            setState(() {
                              current = current+1;
                            });
                            FocusScope.of(context).unfocus();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                        elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ), backgroundColor: Colors.pinkAccent,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(2.7.w, 12, 0, 12),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Next', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Form(
                  key: babyHeightForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Baby Height",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.red.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Image.asset(AssetsHelper.baby_height),
                        ),
                      ),
                      SizedBox(
                        height:5.h,
                      ),
                      TextFormField(
                        controller: babyHeight,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Height can not be empty!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Enter Height of the Baby (in ft)",
                          hintText: "Enter Height of the Baby (in ft)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        ),
                      ),
                      SizedBox(
                        height: 3.h
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: (){
                                animateScroll(current - 1);
                                setState(() {
                                  current = current - 1;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              style: ElevatedButton.styleFrom(
                              elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ), backgroundColor: Colors.pinkAccent,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 12, 2.7.w, 12),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chevron_left,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'Back', 
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: (){
                                if(babyHeightForm.currentState!.validate()){
                                  animateScroll(current + 1);
                                  setState(() {
                                    current = current+1;
                                  });
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                              elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ), backgroundColor: Colors.pinkAccent,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2.7.w, 12, 0, 12),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Next', 
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                      )
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "First Day of Pregnancy",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Card(
                    elevation: 3,
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
                      }
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: ()async{
                            animateScroll(current - 1);
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              (){
                                setState(() {
                                  current = current - 1;
                                });
                              }
                            );
                          },
                          style: ElevatedButton.styleFrom(
                          elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ), backgroundColor: Colors.pinkAccent,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 12, 2.7.w, 12),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chevron_left,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Back', 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () async {
                            pregnancyDetailViewModel.onBabyHeightChanged(
                                double.parse(babyHeight.value.text));
                            pregnancyDetailViewModel.onBabyWeightChanged(
                                double.parse(babyWeight.value.text));
                            await pregnancyDetailViewModel.addPregnancyDetail();
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                              context, NavigationRoutes.mainScreen
                            );
                          },
                          style: ElevatedButton.styleFrom(
                          elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ), backgroundColor: Colors.pinkAccent,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 12, 2.w, 12),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.done_rounded,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Done', 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              ],
                            )
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
