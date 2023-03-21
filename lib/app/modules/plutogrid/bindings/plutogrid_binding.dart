import 'package:get/get.dart';

import '../controllers/plutogrid_controller.dart';

class PlutogridBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlutogridController>(
      () => PlutogridController(),
    );
  }
}
