import 'package:get/get.dart';

import 'album_first_logic.dart';

class AlbumFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumFirstLogic());
  }
}
