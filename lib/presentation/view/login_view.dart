
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/auth_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/custom_button.dart';
import 'package:safe_bump/presentation/widgets/custom_text_field.dart';
import 'package:safe_bump/presentation/widgets/google_auth_button.dart';
import 'package:sizer/sizer.dart';

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
    // final navigationService = GetIt.I<NavigationService>();
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification? notification){
          notification!.disallowIndicator();
          return true;
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(image: AssetImage('assets/images/logo.png'), height: 300),
                      SizedBox(
                        height: 5.5.h,
                      ),
                      Text(
                        "Email",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hint: "Enter Email",
                        suffixIcon: const Icon(Icons.email_outlined),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text("Password",
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hint: "Enter Password",
                        obscureText: _obscureText,
                        textInputAction: TextInputAction.done,
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
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomButton(
                        label: "Login",
                        onPressed: loginViewModel.isLoading? null : () async {
                          if (_formKey.currentState?.validate() == true) {
                            await loginViewModel.login(
                              _emailController.text.toString().trim(), 
                              _passwordController.text.toString().trim(),
                              context
                            );
                          }
                        },
                        color: Colors.pinkAccent
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?",
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, NavigationRoutes.signup);
                              },
                              child: const Text("Sign Up",
                                  style: TextStyle(color: Colors.pinkAccent)))
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Text(
                        "OR",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GoogleAuthButton(
                        label: "Sign in with Google",
                        onPressed: () async {
                          await loginViewModel.googleLogin();
                          Navigator.pushReplacementNamed(
                              context, NavigationRoutes.mainScreen);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
