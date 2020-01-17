import 'package:sqflite/sqflite.dart';

class AllDatabase {
  Database db;

  initDB() async {
    db = await openDatabase(
      'phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE exercices(id INTEGER PRIMARY KEY, name TEXT, series INTEGER, repetitions INTEGER, weight INTEGER, rest INTEGER, exerciceOrder INTEGER, trainingId INTEGER, sessionId INTEGER)",
        );
        db.execute(
          "CREATE TABLE training(id INTEGER PRIMARY KEY, name TEXT, session INTEGER, duration INTEGER)",
        );
        db.execute(
          "CREATE TABLE session(id INTEGER PRIMARY KEY, day TEXT, date DATETIME, trainingId INTEGER)",
        );
      },
    );
  }
}