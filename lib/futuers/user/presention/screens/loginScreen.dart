import 'dart:ffi';

import 'package:delivery_app/futuers/user/domain/repository/loginRepo.dart';
import 'package:delivery_app/futuers/user/domain/useCase/LoginUseCase.dart';
import 'package:delivery_app/futuers/user/presention/cubit/deleivery_cubit.dart';
import 'package:delivery_app/futuers/user/presention/widgets/langugeDilaog.dart';
import 'package:delivery_app/futuers/user/presention/widgets/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      body: ListView(
        //يستخدم ListView للسماح بالتمرير في حالة وجود محتوى طويل
        padding: EdgeInsets.zero, //

        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  // alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 26, top: 54),
                  child: Image.asset(
                    'images/loginScreenAssets/logo2.png',
                    width: 170,
                    height: 74,
                  ),
                ),
              ),
              SizedBox(width: 58),
              Expanded(
                flex: 0,
                child: Stack(
                  //مشكلة
                  clipBehavior: Clip.none, //
                  children: [
                    Align(
                      child: Image.asset(
                        'images/loginScreenAssets/ic_circle.png',
                        width: 121,
                        height: 127,
                      ),
                    ),

                    Positioned(
                      top: 51,
                      left: 60,
                      child: Align(
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return LanguageDialog();
                              },
                            );
                          },
                          icon: Image.asset(
                            'images/loginScreenAssets/ic_language.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 132),

          Loginform(),

          Container(
            margin: EdgeInsets.only(bottom: 28, top: 37),
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            width: 195,
            height: 170,
            child: Image.asset('images/loginScreenAssets/delivery.png'),
          ),
        ],
      ),
    );
  }
}


/*
top: -MediaQuery.of(context).size.height * 0.1
MediaQuery.of(context).size.height = يعطيك ارتفاع الشاشة بالبكسل.

* 0.1 = يعني 10% من ارتفاع الشاشة.

علامة السالب - = تحرك العنصر للأعلى (خارج المكان الطبيعي).


 */