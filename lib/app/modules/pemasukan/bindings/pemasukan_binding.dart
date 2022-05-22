import 'package:get/get.dart';

import '../controllers/pemasukan_controller.dart';

class PemasukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemasukanController>(
      () => PemasukanController(),
    );
  }
}
