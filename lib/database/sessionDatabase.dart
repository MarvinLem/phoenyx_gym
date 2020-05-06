import 'package:sqflite/sqflite.dart';

class SessionModel{
  int id;
  String name;
  int seance;
  int week;
  int date;
  int startAt;
  int endAt;
  int trainingId;

  SessionModel({this.id,this.name,this.seance,this.week,this.date,this.startAt,this.endAt,this.trainingId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'seance': seance,
      'week': week,
      'date': date,
      'startAt': startAt,
      'endAt': endAt,
      'trainingId': trainingId,
    };
  }

  SessionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    seance = map['seance'];
    week = map['week'];
    date = map['date'];
    startAt = map['startAt'];
    endAt = map['endAt'];
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
          "CREATE TABLE session(id INTEGER PRIMARY KEY, seance INTEGER, week INTEGER, date INTEGER, startAt INTEGER, endAt INTEGER, trainingId INTEGER)",
        );
      },
    );
  }

  insert(SessionModel session) async {
    await initDB();
    db.insert("session", session.toMap());
  }

  updateStart(int startAt, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE session SET startAt = ? WHERE id = ? ''',[startAt, id]);
  }

  updateEnd(int endAt, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE session SET endAt = ? WHERE id = ? ''',[endAt, id]);
  }

  updateDate(int date, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE session SET date = ? WHERE id = ? ''',[date, id]);
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

  getSessionByTrainingIdAndWeek(int trainingId, int week) async {
    await initDB();
    var results = await db.query("session", columns: ['seance','id', 'week'],where: "trainingId = ? AND week = ?", orderBy: "date ASC", distinct: true, whereArgs: [trainingId, week]);
    return results;
  }

  getAllInformationsForHome(datetime) async {
    await initDB();
    List<Map> results = await db.rawQuery("SELECT training.name AS name,session.trainingId,session.date,session.startAt,session.endAt,session.id FROM training INNER JOIN session ON session.trainingId = training.id WHERE session.startAt > ? ORDER BY session.startAt ASC LIMIT 2", [datetime]);
    return results.map((map) => SessionModel.fromMap(map));
  }
}