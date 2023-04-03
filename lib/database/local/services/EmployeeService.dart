import 'package:employee_management_system/database/local/model/Employee.dart';
import 'package:sqflite/sqflite.dart';

import '../tables.dart';

class EmployeeDatabase {
  static insert(Employee employee) async {
    final db = await openDatabase(databaseName);
    await db.insert(employeeTable, employee.toJson());
  }

  static fetchbyId(int id) async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery(
        'Select * from $employeeTable where eid  = $id AND estatus = 1');
    return res;
  }

  static fetchAll() async {
    final db = await openDatabase(databaseName);
    final res =
        await db.rawQuery('Select * from $employeeTable where estatus = 1');
    return res;
  }

  static update(int id, Employee employee) async {
    final db = await openDatabase(databaseName);
    final res =
        await db.update(employeeTable, employee.toJson(), where: 'eid= $id');
    return res.toString();
  }
}
