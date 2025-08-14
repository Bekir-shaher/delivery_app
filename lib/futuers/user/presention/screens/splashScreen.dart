import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3));
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

/*
Scaffold(
      backgroundColor: Color(0xFFE9FAFF),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.only(bottom: 120),
                width: 276,
                height: 112,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/firstScreenAssets/logo.png'),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 44),
                width: 374,
                height: 245,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/firstScreenAssets/build.png'),
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/firstScreenAssets/motor.png'),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20),
            // Align(
            //   child: Stack(
            //     alignment:
            //         Alignment.bottomCenter, // محاذاة العناصر في المنتصف يمين يسار
            //     children: [
            //       Positioned(
            //         child: Image.asset('images/firstScreenAssets/build.png'),
            //       ),

            //       Positioned(
            //         // top: 40,
            //         child: Image.asset(
            //           'images/firstScreenAssets/motor.png',
            //           width: 270,
            //           height: 209.27,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Container(
            //   alignment: Alignment.bottomCenter,
            //   child: Column(
            //     children: [

            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
 */

/*
 // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [

      //     SizedBox(height: 120),
      //   ],
      // ),
      // bottomSheet: Container(
      //   alignment: Alignment.bottomCenter,
      //   child: Stack(
      //     children: [
      //       Image.asset('images/firstScreenAssets/build.png'),
      //       Positioned(
      //         child: Image.asset('images/firstScreenAssets/motor.png'),
      //       ),
      //     ],
      //   ),
      // ),
 */
