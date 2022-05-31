import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../theme/theme.dart';
import '../controllers/setelan_controller.dart';

class SetelanView extends GetView<SetelanController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(children: [
        Positioned(
          top: -10,
          left: 20,
          child: Text(
            'Setelan',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 63,
                fontWeight: FontWeight.bold,
                color: primaryBrown.withOpacity(0.20)),
          ),
        ),
        Center(
            child: Container(
          height: 56,
          width: 128,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66), color: primaryBrown),
          child: TextButton(
            onPressed: () => authC.logout(),
            child: Text(
              'Logout',
              style: heading5.copyWith(color: colorLight),
            ),
          ),
        )),
      ]),
    );
  }
}
