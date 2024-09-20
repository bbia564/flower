import 'package:get/get.dart';

import 'order_second_logic.dart';

class OrderSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderSecondLogic());
  }
}
