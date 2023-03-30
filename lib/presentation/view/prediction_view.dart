import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/risk_detector_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/custom_button.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:sizer/sizer.dart';

class PredictionView extends StatefulWidget {
  const PredictionView({Key? key}) : super(key: key);

  @override
  State<PredictionView> createState() => _PredictionViewState();
}

class _PredictionViewState extends State<PredictionView> {
  final ageController = TextEditingController();
  final SBPcontroller = TextEditingController();
  final DBPcontroller = TextEditingController();
  final BScontroller = TextEditingController();
  final tempController = TextEditingController();
  final heartRateController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  var authTextFieldDecoration = InputDecoration(
    labelText: "Email",
    labelStyle: TextStyle(fontSize: 10.sp, color: Colors.black),
    errorStyle: TextStyle(fontSize: 10.sp),
    hintText: "Enter your email",
    hintStyle: TextStyle(fontSize: 10.sp, color: Color(0xFFAF9E9E)),
    contentPadding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 2.5.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(2.5.h),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(2.5.h),
      ),
      borderSide: BorderSide(
        width: 0.6.w,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<RiskDetectorViewModel>(
      builder: (context, riskDetectorViewModel, _) => Scaffold(
        appBar: SafeBumpAppBar(
          title: 'Health Prediction',
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 2.w, right: 2.w),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Enter Data",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          decoration: authTextFieldDecoration.copyWith(
                            labelText: "Age",
                            hintText: "Enter your age in years",
                          ),
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        TextFormField(
                          decoration: authTextFieldDecoration.copyWith(
                            labelText: "Systolic Blood Pressure",
                            hintText: "Enter your Systolic BP",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: SBPcontroller,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        TextFormField(
                          decoration: authTextFieldDecoration.copyWith(
                            labelText: "Diastolic Blood Pressure",
                            hintText: "Enter your Diastolic BP",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: DBPcontroller,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        TextFormField(
                          decoration: authTextFieldDecoration.copyWith(
                            labelText: "Body Temperature",
                            hintText: "In F",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: tempController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        TextFormField(
                          decoration: authTextFieldDecoration.copyWith(
                            labelText: "Heart Rate",
                            hintText: "Enter your heart rate in bps",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: heartRateController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        TextFormField(
                          decoration: authTextFieldDecoration.copyWith(
                            labelText: "BS",
                            hintText: "Enter your BS",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: BScontroller,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        CustomButton(
                            label: "Get Prediction",
                            onPressed: () {
                              riskDetectorViewModel.getRiskData(
                                  int.parse(ageController.value.text),
                                  int.parse(SBPcontroller.value.text),
                                  int.parse(DBPcontroller.value.text),
                                  double.parse(BScontroller.value.text),
                                  double.parse(tempController.value.text),
                                  int.parse(heartRateController.value.text));
                            },
                            color: Colors.pinkAccent),
                        SizedBox(height: 10.h,),
                        Text(
                          (riskDetectorViewModel.riskData == null
                                  ? ""
                                  : riskDetectorViewModel.riskData)
                              .toString(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
