import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/view/hospital_view.dart';
import 'package:safe_bump/presentation/viewmodel/hospital_viewmodel.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GetIt.I<HospitalViewModel>(),
        child: const HospitalView());
  }
}
