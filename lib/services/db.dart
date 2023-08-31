import 'package:sqflite/sqflite.dart';

class DB {
  static Database? _db;

  static Future<void> init() async {
    _db = await openDatabase(
      'my_little_senior_dev.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS my_little_senior_dev (id INTEGER PRIMARY KEY AUTOINCREMENT, question TEXT, answer TEXT)',
        );
      },
    );
  }

  static Future<void> insert(String question, String answer) async {
    await _db!.insert(
      'my_little_senior_dev',
      {
        'question': question,
        'answer': answer,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //query one item
  static Future<Map<String, dynamic>> query(int id) async {
    List<Map<String, dynamic>> result = await _db!.query(
      'my_little_senior_dev',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.first;
  }

  static Future<List<Map<String, dynamic>>> queryAll() async {
    return await _db!.query('my_little_senior_dev');
  }

  static Future<void> delete(int id) async {
    await _db!.delete(
      'my_little_senior_dev',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
