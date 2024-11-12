import 'package:get/get.dart';

import 'album_second_logic.dart';

class AlbumSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumSecondLogic());
  }
}
