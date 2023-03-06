import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/domain/entities/user.dart';
import 'package:safe_bump/navigation/navigation_module.dart';
import 'package:safe_bump/presentation/viewmodel/login_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/custom_button.dart';
import 'package:safe_bump/presentation/widgets/custom_text_field.dart';
import 'package:safe_bump/presentation/widgets/google_auth_button.dart';

import '../../navigation/navigation_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    final userModel = Provider.of<UserModel>(context);
    // final navigationService = GetIt.I<NavigationService>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Image(image: AssetImage('assets/images/logo.png')),
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hint: "Enter Email",
                    onChanged: (value) => userModel.setEmail(value),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Password",
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    hint: "Enter Password",
                    obscureText: true,
                    onChanged: (value) => userModel.setPassword(value),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      label: "Login",
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == true) {
                          await loginViewModel.login();
                        }
                      },
                      color: Colors.pinkAccent),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        "Don't have account? ",
                      ),
                      GestureDetector(onTap: (){
                        // navigationService.navigateTo(NavigationRoutes.dashboard);
                      },child: const Text("Sign Up",style: TextStyle(color: Colors.pinkAccent)))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "OR",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GoogleAuthButton(
                    label: "Sign up with Google",
                    onPressed: () async {
                      await loginViewModel.googleLogin();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
