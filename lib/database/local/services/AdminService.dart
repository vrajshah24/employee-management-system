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
    final res = await db.rawQuery('Select * from $adminTable where id = $id');
    print(res);
    return res[0];
  }

  static fetchAll() async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery('Select * from $adminTable where status = 1');
    return res.map((e) => Admin.fromJson(e)).toList();
  }

  static update(int id, Admin admin) async {
    final db = await openDatabase(databaseName);
    final res = await db.update(adminTable, admin.toJson(), where: 'id= $id');
    return res.toString();
  }

  static login(username, password) async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery(
        'Select id from $adminTable where username  = "$username" AND password = "$password"');
    print(res[0]['id']);
    return res[0]["id"];
  }
}
