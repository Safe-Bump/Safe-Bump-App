
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/hospital_repository.dart';
import 'package:safe_bump/domain/entities/place_api/hospital.dart';

@injectable
class HospitalUseCase{
  final HospitalRepository _hospitalRepository;

  HospitalUseCase(this._hospitalRepository);

  Future<Hospital?> getHospitalList(LatLng latLng) async{
    return _hospitalRepository.getHospitalList(latLng);
  }

}