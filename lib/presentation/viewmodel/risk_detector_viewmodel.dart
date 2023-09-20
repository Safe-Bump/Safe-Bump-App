import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:safe_bump/domain/usecases/risk_detector_use_case.dart';

class RiskDetectorViewModel extends ChangeNotifier {
  final RiskDetectorUseCase _riskDetectorUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _riskData;

  String? get riskData => _riskData;

  RiskDetectorViewModel(this._riskDetectorUseCase);

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Void?> getRiskData(int age, int systolicBP, int diastolicBP, double bs,
      double bodyTemp, int heartRate) async {
    _riskData = await _riskDetectorUseCase.fetchRiskData(
        age, systolicBP, diastolicBP, bs, bodyTemp, heartRate);
    notifyListeners();
    return null;
  }
}
