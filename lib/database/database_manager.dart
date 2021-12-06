import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager.internal();
  
  factory DatabaseManager() => _instance;

  DatabaseManager.internal();

  late Database _db;

  Future<Database> get db async {
    if (db != null) {
      return _db;
    }
    else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db");

    final database = await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute("""
        CREATE TABLE contacts(
          id INTEGER PRIMARY KEY,
          contact_name TEXT,
          contact_email TEXT,
          contact_phone TEXT,
          contact_image TEXT
        );      
      """);
    });

    return database;
  }
}