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
      appBar: AppBar(
        title: Text('SetelanView'),
        centerTitle: true,
      ),
      body: Center(
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
        ),
      ),
    );
  }
}
