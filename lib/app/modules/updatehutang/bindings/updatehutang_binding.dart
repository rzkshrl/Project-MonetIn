import 'package:get/get.dart';

import '../controllers/updatehutang_controller.dart';

class UpdatehutangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatehutangController>(
      () => UpdatehutangController(),
    );
  }
}
