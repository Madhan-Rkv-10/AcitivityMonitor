import 'package:activity_monitor/src/features/NewEvent/Presentation/add_new_event.dart';
import 'package:activity_monitor/src/features/auth/Presentation/auth_screen.dart';

import '../../src/routing/route_constants.dart';
import 'package:flutter/material.dart';

import '../features/home/presentation/home.dart';
import '../features/splash/screen/splash_screen.dart';

class RouteManager {
  MaterialPageRoute<dynamic> route(RouteSettings settings) {
    // ignore: unused_local_variable
    dynamic data = settings.arguments != null ? settings.arguments ?? {} : {};

    switch (settings.name) {
      case RouteConstants.splashScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.splashScreen),
            builder: (context) => const SplashScreen());
      case RouteConstants.homeScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(
              name: RouteConstants.homeScreen,
            ),
            builder: (context) => const HomeScreen());
      case RouteConstants.authScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(
              name: RouteConstants.authScreen,
            ),
            builder: (context) => const LoginScreen());
      case RouteConstants.newEvent:
        return MaterialPageRoute(
            settings: const RouteSettings(
              name: RouteConstants.newEvent,
            ),
            builder: (context) => const AddNewEvent());
      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.splashScreen),
            builder: (context) => const SplashScreen());
    }
  }
}

RouteFactory get onGenerateRoute => RouteManager().route;
