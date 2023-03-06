import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/domain/entities/user.dart';
import 'package:safe_bump/presentation/view/login_view.dart';

import '../viewmodel/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => GetIt.I<LoginViewModel>()),
      ChangeNotifierProvider<UserModel>(
        create: (_) => UserModel(),
      )
    ], child: const LoginView());
  }
}
