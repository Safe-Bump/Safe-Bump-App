import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/screen/dashboard_screen.dart';
import 'package:safe_bump/presentation/screen/error_screen.dart';
import 'package:safe_bump/presentation/screen/login_screen.dart';
import 'package:safe_bump/presentation/screen/onboarding/on_boarding_page.dart';
import 'package:safe_bump/presentation/screen/signup_screen.dart';

import '../presentation/screen/safe_bump_screen.dart';

abstract class NavigationRoutes {
  static const String login = '/login';
  static const String mainScreen = '/';
  static const String dashboard = '/dashboard';
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case NavigationRoutes.mainScreen:
        return MaterialPageRoute(builder: (_) => const SafeBumpScreen());
      case NavigationRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case NavigationRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case NavigationRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case NavigationRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
