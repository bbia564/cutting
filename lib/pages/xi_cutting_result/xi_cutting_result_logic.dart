import 'package:cutting/db_xi/result_entity.dart';
import 'package:get/get.dart';

class XiCuttingResultLogic extends GetxController {

  ResultEntity? entity;

  @override
  void onInit() {
    // TODO: implement onInit
    entity = Get.arguments;
    update();
    super.onInit();
  }

}
