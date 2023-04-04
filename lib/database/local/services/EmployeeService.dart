import 'package:employee_management_system/database/local/model/Employee.dart';
import 'package:sqflite/sqflite.dart';

import '../tables.dart';

class EmployeeDatabase {
  static insert(Employee employee) async {
    final db = await openDatabase(databaseName);
    var res = await db.insert(employeeTable, employee.toJson());
    print(res);
    return "Success";
  }

  static fetchbyId(int id) async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery('Select * from $employeeTable  ');
    print(res);
    return res[0];
  }

  static fetchAll() async {
    final db = await openDatabase(databaseName);
    final res =
        await db.rawQuery('Select * from $employeeTable where estatus = 1');
    return res.map((e) => Employee.fromJson(e)).toList();
  }

  static update(int id, Employee employee) async {
    final db = await openDatabase(databaseName);
    final res =
        await db.update(employeeTable, employee.toJson(), where: 'eid= $id');
    return res.toString();
  }

  static delete(int id) async {
    final db = await openDatabase(databaseName);
    final res =
        await db.rawQuery('Delete from $employeeTable where eid  =  $id');
  }

  static login(username, password) async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery(
        'Select eid from $employeeTable where eusername = "$username" AND epassword = "$password"');
    return res[0]["eid"];
  }
}
