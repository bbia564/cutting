import 'package:get/get.dart';

import 'xi_second_logic.dart';

class XiSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XiSecondLogic());
  }
}
