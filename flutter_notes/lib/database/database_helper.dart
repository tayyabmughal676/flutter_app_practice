import 'package:flutter_notes/models/Task.dart';
import 'package:flutter_notes/models/Todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(join(await getDatabasesPath(), 'todo.db'),
        onCreate: (Database db, version) async {
      // Run the CREATE TABLE statement on the database.
      //
      // await Future.wait([
      // ]);

      await db
          .execute(
              "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)")
          .then((_) {});
      await db.execute(
          "CREATE TABLE myTodo(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, isDone INTEGER)");

      // return db;
    }, version: 1);
  }

  // Insert Task into Database Table
  Future<void> insertTask(Task task) async {
    Database _db = await database();
    await _db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Insert Todos into Database Table
  Future<void> insertTodo(Todo todo) async {
    Database _db = await database();
    await _db.insert('myTodo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Get Task From the Database
  Future<List<Task>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          description: taskMap[index]['description']);
    });
  }
}
