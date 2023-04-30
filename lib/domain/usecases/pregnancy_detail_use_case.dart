import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/pregnancy_detail_repository.dart';

@injectable
class PregnancyDetailUseCase {
  final PregnancyDetailRepository _pregnancyDetailRepository;

  PregnancyDetailUseCase(this._pregnancyDetailRepository);

  addPregnancyDetail(int startingDay, double babyHeight, double babyWeight) {
    _pregnancyDetailRepository.addPregnancyDetail(
        startingDay, babyHeight, babyWeight);
  }
}
