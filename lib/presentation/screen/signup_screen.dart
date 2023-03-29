import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/domain/entities/user_model.dart';
import 'package:safe_bump/presentation/view/signup_view.dart';

import '../viewmodel/auth_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => GetIt.I<AuthViewModel>(), child: const SignUpView());
  }
}
