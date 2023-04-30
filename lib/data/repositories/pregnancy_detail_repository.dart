import 'dart:ffi';

import '../../domain/entities/pregnancy_details.dart';

abstract class PregnancyDetailRepository{
  Future<Void?> addPregnancyDetail(int startingDay, double babyHeight, double babyWeight);
}