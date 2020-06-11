import 'package:sqflite/sqflite.dart';

class AllDatabase {
  Database db;
  initDB() async {
    db = await openDatabase('phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
      //create tables
        db.execute(
          "CREATE TABLE exercices(id INTEGER PRIMARY KEY, name TEXT, series INTEGER, repetitions INTEGER, weight INTEGER, rest INTEGER, exerciceOrder INTEGER, trainingId INTEGER, sessionId INTEGER)",
        );
        db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, birthday INTEGER, size INTEGER, weight INTEGER, gender TEXT, sessions INTEGER)",
        );
        db.execute(
          "CREATE TABLE training(id INTEGER PRIMARY KEY, name TEXT, session INTEGER, duration INTEGER, done INTEGER, predefined INTEGER)",
        );
        db.execute(
          "CREATE TABLE seance(id INTEGER PRIMARY KEY, trainingId INTEGER)",
        );
        db.execute(
          "CREATE TABLE session(id INTEGER PRIMARY KEY, seance INTEGER, week INTEGER, sessionNumber INTEGER, date INTEGER, startAt INTEGER, endAt INTEGER, trainingId INTEGER, seanceId INTEGER, done BOOLEAN)",
        );
        //add user
        db.execute(''' INSERT INTO user (id, birthday, size, weight, gender, sessions) VALUES (1,null,null,null,null,null) ''');
        //add predefined program
        //training
        db.execute(''' INSERT INTO training (id, name, session, duration, done, predefined) VALUES (1,?,3,3,0,1) ''',['Entrainements jambes']);
        //seances
        db.execute(''' INSERT INTO seance (id, trainingId) VALUES (1,1) ''');
        db.execute(''' INSERT INTO seance (id, trainingId) VALUES (2,1) ''');
        db.execute(''' INSERT INTO seance (id, trainingId) VALUES (3,1) ''');
        //sessions
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (1,1,1,1,null,null,null,1,1,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (2,2,1,1,null,null,null,1,2,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (3,3,1,1,null,null,null,1,3,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (4,1,2,2,null,null,null,1,1,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (5,2,2,2,null,null,null,1,2,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (6,3,2,2,null,null,null,1,3,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (7,1,3,3,null,null,null,1,1,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (8,2,3,3,null,null,null,1,2,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (9,3,3,3,null,null,null,1,3,0) ''');
      },
    );
  }
}