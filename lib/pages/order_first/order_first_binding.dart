import 'package:get/get.dart';

import 'order_first_logic.dart';

class OrderFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderFirstLogic());
  }
}
