import 'package:get/get.dart';

import 'album_third_logic.dart';

class AlbumThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumThirdLogic());
  }
}
