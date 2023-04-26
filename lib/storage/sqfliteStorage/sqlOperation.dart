import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  /// 2. create table with notes and column name as title and note
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        note TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""");
  }

  ///1. create database
  static Future<sql.Database> myData() async {
    return sql.openDatabase('myNotes.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  /// add datas to  notes table inside myNotes.db
  static Future<int> createNote(String title, String note) async {
    final db = await SQLHelper.myData(); ///to open database
    final data = {'title': title, 'note': note};
    final id = await db.insert("notes", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  /// read all data from table
  static Future<List<Map<String, dynamic>>> readNotes() async {
    final db = await SQLHelper.myData(); ///to open database
    return db.query('notes', orderBy: 'id');
  }

  ///read a single value from table
  static Future<List<Map<String, dynamic>>> readSingleValue(int id) async {
    final db = await SQLHelper.myData(); ///to open database
    return db.query('notes', where: 'id = ?', whereArgs: [id], limit: 1);
  }
}
