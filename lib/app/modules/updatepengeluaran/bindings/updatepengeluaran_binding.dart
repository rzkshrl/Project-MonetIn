import 'package:get/get.dart';

import '../controllers/updatepengeluaran_controller.dart';

class UpdatepengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatepengeluaranController>(
      () => UpdatepengeluaranController(),
    );
  }
}
