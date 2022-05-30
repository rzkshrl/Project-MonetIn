import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/updatepengeluaran_controller.dart';

class UpdatepengeluaranView extends GetView<UpdatepengeluaranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UpdatepengeluaranView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UpdatepengeluaranView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
