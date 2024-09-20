import 'package:get/get.dart';

import '../order_add/order_add_logic.dart';
import '../order_first/order_first_logic.dart';
import '../order_second/order_second_logic.dart';
import 'order_tab_logic.dart';

class OrderTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderTabLogic());
    Get.lazyPut(() => OrderFirstLogic());
    Get.lazyPut(() => OrderSecondLogic());
    Get.lazyPut(() => OrderAddLogic());
  }
}
