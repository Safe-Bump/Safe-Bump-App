import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/view/calendar_view.dart';
import 'package:safe_bump/presentation/viewmodel/calendar_viewmodel.dart';


class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetIt.I<CalendarViewModel>(),
      child: const CalendarView(),
    );
  }
}
