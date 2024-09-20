import 'package:get/get.dart';

import 'order_add_logic.dart';

class OrderAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderAddLogic());
  }
}
