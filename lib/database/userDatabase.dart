import 'package:sqflite/sqflite.dart';

class UserModel{
  int id;
  int birthday;
  int size;
  int weight;
  String gender;

  UserModel({this.id,this.birthday,this.size,this.weight, this.gender});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'birthday': birthday,
      'size': size,
      'weight': weight,
      'gender': gender,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    birthday = map['birthday'];
    size = map['size'];
    weight = map['weight'];
    gender = map['gender'];
  }
}

class UserDatabase {
  Database db;

  initDB() async {
    db = await openDatabase(
      'phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, birthday INTEGER, size INTEGER, weight INTEGER, gender TEXT)",
        );
      },
    );
  }

  insert(UserModel user) async {
    await initDB();
    db.insert("user", user.toMap());
  }

  updateUser(int birthday, int size, int weight, String gender) async {
    await initDB();
    db.execute(''' INSERT OR REPLACE INTO user (id, birthday, size, weight, gender) VALUES (1,?,?,?,?) ''',[birthday, size, weight, gender]);
  }

  delete(int id) async {
    await initDB();
    db.delete(
      'user',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  getAllUser() async {
    await initDB();
    List<Map> results = await db.query("user");
    return results.map((map) => UserModel.fromMap(map));
  }

  getLastUser() async {
    await initDB();
    var results = await db.query("user", orderBy: "id DESC", limit: 1);
    return results;
  }

  getUserById(int id) async {
    await initDB();
    var results = await db.query("user", where: "id = ?", whereArgs: [id]);
    return results;
  }
}