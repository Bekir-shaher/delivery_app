import 'dart:developer';

import 'package:delivery_app/futuers/user/presention/OrderCubit/cubit/order_cubit.dart';
import 'package:delivery_app/futuers/user/presention/OrderCubit/cubit/order_state.dart';
import 'package:delivery_app/futuers/user/presention/widgets/OrdersList.dart';
import 'package:delivery_app/futuers/user/presention/widgets/emptyTab.dart';
import 'package:delivery_app/futuers/user/presention/widgets/orderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pilltab extends StatefulWidget {
  const Pilltab({super.key});

  @override
  State<Pilltab> createState() => _PilltabState();
}

class _PilltabState extends State<Pilltab> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        log("List data: ${state.bills}");
      },
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Container(
              width: 220,
              height: 36,
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ), //مسافة فارغة من اليمين واليسار
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8, //شفافية اللون
                    color: Color(0x1A000000),
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Color(0xffFFFFFF),
                unselectedLabelColor: Color(0xff004F62),
                dividerColor: Colors.transparent, //?
                indicator: BoxDecoration(
                  color: Color(0xff004F62),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                tabs: [
                  Tab(text: "New"),
                  Tab(text: "Others"),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  OrdersList(onlyNew: true), // يعرض الطلبات الجديدة
                  OrdersList(onlyNew: false), // يعرض ما عدا الجديدة
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
