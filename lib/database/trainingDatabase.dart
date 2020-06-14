import 'package:sqflite/sqflite.dart';

class TrainingModel{
  int id;
  String name;
  int session;
  int duration;
  int done;
  int predefined;

  TrainingModel({this.id,this.name,this.session,this.duration, this.done, this.predefined});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'session': session,
      'duration': duration,
      'done': done,
      'predefined': predefined,
    };
  }

  TrainingModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    session = map['session'];
    duration = map['duration'];
    done = map['done'];
    predefined = map['predefined'];
  }
}

class TrainingDatabase {
  Database db;

  initDB() async {
    db = await openDatabase('phoenix_database.db');
  }

  insert(TrainingModel training) async {
    await initDB();
    db.insert("training", training.toMap());
  }

  updateDone(int done, int id) async {
    await initDB();
    db.rawUpdate(''' UPDATE training SET done = ? WHERE id = ? ''',[done, id]);
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'training',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  getAllTraining() async {
    await initDB();
    List<Map> results = await db.query("training");
    return results.map((map) => TrainingModel.fromMap(map));
  }

  getAllTrainingNotDone() async {
    await initDB();
    List<Map> results = await db.query("training", where: "done = 0 AND predefined = 0");
    return results.map((map) => TrainingModel.fromMap(map));
  }

  getAllTrainingPredefined() async {
    await initDB();
    List<Map> results = await db.query("training", where: "predefined = 1");
    return results.map((map) => TrainingModel.fromMap(map));
  }

  getAllTrainingDone() async {
    await initDB();
    List<Map> results = await db.query("training", where: "done = 1");
    return results.map((map) => TrainingModel.fromMap(map));
  }

  getLastTraining() async {
    await initDB();
    var results = await db.query("training", orderBy: "id DESC", limit: 1);
    return results;
  }

  getTraining(int trainingId) async {
    await initDB();
    var results = await db.query("training", columns: ['name','session', 'duration', 'predefined'], where: "id = ?", whereArgs: [trainingId]);
    return results;
  }

  getTrainingName(int trainingId) async {
    await initDB();
    var results = await db.query("training", columns: ['name'], where: "id = ?", whereArgs: [trainingId]);
    return results;
  }
}