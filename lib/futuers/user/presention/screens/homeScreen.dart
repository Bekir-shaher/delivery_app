import 'package:delivery_app/futuers/user/presention/widgets/langugeDilaog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // لون خلفية الشريط  شفاف)
        statusBarIconBrightness:
            Brightness.light, // يجعل الأيقونات باللون الأبيض
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Color(0xffD42A0F),
            width: 375,
            height: 127,

            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 108,
                    height: 55,
                    margin: EdgeInsets.fromLTRB(17, 46, 56, 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Ahmed",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            "Othman",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Align(
                      child: Image.asset(
                        'images/homeScreenAssetes/ic_circle.png',
                        width: 121,
                        height: 127,
                      ),
                    ),
                    Positioned(
                      top: 19,
                      right: 60,
                      child: Image.asset(
                        'images/homeScreenAssetes/deliveryman.png',
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return langugeDilaog();
                          },
                        );
                      },
                      icon: Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 17),

                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Positioned(
                          child: Image.asset(
                            'images/homeScreenAssetes/ic_language.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
