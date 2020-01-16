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

  ExercicesModel({this.id,this.name,this.series,this.repetitions,this.weight,this.rest,this.exerciceOrder,this.trainingId});

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
          "CREATE TABLE exercices(id INTEGER PRIMARY KEY, name TEXT, series INTEGER, repetitions INTEGER, weight INTEGER, rest INTEGER, exerciceOrder INTEGER, trainingId INTEGER)",
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

  delete(int id) async {
    await initDB();
    db.delete(
      'exercices',
      where: "id = ?",
      whereArgs: [id],
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

  getExercicesByTrainingId(int trainingId) async {
    await initDB();
    List<Map> results = await db.query("exercices", where: "trainingId = ?", orderBy: "exerciceOrder ASC", whereArgs: [trainingId]);
    return results.map((map) => ExercicesModel.fromMap(map));
  }

  getExercicesByTrainingIdAndOrder(int trainingId, int order) async {
    await initDB();
    List<Map> results = await db.query("exercices", where: "exerciceOrder = ? AND trainingId = ?", whereArgs: [order,trainingId]);
    return results.map((map) => ExercicesModel.fromMap(map));
  }
}