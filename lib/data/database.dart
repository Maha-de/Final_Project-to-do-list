import 'package:final_project/models/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// class DatabaseHelper {
//   static const int _version = 1;
//   static const String _dbName = "Notes.db";
//
//   static Future<Database> _getDB() async {
//     return openDatabase(join(await getDatabasesPath(), _dbName),
//         onCreate: (db, version) async => await db.execute(
//             "CREATE TABLE Note(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL);"),
//         version: _version);
//   }
//
//   static Future<int> addNote(Task note) async {
//     final db = await _getDB();
//     return await db.insert("Note", note.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   static Future<int> updateNote(Task note) async {
//     final db = await _getDB();
//     return await db.update("Note", note.toJson(),
//         where: 'id = ?',
//         whereArgs: [note.id],
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   static Future<int> deleteNote(Task note) async {
//     final db = await _getDB();
//     return await db.delete(
//       "Note",
//       where: 'id = ?',
//       whereArgs: [note.id],
//     );
//   }
//
//   static Future<List<Task>?> getAllNotes() async {
//     final db = await _getDB();
//
//     final List<Map<String, dynamic>> maps = await db.query("Note");
//
//     if (maps.isEmpty) {
//       return null;
//     }
//
//     return List.generate(maps.length, (index) => Task.fromJson(maps[index]));
//   }
// }
