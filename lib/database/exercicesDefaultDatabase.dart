import 'package:sqflite/sqflite.dart';

class ExercicesDefaultModel{
  int id;
  String name;
  String description;
  String area;
  int series;
  int repetitions;
  int weight;
  int rest;

  ExercicesDefaultModel({this.id,this.name,this.description,this.area, this.series,this.repetitions,this.weight,this.rest});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'area': area,
      'series': series,
      'repetitions': repetitions,
      'weight': weight,
      'rest': rest,
    };
  }

  ExercicesDefaultModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    area = map['area'];
    series = map['series'];
    repetitions = map['repetitions'];
    weight = map['weight'];
    rest = map['rest'];
  }
}

class ExercicesDefaultDatabase {
  Database db;

  initDB() async {
    db = await openDatabase('phoenix_database.db');
  }

  insert(ExercicesDefaultModel exercicesDefault) async {
    await initDB();
    db.insert("exercices_default", exercicesDefault.toMap());
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'exercices_default',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  getAllExercices() async {
    await initDB();
    List<Map> results = await db.query("exercices_default");
    return results.map((map) => ExercicesDefaultModel.fromMap(map));
  }

  getExercicesById(int id) async {
    await initDB();
    var results = await db.query("exercices_default", where: "id = ?", whereArgs: [id]);
    return results;
  }

  getExercicesByName(String name) async {
    await initDB();
    var results = await db.query("exercices_default", where: "name = ?", whereArgs: [name]);
    return results;
  }
}