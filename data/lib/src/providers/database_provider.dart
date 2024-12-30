import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  static Database? _database;

  final String _generateUUID =
      "(lower(hex(randomblob(4)) || '-' || hex(randomblob(2)) || '-4' || substr(hex(randomblob(2)), 2) || '-' || substr('89ab', abs(random() % 4) + 1, 1) || substr(hex(randomblob(2)), 2) || '-' || hex(randomblob(6))))";

  factory DatabaseProvider() {
    return _instance;
  }

  DatabaseProvider._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'app_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE folders(
        id TEXT PRIMARY KEY DEFAULT $_generateUUID,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE categories(
        id TEXT PRIMARY KEY DEFAULT $_generateUUID,
        name TEXT
      )
    ''');
  }

  Future<int> createFolder(Map<String, dynamic> row) async {
    final Database db = await database;
    return db.insert('folders', row);
  }

  Future<int> createCategory(Map<String, dynamic> row) async {
    final Database db = await database;
    return db.insert('categories', row);
  }

  Future<List<Map<String, dynamic>>> getFolders() async {
    final Database db = await database;
    return db.query('folders');
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final Database db = await database;
    return db.query('categories');
  }

  Future<int> deleteFolder(String id) async {
    final Database db = await database;
    return db.delete('folders', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteCategory(String id) async {
    final Database db = await database;
    return db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }
}
