import 'package:flower_order/db_order/db_order.dart';
import 'package:flower_order/db_order/order_entity.dart';
import 'package:get/get.dart';

class OrderListLogic extends GetxController {

  DBOrder dbOrder = Get.find<DBOrder>();

  var list = <OrderEntity>[].obs;

  void getData() async {
    list.value = await dbOrder.getOrderAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
