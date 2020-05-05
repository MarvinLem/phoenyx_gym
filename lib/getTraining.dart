import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './beginTraining.dart';
import './editTraining.dart';

import './database/exercicesDatabase.dart';
import './database/sessionDatabase.dart';
import './database/trainingDatabase.dart';

class GetTraining extends StatefulWidget {
  int trainingId;
  int sessionId;

  GetTraining({this.trainingId, this.sessionId});

  @override
  State<StatefulWidget> createState() {
    return GetTrainingState(trainingId: trainingId,sessionId: sessionId);
  }
}

class GetTrainingState extends State<GetTraining> {
  int trainingId;
  int sessionId;
  ExercicesDatabase db = ExercicesDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  int exercices = 0;
  String trainingName;
  var sessionArray = [];
  var sessionIdArray = [0];
  int seance = 0;

  DateTime date = DateTime.now();

  GetTrainingState({this.trainingId, this.sessionId});

  @override
  void initState() {
    getTrainingName();
    getDaysSession();
    getExercicesByTrainingIdAndSessionId(trainingId,sessionIdArray[seance]);
  }

  getTrainingName() async {
      var training = await trainingDb.getTrainingName(trainingId);
      setState(() {
        trainingName = training[0]['name'];
      });
  }

  getDaysSession() async {
    var session = await sessionDb.getSessionByTrainingIdAndDistinctDay(trainingId);
    sessionIdArray = [];
    for(int i=0;i<session.length;i++){
      setState(() {
        sessionArray.add(session[i]['seance']);
        sessionIdArray.add(session[i]['id']);
      });
    }
    if(sessionId != null){
      seance = sessionIdArray.indexOf(sessionId);
    }

  }

  getExercicesByTrainingIdAndSessionId(trainingId,sessionId) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            exercices = snapshot.data.length;
            if(exercices>0){
            return Column(children: [
              for (ExercicesModel exercice in snapshot.data)
                Row(children: [
                  Column(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 2.0, color: Color(0xFFD34B4B)),
                          image: DecorationImage(
                            image:
                                ExactAssetImage('assets/images/'+ exercice.name +'.png'),
                            fit: BoxFit.none,
                          ),
                        ),
                        constraints:
                            BoxConstraints(minWidth: 80.0, minHeight: 80.0),
                        margin: new EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                      )
                    ],
                  ),
                  Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: exercice.weight != 0 && exercice.weight != null
                                  ? new Text(
                                      StringUtils.capitalize(exercice.name) +
                                          " - " +
                                          exercice.weight.toString() +
                                          "kg",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                      textAlign: TextAlign.left)
                                  : new Text(
                                      StringUtils.capitalize(exercice.name),
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                      textAlign: TextAlign.left),
                              alignment: Alignment.topLeft,
                              margin: new EdgeInsets.only(bottom: 5),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        Row(
                            children: [
                              Container(
                                child: Text(
                                    exercice.series.toString() +
                                        " séries de " +
                                        exercice.repetitions.toString() +
                                        " répétitions",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                margin: new EdgeInsets.only(bottom: 5),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start),
                        Row(
                            children: [
                              Container(
                                child: Text(
                                    exercice.rest.toString() +
                                        " secondes de repos",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                margin: new EdgeInsets.only(bottom: 5),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start)
                ]),
              Row(
                children: [
                  Container(
                      child: exercices > 0 ? RaisedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BeginTraining(trainingId: trainingId, sessionId: sessionIdArray[seance], maxOrder: exercices)),
                          ),
                          child: Text('Commencer la séance',
                              style: TextStyle(fontSize: 18)),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                          color: Color(0xFFD34B4B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))) : Center())
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ]);
          } else {
            return Row(
              children: [
                Container(
                  child: Text("Cette séance ne contient aucun exercice",
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                  margin: new EdgeInsets.only(bottom: 20, top: 20),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            );
            }
          } else {
            return Row(
              children: [
                Container(
                  child: Text("Ce programme ne semble pas exister",
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                  margin: new EdgeInsets.only(bottom: 20, top: 20),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            );
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
                child: (trainingName != null) ? new Text(trainingName.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,) : new Text("Programme".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40)),
          ]),
          Row(
            children: [
              Column(
                children: [
                  (seance != 0) ? Container(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        if(seance > 0) {
                          seance -= 1;
                        }
                      }),
                      child: new Icon(Icons.arrow_left,
                          size: 40, color: Color(0xFFD34B4B)),
                    ),
                    margin: new EdgeInsets.only(top: 20.0)
                  ) : Container(constraints: BoxConstraints(minWidth: 40)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Column(children: [
                Container(
                  child: (sessionArray.isEmpty) ? new Text("Votre séance du loading",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFD34B4B),
                          fontWeight: FontWeight.bold)) : new Text(("Votre " + (seance+1).toString() + " séance de la semaine").replaceAll("1", "1ère").replaceAll("2", "2ème").replaceAll("3", "3ème").replaceAll("4", "4ème").replaceAll("5", "5ème").replaceAll("6", "6ème").replaceAll("7", "7ème"),
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFD34B4B),
                          fontWeight: FontWeight.bold)),
                  margin: new EdgeInsets.only(top: 20.0),
                    constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-120)
                )
              ]),
              Column(
                children: [
                  (seance < sessionArray.length-1) ? Container(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        if(seance < sessionArray.length-1) {
                          seance += 1;
                        }
                      }),
                      child: new Icon(Icons.arrow_right,
                          size: 40, color: Color(0xFFD34B4B)),
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                  ) : Container(constraints: BoxConstraints(minWidth: 40)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          getExercicesByTrainingIdAndSessionId(trainingId,sessionIdArray[seance]),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTraining(trainingId: trainingId, sessionId: sessionIdArray[seance])),
                        ),
                    child: Text('Modifier la séance',
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
        ]));
  }
}
