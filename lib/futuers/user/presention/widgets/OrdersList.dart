import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:delivery_app/futuers/user/presention/OrderCubit/cubit/order_cubit.dart';
import 'package:delivery_app/futuers/user/presention/OrderCubit/cubit/order_state.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/BillItem.dart';
import 'package:delivery_app/futuers/user/presention/widgets/orderCard.dart';
import 'package:delivery_app/futuers/user/presention/widgets/statusColor.dart';
import 'package:delivery_app/futuers/user/presention/widgets/emptyTab.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.onlyNew});
  final bool onlyNew;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        // تحميل
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        // أي خطأ -> اعتبرها لا توجد طلبات
        if (state.error != null) {
          return const Emptytab();
        }

        log("List data: ${state.bills}");

        // فلترة حسب التبويب
        final List<BillItem> all = state.bills;
        final List<BillItem> items = all.where((b) {
          return onlyNew ? b.statusFlag == 0 : b.statusFlag != 0;
        }).toList();

        if (items.isEmpty) {
          return const Emptytab();
        }

        // قائمة كروت
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 4),
          itemBuilder: (context, i) {
            final b = items[i];
            final name = state.statusNames[b.statusFlag] ?? 'New';
            final color = statusColor(b.statusFlag);
            final price = '${b.totalAmount.toStringAsFixed(0)} LE';
            final date = DateFormat('d/M/yyyy').format(b.billDateTime);

            return Ordercard(
              orderId: b.billNo,
              statusName: name,
              statusColor: color,
              totalPrice: price,
              date: date,
            );
          },
        );
      },
    );
  }
}
