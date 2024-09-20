import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'cargo_item.dart';
import 'order_first_logic.dart';

class OrderFirstPage extends GetView<OrderFirstLogic> {
  Widget _item(int index, String content) {
    final titles = ['Today order','Today income', 'Total Revenue'];
    return Expanded(
        child: <Widget>[
      Text(
        content,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      Text(
        titles[index],
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      )
    ].toColumn(mainAxisAlignment: MainAxisAlignment.center));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: <Widget>[
        const SizedBox(
          height: 70,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          width: double.infinity,
          height: 214,
          child: <Widget>[
            const Text(
              'Flower goods are easy to sell',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 94,
              child: <Widget>[
                _item(0, controller.topTextNum0.value.toString()),
                _item(1, controller.topTextNum1.value.toString()),
                _item(2, controller.topTextNum2.value.toString())
              ].toRow(),
            ).decorated(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Colors.white, Color(0xffe3f5f2)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter))
          ].toColumn(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start),
        ).decorated(
            image: const DecorationImage(
                image: AssetImage('assets/bg.webp'), fit: BoxFit.cover)),
        Expanded(
            child: Container(
          child: Obx(() {
            return controller.list.value.isEmpty
                ? const Center(child: Text('No data'))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: controller.list.value.length,
                    itemBuilder: (_, index) {
                      final entity = controller.list.value[index];
                      return CargoItem(
                        entity,
                        refresh: () {
                          controller.getData();
                        },
                      ).gestures(onTap: () {
                        Get.toNamed('/orderAdd', arguments: entity)
                            ?.then((_) {
                          controller.getData();
                        });
                      });
                    });
          }),
        )
                .decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
                .marginAll(15))
      ].toColumn(),
    );
  }
}
