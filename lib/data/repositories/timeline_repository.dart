import 'package:injectable/injectable.dart';

import '../../domain/entities/pregnancy_details.dart';

@factoryMethod
abstract class TimelineRepository{
  Future<PregnancyDetails?> getPregnancyDetails();
}