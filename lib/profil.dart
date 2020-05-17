import 'package:flutter/material.dart';
import './editProfil.dart';
import './database/userDatabase.dart';

class User {
  int size;
  int weight;
  int birthday;
  String gender;

  User({this.size, this.weight, this.birthday, this.gender});
}

class Profil extends StatefulWidget {
  final Function pageSelected;

  Profil({this.pageSelected});

  @override
  State<StatefulWidget> createState() {
    return ProfilState(pageSelected: pageSelected);
  }
}

class ProfilState extends State<Profil> {
  final Function pageSelected;
  var user;
  UserDatabase db = UserDatabase();

  ProfilState({this.pageSelected});

  @override
  void initState() {
    getUser();
  }

  getUser() async {
    user = await db.getLastUser();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(
        children: [
          Container(
              child: new Text("Profil".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD34B4B),
                      fontWeight: FontWeight.bold)),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 20.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/profil.png'),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: BoxConstraints(minWidth: 130.0, minHeight: 130.0))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty) ? Container(
              child: new Text("Date de naissance:   ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                  )),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10)) : Container(
              child: new Text("Date de naissance: " + new DateTime.fromMillisecondsSinceEpoch(
                  user[0]['birthday'])
                  .day
                  .toString() +
                  "/" +
                  new DateTime.fromMillisecondsSinceEpoch(
                      user[0]['birthday'])
                      .month
                      .toString() +
                  "/" +
                  new DateTime.fromMillisecondsSinceEpoch(
                      user[0]['birthday'])
                      .year
                      .toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                  )),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty) ? Container(
              child: new Text("Taille:   ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                  )),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10)) : Container(
              child: new Text("Taille: " + user[0]['size'].toString() + "cm",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                  )),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty) ? Container(
              child: new Text("Poids:   ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                  )),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10)) : Container(
              child: new Text("Poids: "  + user[0]['weight'].toString() + "kg",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                  )),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
              child: new Text("Sexe: Homme",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                  )),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfil()),
                  ).then((_) {
                    setState(() {
                      getUser();
                    });
                  });
                },
                child: Text('Modifier le profil', style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
              ),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10),),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
