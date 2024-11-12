import 'package:autograph_album/pages/album_first/album_first_logic.dart';
import 'package:autograph_album/pages/album_second/album_second_logic.dart';
import 'package:autograph_album/pages/album_third/album_third_logic.dart';
import 'package:get/get.dart';

import 'album_tab_logic.dart';

class AlbumTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumTabLogic());
    Get.lazyPut(() => AlbumFirstLogic());
    Get.lazyPut(() => AlbumSecondLogic());
    Get.lazyPut(() => AlbumThirdLogic());
  }
}
