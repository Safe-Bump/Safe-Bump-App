import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


class PregnancyDetails extends ChangeNotifier {
  int dayOfPregnancy;
  double? height;
  double? weight;

  // int? get dayOfPregnancy => _daysOfPregnancy;
  //
  // double? get height => _height;
  //
  // double? get weight => _weight;

  PregnancyDetails({required this.dayOfPregnancy, this.height, this.weight});

}
