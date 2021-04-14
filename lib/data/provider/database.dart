import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stock_companion/models/stock_price.dart';

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

  _runDbQueryWithTryCatch(String query, Database db) async {
    var _q = "$query";
    try {
      await db.rawQuery(_q);
    } catch (e) {
      print("error : $e running this query: $query ");
      print(e);
    }
  }

  addCompany(Map<String, dynamic> map) async {}

  addAllCompanies(List<StockPrice> list) async {
    var _db = await db;

    var res = await _db.query(stocks_table);

    try {
      if (res.isEmpty) {
        Batch batch = _db.batch();

        list.forEach((e) {
          Map<String, dynamic> comp = e.toDbMap();
          batch.insert(stocks_table, comp);
        });

        await batch.commit();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  listAllCompanies() async {
    try {
      var _db = await db;
      final res = await _db.query(stocks_table);
      return res;
    } catch (e) {
      print(e);
    }
  }

  addPortfolioCompany(Map<String, dynamic> map) async {
    try {
      var _db = await db;
      final res = await _db.insert(portfolio_stocks, map);
      return res;
    } catch (e) {}
  }

  listAllPortfolioCompanies() async {
    try {
      var _db = await db;
      final res = await _db.query(stocks_table);
      return res;
    } catch (e) {
      print(e);
    }
  }

  Future<Database> initDatabase() async {
    var _path = (await getApplicationDocumentsDirectory()).path;

    var _dataDir = Directory(join(_path, "data"));
    if (!_dataDir.existsSync()) _dataDir.createSync(recursive: true);

    var _dbPath = join(_path, "data", db_name);

    final int _dbVersion = migrationScripts.length;

    _db = await openDatabase(_dbPath, version: _dbVersion,
        onOpen: (version) async {
      print("db version: $_dbVersion");

      for (int i = 1; i <= _dbVersion; i++) {
        print(migrationScripts[i]);
        print("\n");
        print(i.toString());

        await _runDbQueryWithTryCatch(migrationScripts[i], version);
      }
    }, onUpgrade: (db, oldVersion, newVersion) async {
      // for (int i = oldVersion + 1; i < _dbVersion; i++) {
      //   print(migrationScripts[i]);
      //   print("\n");
      //   await _runDbQueryWithTryCatch(migrationScripts[i]);
      // }
    });
  }
}
