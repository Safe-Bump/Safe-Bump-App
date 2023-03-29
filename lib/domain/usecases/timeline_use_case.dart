import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/timeline_repository.dart';

import '../entities/pregnancy_details.dart';

@injectable
class TimelineUseCase {
  final TimelineRepository _timelineRepository;

  TimelineUseCase(this._timelineRepository);

  Future<PregnancyDetails?> getPregnancyDetails() async {
    return _timelineRepository.getPregnancyDetails();
  }
}
