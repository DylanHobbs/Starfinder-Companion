import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:Starbuilder/models/toon.dart';

class DBProvider {
  String tableName = "TestToons";
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
    return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future<int> newToon(Character newToon) async {
    final db = await database;
    var res = await db.insert(tableName, newToon.toJson());
    return res;
  }

  Future<Character> getToon(int id) async {
    final db = await database;
    var res =await  db.query(tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Character.fromJson(res.first) : Null ;
  }

  Future<Character> getToonFromName(String name) async {
    final db = await database;
    var res =await  db.query(tableName, where: "name = ?", whereArgs: [name]);
    return res.isNotEmpty ? Character.fromJson(res.first) : Null ;
  }


  Future<List<Character>>getAllToons() async {
      final db = await database;
      var res = await db.query(tableName);
      List<Character> list =
          res.isNotEmpty ? res.map((c) => Character.fromJson(c)).toList() : [];
      return list;
    }

  Future<int> updateToon(Character newToon) async {
    final db = await database;
    var res = await db.update(tableName, newToon.toJson(),
        where: "id = ?", whereArgs: [newToon.id]);
    return res;
  }

  void deleteToon(int id) async {
    final db = await database;
    db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE ${tableName} ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "race TEXT,"
          "klass TEXT,"
          "level INTEGER"
          ")");
    });
  }
}


