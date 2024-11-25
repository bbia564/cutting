import 'package:cutting/db_xi/db_xi.dart';
import 'package:get/get.dart';

import '../../db_xi/cutting_entity.dart';

class XiFirstLogic extends GetxController {

  final dbXi = Get.find<DBXi>();

  var list = <CuttingEntity>[].obs;

  void getData() async {
    list.value = await dbXi.getAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
