import 'package:get/get.dart';

import 'xi_way_logic.dart';

class XiWayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
