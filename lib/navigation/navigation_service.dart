import 'package:flutter/cupertino.dart';

abstract class NavigationService {
  Future<void> navigateTo(String routeName, {dynamic arguments});
  void goBack();
}

class NavigationServiceImpl implements NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationServiceImpl(this.navigatorKey);

  @override
  Future<void> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  @override
  void goBack() {
    navigatorKey.currentState!.pop();
  }
}
