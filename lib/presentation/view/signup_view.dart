import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification? notification){
          notification!.disallowIndicator();
          return true;
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(image: AssetImage('assets/images/logo.png'), height: 300),
                      Text(
                        "Enter your Name",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        controller: _nameController,
                        hint: "Enter Name",
                        suffixIcon: const Icon(Icons.person_outline_rounded),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Enter your Email",
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
                      Text("Enter your Password",
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
                            : Icons.hide_source_rounded
                          )
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomButton(
                          label: "SignUp",
                          onPressed: authViewModel.isLoading ? null : () async {
                            if (_formKey.currentState?.validate() == true) {
                              final user = UserModel(
                                _nameController.text.toString().trim(), 
                                _emailController.text.toString().trim(), 
                                _passwordController.text.toString().trim(),
                                "https://picsum.photos/200"
                              ); 
                              await authViewModel.signUp(user, context);
                            }
                          },
                          color: Colors.pinkAccent),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Text(
                        "OR",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 2.h,
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
        ),
      ),
    );
  }
}
