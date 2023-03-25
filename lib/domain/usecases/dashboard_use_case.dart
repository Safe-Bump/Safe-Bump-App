import 'package:safe_bump/data/repositories/dashboard_repository.dart';
import 'package:safe_bump/domain/entities/User.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';

class DashboardUseCase{
  final DashboardRepository _dashboardRepository;
  DashboardUseCase(this._dashboardRepository);

  Future<UserModel?> getUserDetails() async{
    return _dashboardRepository.getUserDetails();
  }

  Future<PregnancyDetails?> getPregnancyDetails() async{
    return _dashboardRepository.getPregnancyDetails();
  }
}