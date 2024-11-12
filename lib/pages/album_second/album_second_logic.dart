import 'package:autograph_album/db_album/album_entity.dart';
import 'package:autograph_album/db_album/db_album.dart';
import 'package:get/get.dart';

class AlbumSecondLogic extends GetxController {

  DBAlbum dbAlbum = Get.find<DBAlbum>();

  var list = <AlbumEntity>[].obs;

  void getData() async {
    list.value = await dbAlbum.getAlbumAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
