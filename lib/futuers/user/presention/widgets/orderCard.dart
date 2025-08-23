import 'dart:ffi';

import 'package:flutter/material.dart';

class Ordercard extends StatelessWidget {
  Ordercard({super.key});
  // final String orderId;
  // final String orderStatus;
  // final String orderPrice;
  // final String orderDate;
  // final String orderStatusColor;
  // final String orderButtonColor;

  // Ordercard({
  //   required this.orderId,
  //   required this.orderStatus,
  //   required this.orderPrice,
  //   required this.orderDate,
  //   required this.orderStatusColor,
  //   required this.orderButtonColor,
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 91,
      margin: EdgeInsets.only(top: 28),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(3, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 4, 14, 16),
            child: SizedBox(
              height: 91,
              width:
                  MediaQuery.of(context).size.width *
                  0.644, //ياخذ هذا المقدار من المسحه وبحسب جميع الاجهزه
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "#12345678",
                    style: TextStyle(color: Color(0xff808080), fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoColum(
                        title: "Status",
                        value: "New",
                        textStyle: TextStyle(
                          color: Color(0xff29D40F), //
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Devider(),
                      InfoColum(
                        title: "Total price",
                        value: "400 LE",
                        textStyle: TextStyle(
                          color: Color(0xff004F62),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Devider(),

                      InfoColum(
                        title: "Date",
                        value: "1/1/2020",
                        textStyle: TextStyle(
                          color: Color(0xff004F62),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InfoOrder(color: Color(0xff29D40F)),
          // Expanded(flex: -1, child: InfoOrder(color: Color(0xff29D40F))),
        ],
      ),
    );
  }
}

class InfoOrder extends StatelessWidget {
  final Color color;

  const InfoOrder({required this.color, super.key});

  Widget build(BuildContext content) {
    return Container(
      width: 44,
      height: 91,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Order Details",
            style: TextStyle(fontSize: 8, color: Color(0xffFFFFFF)),
            textAlign: TextAlign.center,
          ),
          Icon(Icons.chevron_right, color: Color(0xffFFFFFF), size: 20),
        ],
      ),
    );
  }
}

class InfoColum extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? textStyle;
  const InfoColum({required this.title, required this.value, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      //حاويه مناسبه تتقلص حسب الحجم
      fit: BoxFit.scaleDown, //تقلص
      child: Column(
        children: [
          Text(
            title,
            maxLines: 1,
            style: TextStyle(color: Color(0xff808080), fontSize: 10),
          ),
          SizedBox(height: 8),
          Text(
            value, //
            maxLines: 1,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class Devider extends StatelessWidget {
  const Devider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 46,
      color: Color(0xffC7C7C7),
      margin: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
