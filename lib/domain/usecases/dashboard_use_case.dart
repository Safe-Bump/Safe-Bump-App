import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/dashboard_repository.dart';
import 'package:safe_bump/domain/entities/user_model.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';

@injectable
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