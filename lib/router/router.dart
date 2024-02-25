import 'package:flutter/material.dart';
import '../screens/search_weatherScreen.dart';
import '../screens/signup_screen.dart';

import '../screens/auth_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  Route? onGenratedRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/searchWeather':
        return MaterialPageRoute(builder: (_) => SearchWeatherScreen());
      default:
        return null;
    }
  }
}
