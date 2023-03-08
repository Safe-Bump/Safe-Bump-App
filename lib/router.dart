import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/screen/error_screen.dart';
import 'package:safe_bump/presentation/screen/login_screen.dart';
import 'package:safe_bump/presentation/screen/onboarding/on_boarding_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnBoardingPage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
