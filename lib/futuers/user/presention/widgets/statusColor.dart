import 'package:flutter/material.dart';

// Color statusColor(int id) {
//   switch (id) {

//     case 1:
//       return const Color(0xFF707070); // تمّ التوصيل
//     case 2:
//       return const Color(0xffD45A0F); // مردود جزئي
//     case 3:
//       return const Color(0xff808080); // مردود كامل
//     default:
//       return const Color(0xff29D40F); // جديد/افتراضي
//   }
// }
import 'package:flutter/material.dart';

class OrderStatus {
  final String name;
  final Color color;

  const OrderStatus(this.name, this.color);
}

// هنا نحدد النص + اللون حسب رقم الحالة من الـ API
OrderStatus getOrderStatus(int flag) {
  switch (flag) {
    case 0: // New
      return const OrderStatus("New", Color(0xff29D40F));
    case 1: // Delivering
      return const OrderStatus("Delivering", Color(0xff004F62));
    case 2: // Delivered
      return const OrderStatus("Delivered", Color(0xFF707070));
    case 3: // Returned
      return const OrderStatus("Returned", Color(0xffD42A0F));
    default:
      return const OrderStatus("Unknown", Colors.black);
  }
}
