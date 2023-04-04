import 'package:employee_management_system/database/local/queries.dart';
import 'package:employee_management_system/database/local/tables.dart';
import 'package:sqflite/sqflite.dart';

class InitDB {
  static final InitDB instance = InitDB._init();
  InitDB._init();
  // allPossibilitiesDatabase allpossibilitydb = allPossibilitiesDatabase();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB(databaseName);
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbpath = await getDatabasesPath();
    final path = "$dbpath/$dbName";
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int i) async {
//---------------- Adding Tables ------------------------------
    await db.execute(createTableforEmployee);
    await db.execute(createTableforAdmin);
    await db.execute(
        "Insert into $adminTable values(?,'admin','admin@123','Jack','General Manager','9876543210',1)");
  }
}
