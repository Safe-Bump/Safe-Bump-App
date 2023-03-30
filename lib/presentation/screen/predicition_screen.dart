import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/risk_detector_viewmodel.dart';

import '../view/prediction_view.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: const PredictionView(),
      create: (_) => GetIt.I<RiskDetectorViewModel>(),
    );
  }
}
