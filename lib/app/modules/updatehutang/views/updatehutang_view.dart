import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/updatehutang_controller.dart';

class UpdatehutangView extends GetView<UpdatehutangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UpdatehutangView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UpdatehutangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
