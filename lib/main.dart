import 'package:delivery_app/core/error/router/routeGenerator.dart';
import 'package:delivery_app/futuers/user/presention/screens/loginScreen.dart';
import 'package:delivery_app/futuers/user/presention/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashScreen',
      onGenerateRoute: Routegenerator.generateRouter,
      // routes: {
      //   '/splashScreen': (context) => const SplashScreen(),
      //   '/': (context) => const Loginscreen(),
      // },
    );
  }
}
