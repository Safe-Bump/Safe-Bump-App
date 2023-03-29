import 'package:injectable/injectable.dart';

import '../../data/repositories/profile_repository.dart';
import '../entities/pregnancy_details.dart';

@injectable
class ProfileUseCase{
  final ProfileRepository _profileRepository;

  ProfileUseCase(this._profileRepository);

  Future<PregnancyDetails?> getPregnancyDetails() async{
    return _profileRepository.getPregnancyDetails();
  }
}