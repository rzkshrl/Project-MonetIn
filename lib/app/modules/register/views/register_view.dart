import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../controller/auth_controller.dart';
import '../../../theme/theme.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final bool passwordVisible;
  final bool passwordConfirmVisible;
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final authC = Get.find<AuthController>();
  @override
  RegisterView({
    this.passwordVisible = false,
    this.passwordConfirmVisible = false,
  });
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/icon.png',
                  width: 180,
                  height: 180,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: colorLight,
                      borderRadius: BorderRadius.circular(14)),
                  child: TextFormField(
                    style: TextStyle(color: textGrey),
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              IconlyLight.message,
                              color: textGrey,
                            )),
                        hintText: 'Email',
                        hintStyle: heading6.copyWith(color: textGrey),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: colorLight,
                      borderRadius: BorderRadius.circular(14)),
                  child: TextFormField(
                    style: TextStyle(color: textGrey),
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              IconlyLight.lock,
                              color: textGrey,
                            )),
                        hintText: 'Password',
                        hintStyle: heading6.copyWith(color: textGrey),
                        suffixIcon: IconButton(
                          color: textGrey,
                          splashRadius: 1,
                          icon: Icon(passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {},
                        ),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: colorLight,
                      borderRadius: BorderRadius.circular(14)),
                  child: TextFormField(
                    style: TextStyle(color: textGrey),
                    obscureText: !passwordConfirmVisible,
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              IconlyLight.lock,
                              color: textGrey,
                            )),
                        hintText: 'Password Confirmation',
                        hintStyle: heading6.copyWith(color: textGrey),
                        suffixIcon: IconButton(
                          color: textGrey,
                          splashRadius: 1,
                          icon: Icon(passwordConfirmVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {},
                        ),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 56,
              width: 128,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(66), color: primaryBrown),
              child: TextButton(
                onPressed: () => authC.register(),
                child: Text(
                  'Register',
                  style: heading5.copyWith(color: colorLight),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: regular16pt.copyWith(color: textGrey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: regular16pt.copyWith(color: primaryBrown),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
