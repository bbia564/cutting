import 'package:get/get.dart';

import 'xi_cutting_input_logic.dart';

class XiCuttingInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XiCuttingInputLogic());
  }
}
