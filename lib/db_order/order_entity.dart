import 'dart:typed_data';

import 'package:intl/intl.dart';

class OrderEntity {
  int id;
  DateTime createTime;
  Uint8List image;
  String name;
  int sellNumber;
  String totalPrice;

  OrderEntity({
    required this.id,
    required this.createTime,
    required this.image,
    required this.name,
    required this.sellNumber,
    required this.totalPrice
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      image: json['image'],
      name: json['name'],
      sellNumber: json['sellNumber'],
      totalPrice: json['totalPrice']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'image': image,
      'name': name,
      'sellNumber': sellNumber,
      'totalPrice': totalPrice
    };
  }

  String get createTimeStr {
    return DateFormat('yyyy/MM/dd HH:mm').format(createTime);
  }
}

class CargoEntity{
  int id;
  DateTime createTime;
  String name;
  Uint8List image;
  int inventory;
  String price;

  CargoEntity({
    required this.id,
    required this.createTime,
    required this.name,
    required this.image,
    required this.inventory,
    required this.price
  });

  factory CargoEntity.fromJson(Map<String, dynamic> json) {
    return CargoEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      name: json['name'],
      image: json['image'],
      inventory: json['inventory'],
      price: json['price']
    );
  }
}