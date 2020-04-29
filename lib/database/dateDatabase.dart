import 'package:sqflite/sqflite.dart';

class DateModel{
  int id;
  String name;
  int date;
  int startAt;
  int endAt;
  int sessionId;
  int trainingId;

  DateModel({this.id,this.date,this.startAt,this.endAt, this.sessionId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'startAt': startAt,
      'endAt': endAt,
      'sessionId': sessionId,
    };
  }

  DateModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    date = map['date'];
    startAt = map['startAt'];
    endAt = map['endAt'];
    sessionId = map['sessionId'];
    trainingId = map['trainingId'];
  }
}

class DateDatabase {
  Database db;

  initDB() async {
    db = await openDatabase(
      'phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE date(id INTEGER PRIMARY KEY, date INTEGER, startAt INTEGER, endAt INTEGER, sessionId INTEGER)",
        );
      },
    );
  }

  insert(DateModel date) async {
    await initDB();
    db.insert("date", date.toMap());
  }

  updateStart(int startAt, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE date SET startAt = ? WHERE id = ? ''',[startAt, id]);
  }

  updateEnd(int endAt, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE date SET endAt = ? WHERE id = ? ''',[endAt, id]);
  }

  updateDate(int date, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE date SET date = ? WHERE id = ? ''',[date, id]);
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'date',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  getAllDate() async {
    await initDB();
    List<Map> results = await db.query("date");
    return results.map((map) => DateModel.fromMap(map));
  }

  getDateById(int id) async {
    await initDB();
    var results = await db.query("date", where: "id = ?", whereArgs: [id]);
    return results;
  }

  getAllInformationsForHome(datetime) async {
    await initDB();
    List<Map> results = await db.rawQuery("SELECT training.name,training.id AS trainingId,date.date,date.startAt,date.endAt,date.sessionId,date.id FROM training INNER JOIN session ON session.trainingId = training.id INNER JOIN date ON date.sessionId = session.id WHERE date.date > ? ORDER BY date.date ASC LIMIT 2", [datetime]);
    return results.map((map) => DateModel.fromMap(map));
  }
}