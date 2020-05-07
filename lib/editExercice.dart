import 'package:flutter/material.dart';

import './database/exercicesDatabase.dart';
import './database/trainingDatabase.dart';
import './database/sessionDatabase.dart';

class ExerciceOptions {
  String name;
  int rest;
  int series;
  int repetitions;
  int weight;
  int exerciceOrder;

  ExerciceOptions(
      this.name, this.rest, this.series, this.repetitions, this.weight, this.exerciceOrder);
}

class EditExercice extends StatefulWidget {
  int id;
  int trainingId;
  int sessionId;
  String mode;

  EditExercice({this.id, this.trainingId, this.sessionId, this.mode});

  @override
  State<StatefulWidget> createState() {
    return EditExerciceState(id: id, trainingId: trainingId, sessionId: sessionId, mode: mode);
  }
}

class EditExerciceState extends State<EditExercice> {
  int id;
  int trainingId;
  int sessionId;
  int seanceId;
  String trainingName;
  String mode;
  ExercicesDatabase db = ExercicesDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  List<String> exercices = [];
  var exercicesOptions;

  EditExerciceState({this.id, this.trainingId, this.sessionId, this.mode});

  bool buttonPressed = false;
  bool loopActive = false;

  @override
  void initState() {
    getTrainingName();
    getSessionId();
    getExercicesById(id);
  }

  getSessionId() async {
    var session = await sessionDb.getSessionById(sessionId);
    setState(() {
      seanceId = session[0]['seanceId'];
    });
  }

  getTrainingName() async {
    var training = await trainingDb.getTrainingName(trainingId);
    setState(() {
      trainingName = training[0]['name'];
    });
  }

  exerciceDeleted(id) async {
    if(mode == "only"){
      db.delete(id);
    } else if(mode == "all"){
      db.deleteMultiple(seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
    }
    Navigator.pop(context);
  }

  getExercicesById(id) {
    return FutureBuilder(
        future: db.getExercicesById(id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            exercicesOptions = new ExerciceOptions(
                snapshot.data[0]['name'],
                snapshot.data[0]['rest'],
                snapshot.data[0]['series'],
                snapshot.data[0]['repetitions'],
                snapshot.data[0]['weight'],
                snapshot.data[0]['exerciceOrder']);
            return Column(children: [
              Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: new Text(
                              ("Exercices - " + exercicesOptions.name)
                                  .toUpperCase(),
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
                              image: ExactAssetImage('assets/images/' +
                                  exercicesOptions.name +
                                  '.png'),
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(exercicesOptions.series > 1) {
                                        if(mode == "only"){
                                          db.updateSeries(exercicesOptions.series - 1, id);
                                        } else if(mode == "all"){
                                          print("test");
                                          db.updateMultipleSeries(exercicesOptions.series - 1, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                        }
                                        exercicesOptions.series -= 1;
                                      }
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(mode == "only"){
                                        db.updateSeries(exercicesOptions.series + 1, id);
                                      } else if(mode == "all"){
                                        print("test");
                                        db.updateMultipleSeries(exercicesOptions.series + 1, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                      }
                                      exercicesOptions.series += 1;
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(exercicesOptions.repetitions > 1) {
                                        if(mode == "only"){
                                          db.updateRepetitions(exercicesOptions.repetitions - 1, id);
                                        } else if(mode == "all"){
                                          db.updateMultipleRepetitions(exercicesOptions.repetitions - 1, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                        }
                                        exercicesOptions.repetitions -= 1;
                                      }
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(mode == "only"){
                                        db.updateRepetitions(exercicesOptions.repetitions + 1, id);
                                      } else if(mode == "all"){
                                        print("test");
                                        db.updateMultipleRepetitions(exercicesOptions.repetitions + 1, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                      }
                                      exercicesOptions.repetitions += 1;
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(exercicesOptions.weight > 0) {
                                        if(mode == "only"){
                                          db.updateWeight(exercicesOptions.weight - 1, id);
                                        } else if(mode == "all"){
                                          print("test");
                                          db.updateMultipleWeight(exercicesOptions.weight - 1, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                        }
                                        exercicesOptions.weight -= 1;
                                      }
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(mode == "only"){
                                        db.updateWeight(exercicesOptions.weight + 1, id);
                                      } else if(mode == "all"){
                                        print("test");
                                        db.updateMultipleWeight(exercicesOptions.weight + 1, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                      }
                                      exercicesOptions.weight += 1;
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(exercicesOptions.rest > 0) {
                                        if(mode == "only"){
                                          db.updateRest(exercicesOptions.rest - 10, id);
                                        } else if(mode == "all"){
                                          print("test");
                                          db.updateMultipleRest(exercicesOptions.rest - 10, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                        }
                                        exercicesOptions.rest -= 10;
                                      }
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                                exercicesOptions.rest.toString() + " secondes",
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
                              child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if(mode == "only"){
                                        db.updateRest(exercicesOptions.rest + 10, id);
                                      } else if(mode == "all"){
                                        print("test");
                                        db.updateMultipleRest(exercicesOptions.rest + 10, seanceId, exercicesOptions.name, exercicesOptions.exerciceOrder);
                                      }
                                      exercicesOptions.rest += 10;
                                    });
                                    // wait a bit
                                    await Future.delayed(Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                child: (trainingName != null)
                    ? new Text(trainingName.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFD34B4B),
                            fontWeight: FontWeight.bold))
                    : new Text("Programme".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFD34B4B),
                            fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(left: 20.0, top: 20.0),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40)),
          ]),
          getExercicesById(id),
        ]));
  }
}
