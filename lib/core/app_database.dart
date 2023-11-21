import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instace = AppDatabase._();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'database.db'),
        version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_tarefa);
  }

  String get _tarefa => '''
      CREATE TABLE tarefa (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        titulo TEXT,
        descricao TEXT,
        status TEXT
      );
    ''';
}
