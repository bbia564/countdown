import 'package:get/get.dart';

import 'album_add_logic.dart';

class AlbumAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumAddLogic());
  }
}
