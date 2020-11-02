import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'migrations/migration_script.dart';

class DbHelper {
  static DbHelper _instance = DbHelper._();

  DbHelper._();
  factory DbHelper() => _instance;

  static Database _db;

  static const db_name = "data.db";
  Future<Database> get db async {
    if (_db == null) {
      return initDatabase();
    } else
      return _db;
  }

  _runDbQueryWithTryCatch(String query) async {
    try {
      _db.rawQuery(query);
    } catch (e) {
      print("error running this query: $query");
      print(e);
    }
  }

  Future<Database> initDatabase() async {
    var _path = (await getApplicationDocumentsDirectory()).path;

    var _dataDir = Directory(join(_path, "data"));
    if (!_dataDir.existsSync()) _dataDir.createSync(recursive: true);

    var _dbPath = join(_path, "data", db_name);

    final int _dbVersion = migrationScripts.length;

    _db = await openDatabase(_dbPath, version: _dbVersion, onOpen: (version) {
      for (int i = 1; i <= _dbVersion; i++) {
        print(migrationScripts[i]);
        print("\n");
        _runDbQueryWithTryCatch(migrationScripts[i]);
      }
    }, onUpgrade: (db, oldVersion, newVersion) {
      for (int i = oldVersion + 1; i < _dbVersion; i++) {
        print(migrationScripts[i]);
        print("\n");
        _runDbQueryWithTryCatch(migrationScripts[i]);
      }
    });
  }
}
