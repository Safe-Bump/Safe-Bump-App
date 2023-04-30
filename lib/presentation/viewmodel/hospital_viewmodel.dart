import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bump/domain/entities/place_api/hospital.dart';
import 'package:safe_bump/domain/usecases/hospital_use_case.dart';

class HospitalViewModel extends ChangeNotifier {
  final HospitalUseCase _hospitalUseCase;

  HospitalViewModel(this._hospitalUseCase);

  Hospital? _hospital;

  Hospital? get hospital => _hospital;

  LatLng? _currentPosition;

  LatLng? get currentPosition => _currentPosition;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Void?> getHospitalList() async {
    _hospital = await _hospitalUseCase.getHospitalList(currentPosition!);
    notifyListeners();
  }

  void onCurrentPositionChanged(LatLng? latLng) {
    _currentPosition = latLng;
    notifyListeners();
  }

  Future<Void?> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    var position = await Geolocator.getCurrentPosition();
    onCurrentPositionChanged(LatLng(position.latitude, position.longitude));
    await getHospitalList();
  }
}
