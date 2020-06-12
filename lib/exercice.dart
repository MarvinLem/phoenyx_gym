import 'package:flutter/material.dart';
import './database/exercicesDefaultDatabase.dart';

class Exercice extends StatefulWidget {
  int exerciceDefaultId;

  Exercice({this.exerciceDefaultId});

  @override
  State<StatefulWidget> createState() {
    return ExerciceState(exerciceDefaultId: exerciceDefaultId);
  }
}

class ExerciceState extends State<Exercice> {
  int exerciceDefaultId;

  ExerciceState({this.exerciceDefaultId});

  ExercicesDefaultDatabase db = ExercicesDefaultDatabase();

  setDescriptionFromArray(descriptionArray) {
    return Column(children: [
      for (var description in descriptionArray)
        Row(children: [
          Column(
            children: [
              Container(
                child: Text(
                    description,
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                    textAlign: TextAlign.left),
                alignment: Alignment.topLeft,
                margin: new EdgeInsets.only(left: 20.0, top: 10.0),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 40),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          )
        ])
    ]);
  }

  getDefaultExerciceById(id) {
    return FutureBuilder(
        future: db.getExercicesById(id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var descriptionArray = snapshot.data[0]['description']
                .replaceAll('. ', '.. ')
                .split('. ');
            return ListView(children: [
              Row(children: [
                Container(
                    child: new Text(snapshot.data[0]['name'].toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFD34B4B),
                            fontWeight: FontWeight.bold)),
                    margin: new EdgeInsets.only(left: 20.0, top: 20.0)),
              ]),
              Row(children: [
                Container(
                  child: new Text("Description".toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFD34B4B),
                          fontWeight: FontWeight.bold)),
                  margin: new EdgeInsets.only(left: 20.0, top: 20.0),
                )
              ]),
              setDescriptionFromArray(descriptionArray),
              Row(children: [
                Container(
                  child: new Text("Zone travaillée".toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFD34B4B),
                          fontWeight: FontWeight.bold)),
                  margin: new EdgeInsets.only(left: 20.0, top: 20.0),
                )
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 2.0, color: Color(0xFFD34B4B)),
                          image: DecorationImage(
                            image: ExactAssetImage('assets/images/' + snapshot.data[0]['area'] + '.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        margin: new EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        padding: new EdgeInsets.symmetric(
                            horizontal: 55, vertical: 55),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              Row(
                children: [
                  Container(
                    child: RaisedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Retourner à la liste des exercices',
                            style: TextStyle(fontSize: 18)),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        color: Color(0xFFD34B4B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    alignment: Alignment.center,
                    margin: new EdgeInsets.only(top: 10.0, bottom: 30),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ]);
          } else {
            return Center();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Phoenix Gym'),
        ),
        body: getDefaultExerciceById(exerciceDefaultId));
  }
}
