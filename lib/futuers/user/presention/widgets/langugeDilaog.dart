import 'dart:ffi';

import 'package:delivery_app/futuers/user/presention/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/radio_list_tile.dart';

class langugeDilaog extends StatefulWidget {
  const langugeDilaog({super.key});

  @override
  State<langugeDilaog> createState() => _langugeDilaogState();
}

class _langugeDilaogState extends State<langugeDilaog> {
  String selectedLan = "en";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Text(
        "Chose language",
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff004F62),
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Color(0xffF4F4F4),
      content: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedLan = "ar";
                });
              },
              child: Container(
                width: 150,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedLan == "ar"
                      ? Color(0xffCBFFCB)
                      : Color(0xffFFFFFF),
                  border: Border.all(color: Color(0xff0A3F8F)),
                ),

                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          maxRadius: 12,
                          backgroundImage: AssetImage(
                            'images/langugeDilaogAssetes/Arabic Flag.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 19),
                    Expanded(
                      flex: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "العربية",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Arabic",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedLan = "en";
                });
              },
              child: Container(
                width: 150,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedLan == "en"
                      ? Color(0xffCBFFCB)
                      : Color(0xffFFFFFF),
                  border: Border.all(
                    color: Color(0xff0A3F8F),
                    width: 1.0,
                  ), //الحجم غير مناسب
                ),

                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          maxRadius: 12,
                          backgroundImage: AssetImage(
                            'images/langugeDilaogAssetes/English Flag.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 19),
                    Expanded(
                      flex: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "English",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff004F62),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            onPressed: () {
              print("Selected language = $selectedLan");
              //اعدادات الللغة]
              Navigator.pop(context, true);
            },
            child: Text(
              "Apply",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
