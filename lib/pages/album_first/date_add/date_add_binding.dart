import 'package:get/get.dart';

import 'date_add_logic.dart';

class DateAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DateAddLogic());
  }
}
