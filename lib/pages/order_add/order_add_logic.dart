import 'dart:typed_data';

import 'package:flower_order/db_order/db_order.dart';
import 'package:flower_order/db_order/order_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderAddLogic extends GetxController {

  DBOrder dbOrder = Get.find<DBOrder>();

  CargoEntity? entity = Get.arguments;

  String name = '';
  Uint8List? image;
  var inventory = 0.obs;
  String price = '';

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void changeInventory({bool isAdd = true}) {
    if (isAdd) {
      if (inventory.value >= 999999) {
        return;
      }
      inventory.value += 1;
    } else {
      if (inventory.value <= 0) {
        return;
      }
      inventory.value -= 1;
    }
  }

  void addCargo() async {
    if (name.isEmpty || image == null || price.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill in the information');
      return;
    }
    num priceNum = num.tryParse(price) ?? 0;
    price = priceNum.toString();
    update();
    if (entity == null) {
      final currentEntity = CargoEntity(
        id: 0,
        createTime: DateTime.now(),
        name: name,
        image: image!,
        inventory: inventory.value,
        price: price,
      );
      await dbOrder.insertCargo(currentEntity);
    } else {
      final currentEntity = CargoEntity(
        id: entity!.id,
        createTime: DateTime.now(),
        name: name,
        image: image!,
        inventory: inventory.value,
        price: price,
      );
      await dbOrder.updateCargo(currentEntity);
    }
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (entity != null) {
      name = entity!.name;
      image = entity!.image;
      inventory.value = entity!.inventory;
      price = entity!.price;
    }
    update();
    super.onInit();
  }

}
