import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:massenger/core/utils/const_value.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class AppDb {
  static Database? _db;
  Future<Database> get db async {
    if (_db == null) {
      return _db = await initDb();
    } else {
      return _db!;
    }
  }

  Future onUpgrade(Database db, int version, int old) async {}

  initDb() async {
    String p = await getDatabasesPath();
    String fullDbPath = join(p, "massenger.db");
    Database db = await openDatabase(fullDbPath,
        onCreate: onCreate, version: 1, onUpgrade: onUpgrade);
    return db;
  }

  FutureOr<void> onCreate(Database db, int version) {
//  'userId': userId,
//       'email': email,
//       'phone': phone,
//       'name': name,
//       'imagepathe': imagepathe,
    db.execute('''
Create Table ${ConstValue.profile}(
   userId TEXT  PRIMARY KEY  NOT NULL,
   phone TEXT NULL,
   name TEXT NULL,
   email TEXT NULL,
   imagepathe TEXT NULL
)

   ''');
  }

  Future<void> insert(String s, Map<String, dynamic> map) async {
    Database x = await db;
    await x.insert(s, map);
  }

  Future<List<Map<String, Object?>>> readDate(String table) async {
    Database x = await db;
    return await x.query(table);
  }
}
