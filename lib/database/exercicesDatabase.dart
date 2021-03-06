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
    db = await openDatabase('phoenix_database.db');
  }

  insert(ExercicesModel exercices) async {
    await initDB();
    db.insert("exercices", exercices.toMap());
  }

  updateSeries(int series, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET series = ? WHERE id = ? ''',[series, id]);
  }

  updateMultipleSeries(int series, int seanceId, String name, int trainingId, int exerciceOrder) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET series = ? WHERE sessionId IN (SELECT id
                  FROM session
                  WHERE seanceId = ? AND done = 0) AND name = ? AND exerciceOrder = ? AND trainingId = ? ''',[series, seanceId, name, exerciceOrder, trainingId]);
  }

  updateRepetitions(int repetitions, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET repetitions = ? WHERE id = ? ''',[repetitions, id]);
  }

  updateMultipleRepetitions(int repetitions, int seanceId, String name, int trainingId, int exerciceOrder) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET repetitions = ? WHERE sessionId IN (SELECT id
                  FROM session
                  WHERE seanceId = ? AND done = 0) AND name = ? AND exerciceOrder = ? AND trainingId = ?''',[repetitions, seanceId, name, exerciceOrder, trainingId]);
  }

  updateWeight(int weight, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET weight = ? WHERE id = ? ''',[weight, id]);
  }

  updateMultipleWeight(int weight, int seanceId, String name, int trainingId, int exerciceOrder) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET weight = ? WHERE sessionId IN (SELECT id
                  FROM session
                  WHERE seanceId = ? AND done = 0) AND name = ? AND exerciceOrder = ? AND trainingId = ? ''',[weight, seanceId, name, exerciceOrder, trainingId]);
  }

  updateRest(int rest, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET rest = ? WHERE id = ? ''',[rest, id]);
  }

  updateMultipleRest(int rest, int seanceId, String name, int trainingId, int exerciceOrder) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET rest = ? WHERE sessionId IN (SELECT id
                  FROM session
                  WHERE seanceId = ? AND done = 0) AND name = ? AND exerciceOrder = ? AND trainingId = ? ''',[rest, seanceId, name, exerciceOrder, trainingId]);
  }

  updateOrder(int exerciceOrder, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET exerciceOrder = ? WHERE id = ? ''',[exerciceOrder, id]);
  }

  updateMultipleOrder(int exerciceOrder, int seanceId, int trainingId, String name) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET exerciceOrder = ? WHERE sessionId IN (SELECT id
                  FROM session
                  WHERE seanceId = ? AND done = 0) AND name = ? AND trainingId = ? ''',[exerciceOrder, seanceId, name, trainingId]);
  }

  updateExercice(int series, int repetitions, int weight, int rest, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET series = ?, repetitions = ?, weight = ?, rest = ? WHERE id = ? ''',[series, repetitions, weight, rest, id]);
  }

  updateMultipleExercice(int series, int repetitions, int weight, int rest, int sessionId, String name, int exerciceOrder) async {
    await initDB();
    db.rawUpdate(''' UPDATE exercices SET series = ?, repetitions = ?, weight = ?, rest = ? WHERE sessionId = ? AND name = ? AND exerciceOrder = ? ''',[series, repetitions, weight, rest, sessionId, name, exerciceOrder]);
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'exercices',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  deleteMultiple(int seanceId, String name, int trainingId) async {
    await initDB();
    db.rawDelete(''' DELETE FROM exercices WHERE sessionId IN (SELECT id
                  FROM session
                  WHERE seanceId = ? AND done = 0) AND name = ? AND trainingId = ?''',[seanceId, name, trainingId]);
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

  getExercicesByTrainingIdAndSeanceId(int trainingId, int seanceId) async {
    await initDB();
    List<Map> results = await db.rawQuery(''' SELECT * FROM exercices WHERE sessionId IN (SELECT id
                  FROM session
                  WHERE seanceId = ?) AND trainingId = ? ORDER BY sessionId, exerciceOrder ASC ''',[seanceId, trainingId]);
    return results.map((map) => ExercicesModel.fromMap(map));
  }

  getExercicesByTrainingIdAndSessionIdAndOrder(int trainingId, int sessionId, int order) async {
    await initDB();
    var results = await db.query("exercices", where: "exerciceOrder = ? AND trainingId = ? AND sessionId = ?", whereArgs: [order,trainingId,sessionId]);
    return results;
  }

  getExercicesByTrainingIdAndSessionIdAndName(int trainingId, int sessionId, String name) async {
    await initDB();
    var results = await db.query("exercices", where: "trainingId = ? AND sessionId = ? AND name = ?", whereArgs: [trainingId,sessionId, name]);
    return results;
  }

  getExercicesByTrainingIdAndSessionIdAndOrderAndName(int trainingId, int sessionId, int order, String name) async {
    await initDB();
    var results = await db.query("exercices", where: "exerciceOrder = ? AND trainingId = ? AND sessionId = ? AND name = ?", whereArgs: [order,trainingId,sessionId, name]);
    return results;
  }
}