import 'package:get/get.dart';

import 'xi_cutting_result_logic.dart';

class XiCuttingResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XiCuttingResultLogic());
  }
}
