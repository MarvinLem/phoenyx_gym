import 'package:sqflite/sqflite.dart';

class SessionModel{
  int id;
  String name;
  int seance;
  int week;
  int sessionNumber;
  int date;
  int startAt;
  int endAt;
  int trainingId;
  int seanceId;
  int done;

  SessionModel({this.id,this.name,this.seance,this.week,this.sessionNumber,this.date,this.startAt,this.endAt,this.trainingId,this.seanceId, this.done});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'seance': seance,
      'week': week,
      'sessionNumber': sessionNumber,
      'date': date,
      'startAt': startAt,
      'endAt': endAt,
      'trainingId': trainingId,
      'seanceId': seanceId,
      'done': done
    };
  }

  SessionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    seance = map['seance'];
    week = map['week'];
    sessionNumber = map['sessionNumber'];
    date = map['date'];
    startAt = map['startAt'];
    endAt = map['endAt'];
    trainingId = map['trainingId'];
    seanceId = map['seanceId'];
    done = map['done'];
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
          "CREATE TABLE session(id INTEGER PRIMARY KEY, seance INTEGER, week INTEGER, sessionNumber INTEGER, date INTEGER, startAt INTEGER, endAt INTEGER, trainingId INTEGER, seanceId INTEGER, done BOOLEAN)",
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

  updateDone(int done, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE session SET done = ? WHERE id = ? ''',[done, id]);
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

  getNextSession(trainingId, seanceId, sessionNumber) async {
    await initDB();
    var results = await db.query("session", where: "trainingId = ? AND seanceId = ? AND sessionNumber = ?",  whereArgs: [trainingId, seanceId, sessionNumber]);
    return results;
  }

  getNextSessions(trainingId, seanceId, date) async {
    await initDB();
    var results = await db.query("session", where: "trainingId = ? AND seanceId = ? AND date > ?",  whereArgs: [trainingId, seanceId, date]);
    return results;
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

  getSessionBySeanceId(int seanceId) async {
    await initDB();
    var results = await db.query("session", where: "seanceId = ?", orderBy: "date ASC", whereArgs: [seanceId]);
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