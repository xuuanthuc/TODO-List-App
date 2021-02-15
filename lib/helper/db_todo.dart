import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'todo.db'),
        onCreate: (db, version) {
      return db
          .execute('CREATE TABLE todo_list(id TEXT PRIMARY KEY, title TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
  static Future<List<Map<String, dynamic>>> getData(String table) async{
    final db = await DBHelper.database(); //truy cap vao CSDL
    return db.query(table);
  }
  // static Future<void> delete(String id) async{
  //   final db = await DBHelper.database();
  //   db.delete('todo_list', where: 'id  = ? ',whereArgs: [id]);
  // }
  static Future<void> delete(String table,
      {String where, List<dynamic> whereArgs}) async {
    final db = await DBHelper.database();
    return db.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }
}
