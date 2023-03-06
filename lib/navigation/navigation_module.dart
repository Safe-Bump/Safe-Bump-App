import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/screen/dashboard_screen.dart';
import 'package:safe_bump/presentation/screen/error_screen.dart';
import 'package:safe_bump/presentation/screen/login_screen.dart';

abstract class NavigationRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
}

class NavigationModule {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case NavigationRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
