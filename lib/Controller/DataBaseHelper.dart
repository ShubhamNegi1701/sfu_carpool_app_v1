import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sfucarpoolapp/Model/Users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper _dataBaseHelper; // singleton DatabaseHelper
  static Database _database; // singleton Database

  static final String usersTable = 'Users';
  static final String colId = 'id';
  static final String colUsername = 'username';
  static final String colEmail = 'email';
  static final String colPassword = 'password';
  static final String colReputation = 'reputation';
  static final String col_driver_passenger = 'driver_passenger';

  DataBaseHelper._createInstance();
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DataBaseHelper._createInstance();
    }
    return _dataBaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'carpool_users.db';

    // open/create the database at a given path
    var usersDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return usersDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL,"
      "email TEXT NOT NULL, password TEXT NOT NULL, reputation INTEGER, drive_passenger INTEGER)",
    );
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    final Database db = await database;
    return await db.insert(
      'Users',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Users>> getUsersList() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return Users(
          id: maps[i]['id'],
          username: maps[i]['username'],
          email: maps[i]['email'],
          password: maps[i]['password'],
          reputation: maps[i]['reputation'],
          driver_passenger: maps[i]['driver_passenger']);
    });
  }

  Future<int> updateUser(Map<String, dynamic> row) async {
    final db = await database;
    int id = row[colId];
    return await db.update(
      'Users',
      row,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'Users',
      where: "$colId = ?",
      whereArgs: [id],
    );
  }
}
