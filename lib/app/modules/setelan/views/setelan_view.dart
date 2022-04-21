import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setelan_controller.dart';

class SetelanView extends GetView<SetelanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SetelanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SetelanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
