import 'package:get/get.dart';

import '../../beranda/controllers/beranda_controller.dart';
import '../../setelan/controllers/setelan_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BerandaController>(
      () => BerandaController(),
    );
    Get.lazyPut<SetelanController>(
      () => SetelanController(),
    );
  }
}
