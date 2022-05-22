import 'package:get/get.dart';

import '../controllers/hutang_controller.dart';

class HutangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HutangController>(
      () => HutangController(),
    );
  }
}
