import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_bloc/src/auth/ui/auth_screen.dart';
import 'package:project_bloc/src/profile/ui/profile_screen.dart';
import '../../src/splash/splash.dart';
import 'route_name.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.splashScreenPath:
        return _pageTransition(child: const SplashScreen());
      case AppRoute.authScreenPath:
        return _pageTransition(child: const AuthScreen());
      // case AppRoute.profileScreenPath:
      //   return _pageTransition(child: const ProfileScreen());

      default:
        return _pageTransition(
          child: Scaffold(
            appBar: AppBar(title: const Text("ERROR")),
            body: const Center(child: Text("ERROR")),
          ),
        );
    }
  }

  static PageTransition<dynamic> _pageTransition({
    required Widget child,
    PageTransitionType? type,
  }) {
    return PageTransition(
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 350),
      type: type ?? PageTransitionType.rightToLeft,
      child: child,
    );
  }
}
