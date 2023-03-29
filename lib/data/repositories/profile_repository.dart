import '../../domain/entities/pregnancy_details.dart';

abstract class ProfileRepository{
  Future<PregnancyDetails?> getPregnancyDetails();
}