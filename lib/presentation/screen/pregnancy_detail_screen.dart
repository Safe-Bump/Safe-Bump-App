import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/view/pregnancy_detail_view.dart';
import 'package:safe_bump/presentation/viewmodel/pregnancy_detail_viewmodel.dart';

class PregnancyDetailScreen extends StatelessWidget {
  const PregnancyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: const PregnancyDetailView(),
      create: (_) => GetIt.I<PregnancyDetailViewModel>(),
    );
  }
}
