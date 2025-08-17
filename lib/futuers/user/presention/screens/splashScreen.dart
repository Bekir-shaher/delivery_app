import 'dart:async';

import 'package:delivery_app/core/error/router/routeGenerator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //فهم الكود + لا ينتقل الى شاشة التسجيل  من اول مره ممكن بعد reload
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          '/',
        ); // Replace with your home screen route
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9FAFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: 276,
              height: 112,
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/firstScreenAssets/logo.png'),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 120),
        padding: EdgeInsets.only(bottom: 44),
        width: 245,
        height: 374,
        child: Stack(
          alignment: Alignment.center, // Center the stack
          children: [
            Image.asset('images/firstScreenAssets/build.png'),
            Positioned(
              top: 120,
              child: Image.asset(
                'images/firstScreenAssets/motor.png',
                height: 209,
                width: 270,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Stack(
  alignment: Alignment.center, // محاذاة افتراضية لكل العناصر
  children: [
    // العنصر الأول (في الخلفية)
    Container(width: 200, height: 200, color: Colors.blue),
    // العنصر الثاني (فوق الأول)
    Container(width: 100, height: 100, color: Colors.red),
    or 
    Positioned(
      top: 20, // المسافة من الأعلى
      left: 30, // المسافة من اليسار
      child: Container(width: 100, height: 100, color: Colors.red),
    ),
  ],
)
 */
