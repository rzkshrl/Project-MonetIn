import 'package:get/get.dart';

import '../controllers/updatepemasukan_controller.dart';

class UpdatepemasukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatepemasukanController>(
      () => UpdatepemasukanController(),
    );
  }
}
