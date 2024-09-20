import 'package:flower_order/main.dart';
import 'package:flower_order/pages/order_add/order_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'order_add_logic.dart';

class OrderAddPage extends GetView<OrderAddLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderAddLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.entity == null ? 'Add cargo' : 'Edit cargo'),
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Cargo name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 44,
                    child: OrderTextField(
                        value: controller.name,
                        maxLength: 20,
                        onChange: (value) {
                          controller.name = value;
                        }),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300))
                      .marginSymmetric(vertical: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: controller.image == null
                          ? const Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.grey,
                            )
                          : Image.memory(
                              controller.image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ).decorated(color: Colors.grey.shade200).gestures(onTap: (){
                      controller.imageSelected();
                    }),
                  )
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Inventory',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: <Widget>[
                      Image.asset(
                        'assets/sub.webp',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ).gestures(onTap: () {
                        controller.changeInventory(isAdd: false);
                      }),
                      Obx(() {
                        return Text(
                          controller.inventory.value.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        );
                      }),
                      Image.asset(
                        'assets/add.webp',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ).gestures(onTap: () {
                        controller.changeInventory();
                      })
                    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Unit price',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 44,
                    child: OrderTextField(
                        value: controller.price,
                        maxLength: 8,
                        isNumber: true,
                        onChange: (value) {
                          controller.price = value;
                        }),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300))
                      .marginSymmetric(vertical: 10),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Commit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12))
                      .marginSymmetric(vertical: 10)
                      .gestures(onTap: () {
                        controller.addCargo();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ].toColumn(),
          ).marginAll(15)),
        ),
      );
    });
  }
}
