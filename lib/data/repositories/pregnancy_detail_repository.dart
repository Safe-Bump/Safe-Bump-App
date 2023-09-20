import 'dart:ffi';


abstract class PregnancyDetailRepository{
  Future<Void?> addPregnancyDetail(int startingDay, double babyHeight, double babyWeight);
}