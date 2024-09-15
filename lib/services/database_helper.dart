import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'barbearia.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE barbeiros (
        id INTEGER PRIMARY KEY,
        nome TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE clientes (
        id INTEGER PRIMARY KEY,
        nome TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE servicos (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        descricao TEXT
      )
    ''');
  }
}
