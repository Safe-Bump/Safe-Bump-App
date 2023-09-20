import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import '../../domain/entities/pregnancy_details.dart';
import '../../domain/usecases/profile_use_case.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileUseCase _profileUseCase;


  ProfileViewModel(this._profileUseCase);

  PregnancyDetails? _pregnancyDetails;

  PregnancyDetails? get pregnancyDetails => _pregnancyDetails;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  Future<Void?> getPregnancyDetails() async {
    _pregnancyDetails = await _profileUseCase.getPregnancyDetails();
    notifyListeners();
    return null;
  }
}