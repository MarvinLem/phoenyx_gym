import 'package:sqflite/sqflite.dart';

class TrainingModel{
  int id;
  String name;
  int session;
  int duration;

  TrainingModel({this.id,this.name,this.session,this.duration});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'session': session,
      'duration': duration,
    };
  }

  TrainingModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    session = map['session'];
    duration = map['duration'];
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
          "CREATE TABLE training(id INTEGER PRIMARY KEY, name TEXT, session INTEGER, duration INTEGER)",
        );
      },
    );
  }

  insert(TrainingModel training) async {
    db.insert("training", training.toMap());
  }

  getAllTraining() async {
    await initDB();
    List<Map> results = await db.query("training");
    //Changer l'image de fond (aléatoirement pour le moment)
    return results.map((map) => TrainingModel.fromMap(map));
  }
}