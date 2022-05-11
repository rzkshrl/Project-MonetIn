import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_monetin/app/modules/login/views/login_view.dart';

import '../../../controller/auth_controller.dart';
import '../../../theme/theme.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final emailC = TextEditingController();
  final authC = Get.find<AuthController>();
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
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
                    'assets/icons/icon.png',
                    width: 240,
                    height: 240,
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
                      controller: emailC,
                      style: TextStyle(color: textGrey),
                      decoration: InputDecoration(
                          prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                IconlyLight.user,
                                color: textGrey,
                              )),
                          hintText: 'Email',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 56,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66),
                    color: primaryBrown),
                child: TextButton(
                  onPressed: () => authC.resetPassword(emailC.text),
                  child: Text(
                    'Reset Password',
                    style: heading5.copyWith(color: colorLight),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: Text(
                      'Login',
                      style: regular16pt.copyWith(color: primaryBrown),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
