import 'package:sqflite/sqflite.dart';

class TrainingModel{
  int id;
  String name;
  int session;
  int duration;
  int done;

  TrainingModel({this.id,this.name,this.session,this.duration, this.done});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'session': session,
      'duration': duration,
      'done': done,
    };
  }

  TrainingModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    session = map['session'];
    duration = map['duration'];
    done = map['done'];
  }
}

class TrainingDatabase {
  Database db;

  initDB() async {
    db = await openDatabase(
      'phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE training(id INTEGER PRIMARY KEY, name TEXT, session INTEGER, duration INTEGER, done BOOLEAN)",
        );
      },
    );
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
    List<Map> results = await db.query("training", where: "done = 0");
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
    var results = await db.query("training", columns: ['name','session', 'duration'], where: "id = ?", whereArgs: [trainingId]);
    return results;
  }

  getTrainingName(int trainingId) async {
    await initDB();
    var results = await db.query("training", columns: ['name'], where: "id = ?", whereArgs: [trainingId]);
    return results;
  }
}