import 'package:delivery_app/core/network/networkInfo.dart';
import 'package:delivery_app/futuers/user/data/dataSource/OrdersRemoteDS.dart';
import 'package:delivery_app/futuers/user/data/dataSource/localDataBase/orders_local.dart';
import 'package:delivery_app/futuers/user/data/repository/OrdersRepoImpl.dart';
import 'package:delivery_app/futuers/user/domain/repository/OrdersRepo.dart';
import 'package:delivery_app/futuers/user/domain/useCase/GetBillsUseCase.dart';
import 'package:delivery_app/futuers/user/domain/useCase/GetReturnReasonsUseCase.dart';
import 'package:delivery_app/futuers/user/domain/useCase/GetStatusTypesUseCase.dart';
import 'package:delivery_app/futuers/user/presention/OrderCubit/cubit/order_cubit.dart';
import 'package:delivery_app/futuers/user/presention/widgets/OrdersList.dart';
import 'package:delivery_app/futuers/user/presention/widgets/emptyTab.dart';
import 'package:delivery_app/futuers/user/presention/widgets/langugeDilaog.dart';
import 'package:delivery_app/futuers/user/presention/widgets/orderCard.dart';
import 'package:delivery_app/futuers/user/presention/widgets/pillTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

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

    return BlocProvider(
      create: (context) {
        final client = http.Client();
        final remote = OrdersRemoteDS(client);
        final network = NetworkInfoImpl(InternetConnectionChecker.instance);
        final db = OrdersLocalDb();

        final repo = OrdersRepoImpl(remote: remote, network: network, db: db);

        final getBillsUseCase = GetBillsUseCase(repo);
        final getStatusTypesUseCase = GetStatusTypesUseCase(repo);
        final getReturnReasonsUseCase = GetReturnReasonsUseCase(repo);

        return OrderCubit(
          getBillsUseCase,
          getStatusTypesUseCase,
          getReturnReasonsUseCase,
        )..loadAll(deliveryNo: '1010', langNo: 2);
      },
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          // padding: EdgeInsets.zero,
          children: [
            Container(
              color: Color(0xffD42A0F),
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
                          'images/homeScreenAssets/ic_circle.png',
                          width: 121,
                          height: 127,
                        ),
                      ),
                      Positioned(
                        top: 19,
                        right: 60,
                        child: Image.asset(
                          'images/homeScreenAssets/deliveryman.png',
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
                              'images/homeScreenAssets/ic_language.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(child: Pilltab()),
            SizedBox(height: 52),
          ],
        ),
      ),
    );
  }
}
