import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/risk_detector_repository.dart';

@injectable
class RiskDetectorUseCase {
  final RiskDetectorRepository _riskDetectorRepository;

  RiskDetectorUseCase(this._riskDetectorRepository);

  Future<String> fetchRiskData(int age, int systolicBP, int diastolicBP,
      double bs, double bodyTemp, int heartRate) async {
    return _riskDetectorRepository.fetchData(
        age, systolicBP, diastolicBP, bs, bodyTemp, heartRate);
  }
}
