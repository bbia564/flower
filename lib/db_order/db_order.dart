import 'package:flower_order/db_order/order_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBOrder extends GetxService {
  late Database dbBase;

  Future<DBOrder> init() async {
    await createOrderDB();
    return this;
  }

  createOrderDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'order.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createCargoTable(db);
      await createOrderTable(db);
    });
  }

  createCargoTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS cargo (id INTEGER PRIMARY KEY, createTime TEXT, name TEXT, image BLOB, inventory INTEGER, price TEXT)');
  }

  createOrderTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS orders (id INTEGER PRIMARY KEY, createTime TEXT, image BLOB, name TEXT, sellNumber INTEGER, totalPrice TEXT)');
  }

  insertCargo(CargoEntity entity) async {
    final id = await dbBase.insert('cargo', {
      'createTime': entity.createTime.toIso8601String(),
      'name': entity.name,
      'image': entity.image,
      'inventory': entity.inventory,
      'price': entity.price
    });
    return id;
  }

  updateCargo(CargoEntity entity) async {
    await dbBase.update(
        'cargo',
        {
          'name': entity.name,
          'image': entity.image,
          'inventory': entity.inventory,
          'price': entity.price
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  insertOrder(OrderEntity entity) async {
    final id = await dbBase.insert('orders', {
      'createTime': entity.createTime.toIso8601String(),
      'image': entity.image,
      'name': entity.name,
      'sellNumber': entity.sellNumber,
      'totalPrice': entity.totalPrice
    });
    return id;
  }

  cleanAllData() async {
    await dbBase.delete('orders');
    await dbBase.delete('cargo');
  }

  Future<List<CargoEntity>> getCargoAllData() async {
    var result = await dbBase.query('cargo', orderBy: 'createTime DESC');
    return result.map((e) => CargoEntity.fromJson(e)).toList();
  }

  Future<List<OrderEntity>> getOrderAllData() async {
    var result = await dbBase.query('orders', orderBy: 'createTime DESC');
    return result.map((e) => OrderEntity.fromJson(e)).toList();
  }
}
