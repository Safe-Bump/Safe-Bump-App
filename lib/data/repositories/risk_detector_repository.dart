import 'package:injectable/injectable.dart';

@factoryMethod
abstract class RiskDetectorRepository{
  Future<String> fetchData(int age,int systolicBP,int diastolicBP,double bs,int bodyTemp,int heartRate);
}