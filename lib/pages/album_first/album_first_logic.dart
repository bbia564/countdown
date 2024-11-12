import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../db_album/date_entity.dart';
import '../../db_album/db_album.dart';

class AlbumFirstLogic extends GetxController {

  DBAlbum dbAlbum = Get.find<DBAlbum>();

  var list = <DateEntity>[].obs;

  void getData() async {
    list.value = await dbAlbum.getDateAllData();
    for (var item in list.value) {
      if (item.isWarn == 1 && item.isOut) {
        item.isWarn = 0;
        Fluttertoast.showToast(msg: '${item.title} at time');
        await dbAlbum.updateDate(item);
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    Timer.periodic(const Duration(seconds: 5), (value) {
      getData();
    });
    super.onInit();
  }

}
