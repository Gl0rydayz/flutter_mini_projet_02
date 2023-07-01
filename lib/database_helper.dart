import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'symbols';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final String path = join(await getDatabasesPath(), 'operations.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            symbol TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertSymbol(String symbol) async {
    final Database db = await database;
    final List<Map<String, dynamic>> existingSymbols = await db.query(
      tableName,
      where: 'symbol = ?',
      whereArgs: [symbol],
    );

    if (existingSymbols.isEmpty) {
      await db.insert(
        tableName,
        {'symbol': symbol},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<String>> getSymbolsFromDb() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) => maps[index]['symbol']);
  }

  Future<void> deleteSymbol(String symbol) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'symbol = ?',
      whereArgs: [symbol],
    );
  }
}
