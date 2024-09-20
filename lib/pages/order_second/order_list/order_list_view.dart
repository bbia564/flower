import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'order_list_logic.dart';

class OrderListPage extends GetView<OrderListLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View order'),
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.memory(
                          entity.image,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: <Widget>[
                          <Widget>[
                            Expanded(
                                child: Text(
                              entity.name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sell x${entity.sellNumber}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            )
                          ].toRow(),
                          const SizedBox(
                            height: 10,
                          ),
                          <Widget>[
                            Expanded(
                                child: Text(
                              entity.createTimeStr,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Price: ${entity.totalPrice}',
                              style: const TextStyle(fontSize: 14),
                            )
                          ].toRow(),
                        ].toColumn(),
                      ),
                    ].toRow(),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))
                      .marginOnly(bottom: 10);
                });
      }),
    );
  }
}
