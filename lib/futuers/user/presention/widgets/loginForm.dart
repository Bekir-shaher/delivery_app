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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 234,
                  height: 35,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Color(0xff004F62),
                      fontSize: 29,
                      fontWeight: FontWeight.w600,
                    ),
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
                ),
              ],
            ),
            SizedBox(height: 44),

            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: userIdCtr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF1F5FB),
                      hintText: 'User ID',
                      filled: true, // مملؤ
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                      fillColor: Color(0xffF1F5FB),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true, //مملؤ
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
                  SizedBox(height: 79),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 18),
                    child: Text(
                      'Show More',
                      style: TextStyle(
                        color: Color(0xff004F62),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        userId = int.parse(userIdCtr.text);
                        password = int.parse(passwordCtr.text);
                        // Handle login logic here
                      }
                    },
                    color: Color(0xff004F62),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minWidth: 334,
                    height: 44,
                    padding: EdgeInsets.only(left: 17, right: 17),
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
