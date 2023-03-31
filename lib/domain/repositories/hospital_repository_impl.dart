import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bump/data/repositories/hospital_repository.dart';
import 'package:safe_bump/utils/asset_helper.dart';

import '../entities/place_api/hospital.dart';

class HospitalRepositoryImpl extends HospitalRepository {
  final Dio _dio;

  HospitalRepositoryImpl(this._dio);

  @override
  Future<Hospital?> getHospitalList(LatLng latLng) async {
    try {
      var hospitalResponse = await _dio.get(
          "${AssetsHelper.place_api_base_url}location=${latLng.latitude}%2C${latLng.longitude}&radius=10000&type=hospital&key=${AssetsHelper.place_api_key}");

      var hospitalData = Hospital.fromJson(hospitalResponse.data);
      // var photoResponse = await _dio.get(
      //     "${AssetsHelper.place_photo_api_base_url}maxwidth=400&photo_reference=photo_reference");
      return hospitalData;
    } on Exception catch (e) {
      return null;
    }
  }
}
