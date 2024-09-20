import 'package:flower_order/db_order/db_order.dart';
import 'package:flower_order/db_order/order_entity.dart';
import 'package:get/get.dart';

class OrderFirstLogic extends GetxController {
  DBOrder dbOrder = Get.find<DBOrder>();

  var topTextNum0 = 0.obs;
  var topTextNum1 = 0.0.obs;
  var topTextNum2 = 0.0.obs;

  var list = <CargoEntity>[].obs;

  void getData() async {
    list.value = await dbOrder.getCargoAllData();
    final orderResult = await dbOrder.getOrderAllData();
    final todayOrders = orderResult
        .where((element) =>
            element.createTime.year == DateTime.now().year &&
            element.createTime.month == DateTime.now().month &&
            element.createTime.day == DateTime.now().day)
        .toList();
    topTextNum0.value = todayOrders.length;
    topTextNum1.value = todayOrders.fold<double>(0.0, (previousValue, element) =>
        previousValue + (double.tryParse(element.totalPrice) ?? 0.0));
    topTextNum2.value = orderResult.fold<double>(0.0, (previousValue, element) =>
        previousValue + (double.tryParse(element.totalPrice) ?? 0.0));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
