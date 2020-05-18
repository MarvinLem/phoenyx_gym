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
          "CREATE TABLE training(id INTEGER PRIMARY KEY, name TEXT, session INTEGER, duration INTEGER, done BOOLEAN)",
        );
        db.execute(
          "CREATE TABLE seance(id INTEGER PRIMARY KEY, trainingId INTEGER)",
        );
        db.execute(
          "CREATE TABLE session(id INTEGER PRIMARY KEY, seance INTEGER, week INTEGER, sessionNumber INTEGER, date INTEGER, startAt INTEGER, endAt INTEGER, trainingId INTEGER, seanceId INTEGER, done BOOLEAN)",
        );
        db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, birthday INTEGER, size INTEGER, weight INTEGER, gender TEXT, sessions INTEGER)",
        );
      },
    );
  }
}