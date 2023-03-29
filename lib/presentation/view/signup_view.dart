import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/user_model.dart';
import '../viewmodel/auth_viewmodel.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/google_auth_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
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
                    "Enter your Name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hint: "Enter Name",
                    // onChanged: (value) => userModel.setEmail(value),
                    suffixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Enter your Email",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hint: "Enter Email",
                    // onChanged: (value) => userModel.setEmail(value),
                    suffixIcon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Enter your Password",
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    hint: "Enter Password",
                    obscureText: _obscureText,
                    // onChanged: (value) => userModel.setPassword(value),
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
                          await authViewModel.login();
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
                        "Don't have account? ",
                      ),
                      GestureDetector(
                          onTap: () {
                            // navigationService.navigateTo(NavigationRoutes.dashboard);
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
                      await authViewModel.googleLogin();
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
