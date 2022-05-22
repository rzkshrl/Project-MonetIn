import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../controllers/hutang_controller.dart';

class HutangView extends GetView<HutangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(children: [
        Positioned(
          top: 10,
          left: 20,
          child: Text(
            'Detail',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: primaryBrown.withOpacity(0.20)),
          ),
        ),
        Positioned(
          top: 56,
          left: 20,
          child: Text(
            'Transaksi',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: primaryBrown.withOpacity(0.20)),
          ),
        ),
      ]),
    );
  }
}
