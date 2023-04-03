import 'package:sqflite/sqflite.dart';

import '../model/Admin.dart';
import '../tables.dart';

class AdminDatabase {
  static insert(Admin admin) async {
    final db = await openDatabase(databaseName);
    await db.insert(adminTable, admin.toJson());
  }

  static fetchbyId(int id) async {
    final db = await openDatabase(databaseName);
    final res = await db
        .rawQuery('Select * from $adminTable where id  = $id AND status = 1');
    return res;
  }

  static fetchAll() async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery('Select * from $adminTable where status = 1');
    return res;
  }

  static update(int id, Admin admin) async {
    final db = await openDatabase(databaseName);
    final res = await db.update(adminTable, admin.toJson(), where: 'id= $id');
    return res.toString();
  }
}
