import 'package:flutter/material.dart';

Color statusColor(int id) {
  switch (id) {
    case 0:
      return const Color(0xFF28D40F); // New
    case 1:
      return const Color(0xFF28D40F); // Delivered (مثال)
    case 2:
      return const Color(0xFFD96A1F); // Partial Returned
    case 3:
      return const Color(0xFFD2332D); // Fully Returned
    default:
      return const Color(0xFF6C6C6C); // Unknown
  }
}
