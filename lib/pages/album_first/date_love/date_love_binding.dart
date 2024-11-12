import 'package:get/get.dart';

import 'date_love_logic.dart';

class DateLoveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
