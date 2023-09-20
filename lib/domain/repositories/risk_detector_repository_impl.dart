import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_bump/utils/asset_helper.dart';

import '../../data/repositories/risk_detector_repository.dart';

class RiskDetectorRepositoryImpl extends RiskDetectorRepository {
  final Dio _dio;

  RiskDetectorRepositoryImpl(this._dio);

  @override
  Future<String> fetchData(int age, int systolicBP, int diastolicBP, double bs,
      double bodyTemp, int heartRate) async {
    try {
      var risk = await _dio.get(
          "${AssetsHelper.risk_detector_api_base_url}age=$age&systolic_bp=$systolicBP&diastolic_bp=$diastolicBP&bs=$bs&body_temp=$bodyTemp&heart_rate=$heartRate");
      return (risk.data as Map<String, dynamic>)["result"];
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.toString();
    }
  }
}
