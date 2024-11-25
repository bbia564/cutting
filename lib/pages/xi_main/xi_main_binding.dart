import 'package:cutting/pages/xi_first/xi_first_logic.dart';
import 'package:cutting/pages/xi_second/xi_second_logic.dart';
import 'package:get/get.dart';

import 'xi_main_logic.dart';

class XiMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XiMainLogic());
    Get.lazyPut(() => XiFirstLogic());
    Get.lazyPut(() => XiSecondLogic());
  }
}
