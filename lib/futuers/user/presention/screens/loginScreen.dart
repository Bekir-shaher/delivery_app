import 'package:delivery_app/futuers/user/presention/widgets/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Loginform()),

            // Stack(
            //   alignment: Alignment.topLeft,
            //   children: [
            //     Positioned(
            //       child: Image.asset('images/loginScreenAssets/ic_circle.png'),
            //     ),
            //   ],
            // ),
            // Container(
            //   padding: EdgeInsets.zero,
            //   margin: EdgeInsets.only(left: 26, right: 179, top: 20),
            //   width: 170,
            //   height: 74,
            //   child: Image.asset('images/loginScreenAssets/logo2.png'),
            // ),
          ],
        ),
      ),
    );
  }
}
