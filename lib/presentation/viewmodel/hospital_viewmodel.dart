import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bump/domain/entities/place_api/hospital.dart';
import 'package:safe_bump/domain/usecases/hospital_use_case.dart';

class HospitalViewModel extends ChangeNotifier {
  final HospitalUseCase _hospitalUseCase;

  HospitalViewModel(this._hospitalUseCase);

  Hospital? _hospital;

  Hospital? get hospital => _hospital;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Void?> getHospitalList(LatLng latLng) async {
    _hospital = await _hospitalUseCase.getHospitalList(latLng);
    notifyListeners();
  }
}
