
import 'package:flutter/cupertino.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';
import 'package:safe_bump/domain/usecases/dashboard_use_case.dart';

import '../../domain/entities/User.dart';

class DashboardViewModel extends ChangeNotifier{
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

  Future<UserModel?> getUserDetail() async {
    var userDetail=await _dashboardUseCase.getUserDetails();
    return userDetail;
  }

  Future<PregnancyDetails?> getPregnancyDetails() async{
    var details= await _dashboardUseCase.getPregnancyDetails();
    return details;
  }
}