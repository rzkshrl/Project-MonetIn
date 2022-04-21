import 'package:get/get.dart';

import '../controllers/setelan_controller.dart';

class SetelanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetelanController>(
      () => SetelanController(),
    );
  }
}
