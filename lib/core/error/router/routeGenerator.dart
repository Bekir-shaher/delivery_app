import 'package:delivery_app/futuers/user/presention/screens/loginScreen.dart';
import 'package:delivery_app/futuers/user/presention/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routegenerator {
  static Route<dynamic> generateRouter(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      case '/splashScreen':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Color(0xffE9FAFF),
          body: Center(
            child: Text(
              'Error: Route not found',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
