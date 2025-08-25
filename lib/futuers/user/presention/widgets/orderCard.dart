import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Ordercard extends StatelessWidget {
  final String orderId; // رقم الطلب
  final String statusName; // اسم الحالة (New/Delivered/...)
  final Color statusColor; // لون الحالة
  final String totalPrice; // مثل: "400 LE"
  final String date;

  const Ordercard({
    super.key,
    required this.orderId,
    required this.statusName,
    required this.statusColor,
    required this.totalPrice,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
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
            padding: const EdgeInsets.fromLTRB(19, 4, 0, 16),
            child: SizedBox(
              height: 91,
              width:
                  MediaQuery.of(context).size.width *
                  0.74, //ياخذ هذا المقدار من المسحه وبحسب جميع الاجهزه
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '#$orderId',
                    style: TextStyle(color: Color(0xff808080), fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InfoColum(
                        title: 'Status'.tr(),
                        value: statusName,
                        textStyle: TextStyle(
                          color: statusColor, //
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Devider(),
                      InfoColum(
                        title: 'Total price'.tr(),
                        value: totalPrice,
                        textStyle: TextStyle(
                          color: Color(0xff004F62),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Devider(),

                      InfoColum(
                        title: 'Date'.tr(),
                        value: date,
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
          // InfoOrder(color: Color(0xff29D40F)),
          Expanded(child: InfoOrder(color: statusColor)),
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
      margin: EdgeInsets.only(left: 10),
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
