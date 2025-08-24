import 'dart:io';

import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/domain/repository/loginRepo.dart';
import 'package:delivery_app/futuers/user/domain/useCase/LoginUseCase.dart';
import 'package:delivery_app/futuers/user/presention/cubit/deleivery_cubit.dart';
import 'package:delivery_app/futuers/user/presention/widgets/langugeDilaog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  TextEditingController userIdCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  late String userId, password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryCubit, DeliveryStatusState>(
      builder: (context, state) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        color: Color(0xff004F62),
                        fontSize: 29,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 12),
                    Text(
                      "Log Back to your account",
                      style: TextStyle(
                        color: Color(0xff004F62),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(height: 44),

                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode
                      .onUnfocus, //تفعيل التحقق من صحة النموذج عند فقدان التركيز
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userIdCtr,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true, // لتفعيل اللون الخلفية
                          fillColor: Color(0xffF1F5FB), //لون الخلفية
                          hintText: 'User ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none, // لإزالة الحدود
                          ),
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          userId = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your User ID';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: passwordCtr,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF1F5FB),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none, // لإزالة الحدود
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 17),
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 27),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            //link or logic to show more options
                          },
                          child: Text(
                            'Show More',
                            style: TextStyle(
                              color: Color(0xff004F62),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await context
                                .read<DeliveryCubit>()
                                .login(
                                  userId: userIdCtr.text,
                                  password: passwordCtr.text,
                                  languageNo:
                                      2, //يجب ان يمون تلقائي عير المستخدم
                                )
                                .then((sucsecc) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/homeScreen',
                                  );
                                })
                                .catchError((error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "UserId or Password invalid",
                                      ),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior
                                          .floating, // يخليها مثل صندوق طافي
                                    ),
                                  );
                                });
                            // Handle login logic
                            // if (state is LoginSuccess) {
                            // } else if (state is LoginFailure) {

                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text("No internet connection"),
                            //       backgroundColor: Colors.red,
                            //       behavior: SnackBarBehavior.floating,
                            //     ),
                            //   );
                            // }
                          }
                          print("user id: $userId, password:$password");
                        },
                        color: Color(0xff004F62),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minWidth: double.infinity, // يسمح بتعبئة العرض بالكامل
                        height: 44,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
