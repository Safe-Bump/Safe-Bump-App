import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/domain/entities/user_model.dart';
import 'package:safe_bump/presentation/viewmodel/auth_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/custom_button.dart';
import 'package:safe_bump/presentation/widgets/custom_text_field.dart';
import 'package:safe_bump/presentation/widgets/google_auth_button.dart';

import '../../navigation/router.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<AuthViewModel>(context);
    final userModel = Provider.of<UserModel>(context);
    // final navigationService = GetIt.I<NavigationService>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                  onChanged: (value) => {},
                  suffixIcon: const Icon(Icons.email_outlined),
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
                  obscureText: _obscureText,
                  onChanged: (value) => {},
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.remove_red_eye_rounded
                          : Icons.hide_source_rounded)),
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
                  children: [
                    const Text(
                      "Don't have account?",
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, NavigationRoutes.signup);
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(color: Colors.pinkAccent)))
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
    );
  }
}
