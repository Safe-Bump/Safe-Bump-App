import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/domain/entities/place_api/hospital.dart';

@factoryMethod
abstract class HospitalRepository{
  Future<Hospital?> getHospitalList(LatLng latLng);
}