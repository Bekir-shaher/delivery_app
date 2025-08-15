import 'dart:io';

import 'package:flutter/material.dart';

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  TextEditingController userIdCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  late int userId, password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        userId = int.parse(userIdCtr.text);
                        password = int.parse(passwordCtr.text);
                        // Handle login logic
                      }
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
  }
}
