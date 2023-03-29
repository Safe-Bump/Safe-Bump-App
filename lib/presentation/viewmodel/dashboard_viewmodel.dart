import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';
import 'package:safe_bump/domain/usecases/dashboard_use_case.dart';

import '../../domain/entities/user_model.dart';

class DashboardViewModel extends ChangeNotifier {
  final DashboardUseCase _dashboardUseCase;

  DashboardViewModel(this._dashboardUseCase);

  UserModel? _user;

  UserModel? get user => _user;

  PregnancyDetails? _pregnancyDetails;

  PregnancyDetails? get pregnancyDetails => _pregnancyDetails;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Void?> getUserDetail() async {
    _user = await _dashboardUseCase.getUserDetails();
    notifyListeners();
  }

  Future<Void?> getPregnancyDetails() async {
    _pregnancyDetails = await _dashboardUseCase.getPregnancyDetails();
    notifyListeners();
  }
}
