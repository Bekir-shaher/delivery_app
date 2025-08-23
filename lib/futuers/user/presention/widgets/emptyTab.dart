import 'package:flutter/material.dart';

class Emptytab extends StatefulWidget {
  const Emptytab({super.key});

  @override
  State<Emptytab> createState() => _EmptytabState();
}

class _EmptytabState extends State<Emptytab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 52),
      child: Column(
        children: [
          Image.asset('images/firstScreenAssets/ic_emptyorder.png'),
          SizedBox(height: 46),
          Text(
            "No orders yet",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 16),
          Text(
            '''You don't have any orders in your 
                           shistory.''', //لان expanden and flexible لا يعملان مع defaultTabBar
            // softWrap: true, //يجعل النص يلتف
            style: TextStyle(fontSize: 16, color: Color(0xff000000)),
          ),
        ],
      ),
    );
  }
}
