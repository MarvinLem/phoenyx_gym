import 'package:flutter/material.dart';
import './editProfil.dart';

class User {
  int height;
  int weight;
  DateTime birthday;
  String sexe;

  User({this.height, this.weight, this.birthday, this.sexe});
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

  ProfilState({this.pageSelected});

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
          Container(
              child: new Text("Voir ses photos",
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
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
              child: new Text("Date de naissance: 08/11/1983",
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
              child: new Text("Taille: 1M84",
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
              child: new Text("Poids: 82KG",
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
                  );
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
