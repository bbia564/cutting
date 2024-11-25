import 'package:cutting/db_xi/cutting_entity.dart';
import 'package:cutting/db_xi/db_xi.dart';
import 'package:cutting/db_xi/result_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class XiCuttingInputLogic extends GetxController {
  final dbXi = Get.find<DBXi>();
  bool isAdd = true;
  CuttingEntity? entity;

  var unit = '';

  void startCount() async {
    if (entity?.modFirst == 0 ||
        entity?.modSecond == 0 ||
        entity?.modThird == 0 ||
        entity?.materialsSecond == 0 ||
        entity?.materialsThird == 0) {
      Fluttertoast.showToast(msg: 'Please fill in the numbers correctly');
      return;
    }
    if (entity?.materialsFirst.isEmpty == true) {
      Fluttertoast.showToast(msg: 'Please enter name');
      return;
    }
    if (isAdd) {
      await dbXi.dbBase.insert('cutting', {
        'created_time': DateTime.now().toIso8601String(),
        'mod_first': entity!.modFirst,
        'mod_second': entity!.modSecond,
        'mod_third': entity!.modThird,
        'materials_first': entity!.materialsFirst,
        'materials_second': entity!.materialsSecond,
        'materials_third': entity!.materialsThird,
      });
    } else {
      await dbXi.updateCuttingData(entity!);
    }
    final modNum = entity!.modFirst * entity!.modSecond * entity!.modThird;
    final materialsNum = entity!.materialsSecond * entity!.materialsThird;
    if (modNum > materialsNum) {
      Fluttertoast.showToast(msg: 'The part value is greater than the material value, please confirm whether the input is correct');
      return;
    }
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();
    final showNum = int.parse(prefs.getString('showNum') ?? '1');
    var resultNum = (modNum / materialsNum * 100).toInt();
    resultNum = resultNum + showNum;
    if (resultNum >100) {
      resultNum = 100;
    }
    ResultEntity resultEntity = ResultEntity(
        name: entity!.materialsFirst,
        resultFirst:
            '${entity!.modFirst}x${entity!.modSecond}/${entity!.modThird}',
        resultSecond: '${entity!.modThird}',
        resultThird: '$resultNum%',
    resultFourth: '${100-resultNum}%');
    Get.toNamed('/xiCuttingResult', arguments: resultEntity);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    unit = prefs.getString('unit') ?? 'mm';
    entity = Get.arguments;
    if (entity != null) {
      isAdd = false;
    } else {
      entity = CuttingEntity(
          id: 0,
          createdTime: DateTime.now(),
          modFirst: 0,
          modSecond: 0,
          modThird: 0,
          materialsFirst: '',
          materialsSecond: 0,
          materialsThird: 0);
    }
    update();
    super.onInit();
  }
}
