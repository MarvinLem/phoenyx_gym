import 'package:sqflite/sqflite.dart';

class SessionModel{
  int id;
  int seance;
  int date;
  int trainingId;

  SessionModel({this.id,this.seance,this.date,this.trainingId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'seance': seance,
      'date': date,
      'trainingId': trainingId,
    };
  }

  SessionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    seance = map['seance'];
    date = map['date'];
    trainingId = map['trainingId'];
  }
}

class SessionDatabase {
  Database db;

  initDB() async {
    db = await openDatabase(
      'phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE session(id INTEGER PRIMARY KEY, seance INTEGER, date DATETIME, trainingId INTEGER)",
        );
      },
    );
  }

  insert(SessionModel session) async {
    await initDB();
    db.insert("session", session.toMap());
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'session',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  deleteByTrainingId(int trainingId) async {
    await initDB();
    db.delete(
      'session',
      where: "trainingId = ?",
      whereArgs: [trainingId],
    );
  }

  getAllSession() async {
    await initDB();
    List<Map> results = await db.query("session");
    return results.map((map) => SessionModel.fromMap(map));
  }

  getLastSession() async {
    await initDB();
    var results = await db.query("session", orderBy: "id DESC", limit: 1);
    return results;
  }

  getSessionById(int id) async {
    await initDB();
    var results = await db.query("session", where: "id = ?", orderBy: "date ASC", whereArgs: [id]);
    return results;
  }

  getSessionByTrainingId(int trainingId) async {
    await initDB();
    var results = await db.query("session", where: "trainingId = ?", orderBy: "date ASC", whereArgs: [trainingId]);
    return results;
  }

  getSessionByTrainingIdAndDistinctDay(int trainingId) async {
    await initDB();
    var results = await db.query("session", columns: ['seance','id'],where: "trainingId = ?", orderBy: "date ASC", distinct: true, whereArgs: [trainingId]);
    return results;
  }
}