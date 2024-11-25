import 'package:get/get.dart';

import 'xi_first_logic.dart';

class XiFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XiFirstLogic());
  }
}
