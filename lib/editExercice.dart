import 'package:flutter/material.dart';

import './database/exercicesDatabase.dart';

class ExerciceOptions {
  String name;
  int rest;
  int series;
  int repetitions;
  int weight;

  ExerciceOptions(this.name,this.rest,this.series,this.repetitions,this.weight);
}

class EditExercice extends StatefulWidget {
  int id;

  EditExercice({this.id});

  @override
  State<StatefulWidget> createState() {
    return EditExerciceState(id: id);
  }
}

class EditExerciceState extends State<EditExercice> {
  int id;
  ExercicesDatabase db = ExercicesDatabase();
  List<String> exercices = [];

  EditExerciceState({this.id});

  @override
  void initState() {
    getExercicesById(id);
  }

  exerciceDeleted(id) async{
    db.delete(id);
    Navigator.pop(context);
  }

  getExercicesById(id) {
    return FutureBuilder(
        future: db.getExercicesById(id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var exercicesOptions = new ExerciceOptions(snapshot.data[0]['name'],snapshot.data[0]['rest'],snapshot.data[0]['series'],snapshot.data[0]['repetitions'],snapshot.data[0]['weight']);
            return Column(children: [
                Column(children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: new Text(("Exercices - "+ exercicesOptions.name).toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFD34B4B),
                                    fontWeight: FontWeight.bold)),
                            margin: new EdgeInsets.only(top: 20.0, left: 20),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2.0, color: Color(0xFFD34B4B)),
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/images/' + exercicesOptions.name + '.png'),
                                fit: BoxFit.none,
                              ),
                            ),
                            constraints:
                                BoxConstraints(minWidth: 80.0, minHeight: 80.0),
                            margin: new EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                      children: [
                        Column(
                            children: [
                              Row(
                                  children: [
                                    Container(
                                        child: Text("Nombre de séries:",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87),
                                            textAlign: TextAlign.left)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center)
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                              onTap: () => setState(() {
                                if (exercicesOptions.series > 1) {
                                  db.updateSeries(exercicesOptions.series-1,id);
                                }
                              }),
                              child: new Icon(Icons.chevron_left,
                                  size: 30, color: Color(0xFFD34B4B)),
                            )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                  exercicesOptions.series.toString() + " séries",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                              onTap: () => setState(() {
                                db.updateSeries(exercicesOptions.series+1,id);
                              }),
                              child: new Icon(Icons.chevron_right,
                                  size: 30, color: Color(0xFFD34B4B)),
                            )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center),
                  Row(
                      children: [
                        Column(
                            children: [
                              Row(
                                  children: [
                                    Container(
                                        child: Text("Nombre de répétitions:",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87),
                                            textAlign: TextAlign.left))
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center)
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                              onTap: () => setState(() {
                                if (exercicesOptions.repetitions > 1) {
                                  db.updateRepetitions(exercicesOptions.repetitions-1,id);
                                }
                              }),
                              child: new Icon(Icons.chevron_left,
                                  size: 30, color: Color(0xFFD34B4B)),
                            )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                  exercicesOptions.repetitions.toString() +
                                      " répétitions",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                              onTap: () => setState(() {
                                db.updateRepetitions(exercicesOptions.repetitions+1,id);
                              }),
                              child: new Icon(Icons.chevron_right,
                                  size: 30, color: Color(0xFFD34B4B)),
                            )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center),
                  Row(
                      children: [
                        Column(
                            children: [
                              Row(
                                  children: [
                                    Container(
                                        child: Text("Poids:",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87),
                                            textAlign: TextAlign.left)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center)
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    if (exercicesOptions.weight > 0) {
                                      db.updateWeight(exercicesOptions.weight-1,id);
                                    }
                                  }),
                                  child: new Icon(Icons.chevron_left,
                                      size: 30, color: Color(0xFFD34B4B)),
                                )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                  exercicesOptions.weight.toString() + " kg",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    db.updateWeight(exercicesOptions.weight+1,id);
                                  }),
                                  child: new Icon(Icons.chevron_right,
                                      size: 30, color: Color(0xFFD34B4B)),
                                )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center),
                  Row(
                      children: [
                        Column(
                            children: [
                              Row(
                                  children: [
                                    Container(
                                        child: Text("Temps de repos:",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87),
                                            textAlign: TextAlign.left))
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center)
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                              onTap: () => setState(() {
                                if (exercicesOptions.rest != 0) {
                                  db.updateRest(exercicesOptions.rest-15,id);
                                }
                              }),
                              child: new Icon(Icons.chevron_left,
                                  size: 30, color: Color(0xFFD34B4B)),
                            )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(exercicesOptions.rest.toString() + " secondes",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Container(
                                child: GestureDetector(
                              onTap: () => setState(() {
                                db.updateRest(exercicesOptions.rest+15,id);
                              }),
                              child: new Icon(Icons.chevron_right,
                                  size: 30, color: Color(0xFFD34B4B)),
                            )),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center),
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
                        margin: new EdgeInsets.only(top: 30.0, bottom: 10),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: RaisedButton(
                            onPressed: () => exerciceDeleted(id),
                            child: Text('Supprimer cet exercice',
                                style: TextStyle(fontSize: 18)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            color: Color(0xFF3F3F3F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        alignment: Alignment.center,
                        margin: new EdgeInsets.only(top: 10.0, bottom: 30),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ]),
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
        body: ListView(children: [
          Row(children: [
            Container(
                child: new Text("Nom du programme".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(left: 20.0, top: 20.0)),
          ]),
          getExercicesById(id),
        ]));
  }
}
