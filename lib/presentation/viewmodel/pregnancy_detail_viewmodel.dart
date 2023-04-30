import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:safe_bump/domain/usecases/pregnancy_detail_use_case.dart';

class PregnancyDetailViewModel extends ChangeNotifier {
  int? _startingDay;

  int? get startingDay => _startingDay;

  double? _babyHeight;

  double? get babyHeight => _babyHeight;

  double? _babyWeight;

  double? get babyWeight => _babyHeight;

  final PregnancyDetailUseCase _pregnancyDetailUseCase;

  PregnancyDetailViewModel(this._pregnancyDetailUseCase);

  Future<Void?> addPregnancyDetail() async {
    await _pregnancyDetailUseCase.addPregnancyDetail(
        startingDay!, babyHeight!, babyWeight!);
    notifyListeners();
  }

  void onBabyHeightChanged(double babyHeight) {
    _babyHeight = babyHeight;
  }

  void onBabyWeightChanged(double babyWeight) {
    _babyWeight = babyWeight;
  }

  void onStartingDayChanged(int startingDay){
    _startingDay=startingDay;
  }
}
