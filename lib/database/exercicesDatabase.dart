import 'package:sqflite/sqflite.dart';

class ExercicesModel{
  int id;
  String name;
  int series;
  int repetitions;
  int weight;
  int rest;
  int exerciceOrder;
  int trainingId;
  int sessionId;

  ExercicesModel({this.id,this.name,this.series,this.repetitions,this.weight,this.rest,this.exerciceOrder,this.trainingId,this.sessionId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'series': series,
      'repetitions': repetitions,
      'weight': weight,
      'rest': rest,
      'exerciceOrder': exerciceOrder,
      'trainingId': trainingId,
      'sessionId': sessionId
    };
  }

  ExercicesModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    series = map['series'];
    repetitions = map['repetitions'];
    weight = map['weight'];
    rest = map['rest'];
    exerciceOrder = map['exerciceOrder'];
    trainingId = map['trainingId'];
    sessionId = map['sessionId'];
  }
}

class ExercicesDatabase {
  Database db;

  initDB() async {
    db = await openDatabase(
      'phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE exercices(id INTEGER PRIMARY KEY, name TEXT, series INTEGER, repetitions INTEGER, weight INTEGER, rest INTEGER, exerciceOrder INTEGER, trainingId INTEGER, sessionId INTEGER)",
        );
      },
    );
  }

  insert(ExercicesModel exercices) async {
    await initDB();
    db.insert("exercices", exercices.toMap());
  }

  updateSeries(int series, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET series = ? WHERE id = ? ''',[series, id]);
  }

  updateRepetitions(int repetitions, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET repetitions = ? WHERE id = ? ''',[repetitions, id]);
  }

  updateWeight(int weight, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET weight = ? WHERE id = ? ''',[weight, id]);
  }

  updateRest(int rest, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET rest = ? WHERE id = ? ''',[rest, id]);
  }

  updateExercice(int series, int repetitions, int weight, int rest, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET series = ?, repetitions = ?, weight = ?, rest = ? WHERE id = ? ''',[series, repetitions, weight, rest, id]);
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'exercices',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  deleteByTrainingId(int trainingId) async {
    await initDB();
    db.delete(
      'exercices',
      where: "trainingId = ?",
      whereArgs: [trainingId],
    );
  }

  deleteExercicesByTrainingId(trainingId) async {
    await initDB();
    db.delete(
      'exercices',
      where: "trainingId = ?",
      whereArgs: [trainingId],
    );
  }

  deleteExercicesByTrainingIdAndSessionId(trainingId,sessionId) async {
    await initDB();
    db.delete(
      'exercices',
      where: "trainingId = ? AND sessionId = ?",
      whereArgs: [trainingId,sessionId],
    );
  }

  getAllExercices() async {
    await initDB();
    List<Map> results = await db.query("exercices");
    return results.map((map) => ExercicesModel.fromMap(map));
  }

  getExercicesById(int id) async {
    await initDB();
    var results = await db.query("exercices", where: "id = ?", whereArgs: [id]);
    return results;
  }

  getExercicesByTrainingIdAndSessionId(int trainingId, int sessionId) async {
    await initDB();
    List<Map> results = await db.query("exercices", where: "trainingId = ? AND sessionId = ?", orderBy: "exerciceOrder ASC", whereArgs: [trainingId,sessionId]);
    return results.map((map) => ExercicesModel.fromMap(map));
  }

  getExercicesByTrainingIdAndSessionIdAndOrder(int trainingId, int sessionId, int order) async {
    await initDB();
    var results = await db.query("exercices", where: "exerciceOrder = ? AND trainingId = ? AND sessionId = ?", whereArgs: [order,trainingId,sessionId]);
    return results;
  }
}