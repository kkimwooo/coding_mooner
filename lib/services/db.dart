import 'package:sqflite/sqflite.dart';

class DB {
  static Database? _db;

  static Future<void> init() async {
    print("init DB");
    _db = await openDatabase(
      'coding_mooner.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS coding_mooner (id INTEGER PRIMARY KEY AUTOINCREMENT, question TEXT, answer TEXT, date TEXT)',
        );
      },
    );
  }

  static Future<void> insert(String question, String answer) async {
    await _db!.insert(
      'coding_mooner',
      {
        'question': question,
        'answer': answer,
        'date': DateTime.now().toString(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("inserted question: $question, answer: $answer, date: ${DateTime.now().toString()}");
  }

  //query one item
  static Future<Map<String, dynamic>> query(int id) async {
    List<Map<String, dynamic>> result = await _db!.query(
      'coding_mooner',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.first;
  }

  static Future<List<Map<String, dynamic>>> queryAll() async {
    return await _db!.query('coding_mooner');
  }

  static Future<void> delete(int id) async {
    await _db!.delete(
      'coding_mooner',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
