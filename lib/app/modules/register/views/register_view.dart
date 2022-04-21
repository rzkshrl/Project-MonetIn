import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../theme/theme.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final bool passwordVisible;
  final bool passwordConfirmVisible;
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
                  width: 140,
                  height: 140,
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
                              IconlyLight.add_user,
                              color: textGrey,
                            )),
                        hintText: 'Username',
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
            CustomPrimaryButton(
              buttonColor: primaryBrown,
              textValue: 'Register',
              textColor: Colors.white,
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
