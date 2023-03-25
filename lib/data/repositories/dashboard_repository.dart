import 'package:safe_bump/domain/entities/User.dart';

import '../../domain/entities/pregnancy_details.dart';

abstract class DashboardRepository{
  Future<UserModel?> getUserDetails();
  Future<PregnancyDetails?> getPregnancyDetails();
}