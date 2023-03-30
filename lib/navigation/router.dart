import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/screen/video_list_screen.dart';
import 'package:safe_bump/presentation/screen/article_list_screen.dart';
import 'package:safe_bump/presentation/screen/article_screen.dart';
import 'package:safe_bump/presentation/screen/dashboard_screen.dart';
import 'package:safe_bump/presentation/screen/error_screen.dart';
import 'package:safe_bump/presentation/screen/exercise_detail_screen.dart';
import 'package:safe_bump/presentation/screen/exercise_screen.dart';
import 'package:safe_bump/presentation/screen/hospital_screen.dart';
import 'package:safe_bump/presentation/screen/login_screen.dart';
import 'package:safe_bump/presentation/screen/onboarding/on_boarding_page.dart';
import 'package:safe_bump/presentation/screen/signup_screen.dart';
import 'package:safe_bump/presentation/screen/suggested_food_screen.dart';

import '../presentation/screen/predicition_screen.dart';
import '../presentation/screen/safe_bump_screen.dart';

abstract class NavigationRoutes {
  static const String login = '/login';
  static const String mainScreen = '/';
  static const String dashboard = '/dashboard';
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
  static const String articleList = '/profile/article_list';
  static const String article = '/profile/article_list/article';
  static const String map = '/dashboard/map';
  static const String exercise = '/exercise';
  static const String exercise_detail = '/exercise/detail';
  static const String food = '/food';
  static const String video_list = '/video_list';
  static const String predictor = '/predictor';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.mainScreen:
        return MaterialPageRoute(builder: (_) => const SafeBumpScreen());
      case NavigationRoutes.map:
        return MaterialPageRoute(builder: (_) => const HospitalScreen());
      case NavigationRoutes.articleList:
        return MaterialPageRoute(builder: (_) => const ArticleListScreen());
      case NavigationRoutes.article:
        return MaterialPageRoute(builder: (_) => const ArticleScreen());
      case NavigationRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case NavigationRoutes.predictor:
        return MaterialPageRoute(builder: (_) => PredictionScreen());
      case NavigationRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case NavigationRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case NavigationRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case NavigationRoutes.exercise:
        return MaterialPageRoute(builder: (_) => ExerciseScreen());
      case NavigationRoutes.video_list:
        return MaterialPageRoute(builder: (_) => VideoListScreen());
      case NavigationRoutes.food:
        return MaterialPageRoute(builder: (_) => SuggestedFoodScreen());
      case NavigationRoutes.exercise_detail:
        return MaterialPageRoute(builder: (_) => ExerciseDetailPage(title: "title", description: "description", image: "image"));
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
