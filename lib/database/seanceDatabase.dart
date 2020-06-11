import 'package:sqflite/sqflite.dart';

class SeanceModel{
  int id;
  int trainingId;

  SeanceModel({this.id,this.trainingId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'trainingId': trainingId,
    };
  }

  SeanceModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    trainingId = map['trainingId'];
  }
}

class SeanceDatabase {
  Database db;

  initDB() async {
    db = await openDatabase('phoenix_database.db');
  }

  insert(SeanceModel seance) async {
    await initDB();
    db.insert("seance", seance.toMap());
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'seance',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  deleteByTrainingId(int trainingId) async {
    await initDB();
    db.delete(
      'seance',
      where: "trainingId = ?",
      whereArgs: [trainingId],
    );
  }

  getAllSeance() async {
    await initDB();
    List<Map> results = await db.query("seance");
    return results.map((map) => SeanceModel.fromMap(map));
  }

  getLastSeances(limit) async {
    await initDB();
    var results = await db.query("seance", orderBy: "id DESC", limit: limit);
    return results;
  }

  getSeanceById(int id) async {
    await initDB();
    var results = await db.query("seance", where: "id = ?", whereArgs: [id]);
    return results;
  }

  getSeanceByTrainingId(int trainingId) async {
    await initDB();
    var results = await db.query("seance", where: "trainingId = ?", whereArgs: [trainingId]);
    return results;
  }
}