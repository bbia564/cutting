import 'package:bottom_picker/bottom_picker.dart';
import 'package:cutting/pages/xi_second/cutting_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_xi/db_xi.dart';

class XiSecondLogic extends GetxController {

  final dbXi = Get.find<DBXi>();

  var showNum = '-';
  var unit = '-';

  bool isInteger(String str) {
    final integerRegExp = RegExp(r'^-?\d+$');
    return integerRegExp.hasMatch(str);
  }

  bool isDecimal(String str) {
    final decimalRegExp = RegExp(r'^-?\d+(\.\d+)?$');
    return decimalRegExp.hasMatch(str);
  }

  editShowNum() async {
    Get.dialog(AlertDialog(
      title: const Text(
        'Error',
        textAlign: TextAlign.center,
      ),
      actions: [
        Container(
          width: double.infinity,
          height: 40,
          child: CuttingInput(
              value: showNum,
              maxLength: 5,
              isNumber: true,
              onChange: (value) {
                showNum = value;
              }),
        )
            .decorated(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey))
            .marginAll(12),
        <Widget>[
          TextButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final num = prefs.getString('showNum') ?? '1';
              showNum = num;
              update();
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (showNum.isEmpty) {
                Fluttertoast.showToast(msg: 'Please input');
                return;
              }
              if ((double.tryParse(showNum) ?? 0) < 0 ||
                  (double.tryParse(showNum) ?? 0) > 50 ||
                  (!isDecimal(showNum) &&
                  !isInteger(showNum))) {
                Fluttertoast.showToast(msg: 'Please fill in correctly');
                return;
              }
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString('showNum', showNum);
              update();
              Get.back();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.red),
            ),
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
      ],
    ),barrierDismissible: false);
  }


  void unitPicker(BuildContext context) async {
    BottomPicker(
      items:const [
        Center(
          child: Text('mm'),
        ),
        Center(
          child: Text('cm'),
        )
      ],
      pickerTitle:const Text('Unit',textAlign: TextAlign.center,),
      titleAlignment: Alignment.center,
      pickerTextStyle:const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      closeIconColor: Colors.black,
      displayCloseIcon: false,
      displaySubmitButton: false,
      dismissable: true,
      selectedItemIndex: unit == 'mm' ? 0 : 1,
      onChange: (index) async {
        final SharedPreferences prefs =
            await SharedPreferences.getInstance();

        if (index == 0) {
          unit = 'mm';
          await prefs.setString('unit', unit);
        } else {
          unit = 'cm';
          await prefs.setString('unit', unit);
        }
        update();
      },
    ).show(context);
  }

  cleanAllSetting() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to restore all the data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('showNum', '1');
            await prefs.setString('unit', 'mm');
            await dbXi.cleanAllData();
            showNum = '1';
            unit = 'mm';
            update();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }


  aboutUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/134.png',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We can provide you with the calculation of the utilization rate"""),
      ],
      context: context,
    );
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();
    showNum = prefs.getString('showNum') ?? '1';
    unit = prefs.getString('unit') ?? 'mm';
    update();
    super.onInit();
  }
}
