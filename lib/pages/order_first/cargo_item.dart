import 'package:flower_order/db_order/db_order.dart';
import 'package:flower_order/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_order/order_entity.dart';

class CargoItem extends StatefulWidget {
  const CargoItem(this.entity, {this.refresh, Key? key}) : super(key: key);
  final CargoEntity entity;
  final VoidCallback? refresh;

  @override
  State<CargoItem> createState() => _CargoItemState();
}

class _CargoItemState extends State<CargoItem> {
  DBOrder dbOrder = Get.find<DBOrder>();

  int waitingSell = 0;

  void changeInventory({bool isAdd = true}) {
    if (isAdd) {
      if (waitingSell >= widget.entity.inventory) {
        return;
      }
      setState(() {
        waitingSell += 1;
      });
    } else {
      if (waitingSell <= 0) {
        return;
      }
      setState(() {
        waitingSell -= 1;
      });
    }
  }

  void showDialog() async {
    Get.dialog(SizedBox(
      width: double.infinity,
      child: <Widget>[
        Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 250,
            ),
            Container(
              width: double.infinity,
              height: 170,
              child: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Text(
                  widget.entity.name,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sell x$waitingSell',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0,
                      color: Colors.black),
                ),
                Divider(height: 20,color: Colors.grey[200],),
                <Widget>[
                  Expanded(
                      child: Container(
                    color: Colors.transparent,
                    child: const Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          decorationThickness: 0),
                    ),
                  ).gestures(onTap: () {
                    Get.back();
                  })),
                  Container(width: 1,height: 30,color: Colors.grey[200],),
                  Expanded(
                      child: Container(
                    color: Colors.transparent,
                    child: const Text(
                      'OK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          decorationThickness: 0),
                    ),
                  ).gestures(onTap: () async {
                    await dbOrder.insertOrder(OrderEntity(
                      id: 0,
                      createTime: DateTime.now(),
                      image: widget.entity.image,
                      name: widget.entity.name,
                      sellNumber: waitingSell,
                      totalPrice: (waitingSell *
                              (double.tryParse(widget.entity.price) ?? 0))
                          .toString(),
                    ));
                    final currentEntity = CargoEntity(
                        id: widget.entity.id,
                        createTime: widget.entity.createTime,
                        name: widget.entity.name,
                        image: widget.entity.image,
                        inventory: widget.entity.inventory - waitingSell,
                        price: widget.entity.price);
                    await dbOrder.updateCargo(currentEntity);
                    widget.refresh?.call();
                    setState(() {
                      waitingSell = 0;
                    });
                    Get.back();
                  }))
                ].toRow()
              ].toColumn(),
            )
                .decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
                .marginOnly(top: 40, left: 30, right: 30),
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                  widget.entity.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        )
      ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
    ));
  }

  void sellClick() {
    if (waitingSell <= 0) {
      Fluttertoast.showToast(msg: 'Sales cannot be zero');
      return;
    }
    showDialog();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          widget.entity.image,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: <Widget>[
          <Widget>[
            Expanded(
              child: <Widget>[
                Text(
                  widget.entity.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Inventory: ${widget.entity.inventory}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  'Unit price: ${widget.entity.price}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                )
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ),
            const SizedBox(
              width: 10,
            ),
            <Widget>[
              <Widget>[
                Image.asset(
                  'assets/sub.webp',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ).gestures(onTap: () {
                  changeInventory(isAdd: false);
                }),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  waitingSell.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/add.webp',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ).gestures(onTap: () {
                  changeInventory();
                })
              ].toRow(mainAxisAlignment: MainAxisAlignment.end),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 92,
                height: 33,
                alignment: Alignment.center,
                child: const Text(
                  'Sell',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              )
                  .decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8))
                  .gestures(onTap: () {
                sellClick();
              })
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)
          ].toRow(),
          Divider(
            height: 20,
            color: Colors.grey[200],
          )
        ].toColumn(),
      )
    ]
        .toRow(crossAxisAlignment: CrossAxisAlignment.start)
        .marginOnly(bottom: 10);
  }
}
