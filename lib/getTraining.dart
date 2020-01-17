import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './beginTraining.dart';
import './editTraining.dart';

import './database/exercicesDatabase.dart';
import './database/sessionDatabase.dart';

class GetTraining extends StatefulWidget {
  int trainingId;

  GetTraining({this.trainingId});

  @override
  State<StatefulWidget> createState() {
    return GetTrainingState(trainingId: trainingId);
  }
}

class GetTrainingState extends State<GetTraining> {
  int trainingId;
  ExercicesDatabase db = ExercicesDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  int exercices;
  var sessionArray = [];
  var sessionIdArray = [0];
  var dayArray = ["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche"];
  int day = 0;

  DateTime date = DateTime.now();

  GetTrainingState({this.trainingId});

  @override
  void initState() {
    getDaysSession();
    getExercicesByTrainingIdAndSessionId(trainingId,sessionIdArray[day]);
    var today = new DateFormat('EEEE').format(date);

    /*
    switch(today){
      case "Monday": {  day = 0; }
      break;
      case "Thursday": {  day = 1; }
      break;
      case "Wednesday": {  day = 2; }
      break;
      case "Tuesday": {  day = 3; }
      break;
      case "Friday": {  day = 4; }
      break;
      case "Saturday": {  day = 5; }
      break;
      case "Sunday": {  day = 6; }
      break;
    }*/
  }

  getDaysSession() async {
    var session = await sessionDb.getSessionByTrainingIdAndDistinctDay(trainingId);
    print(session);
    for(int i=0;i<session.length;i++){
      setState(() {
        sessionArray.add(session[i]['day']);
        sessionIdArray.add(session[i]['id']);
      });
    }
  }

  getExercicesByTrainingIdAndSessionId(trainingId,sessionId) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            exercices = snapshot.data.length;
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
          Row(
            children: [
              Column(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        if(day > 0) {
                          day -= 1;
                        }
                      }),
                      child: new Icon(Icons.arrow_left,
                          size: 40, color: Color(0xFFD34B4B)),
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Column(children: [
                Container(
                  child: (sessionArray.isEmpty) ? new Text("Votre séance du loading",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFD34B4B),
                          fontWeight: FontWeight.bold)) : new Text(("Votre séance du "+ sessionArray[day]).replaceAll('Monday', 'lundi').replaceAll('Thursday', 'mardi').replaceAll('Wednesday', 'mercredi').replaceAll('Tuesday', 'jeudi').replaceAll('Friday', 'vendredi').replaceAll('Saturday', 'samedi').replaceAll('Sunday', 'dimanche'),
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFD34B4B),
                          fontWeight: FontWeight.bold)),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ]),
              Column(
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        if(day < sessionArray.length-1) {
                          day += 1;
                        }
                      }),
                      child: new Icon(Icons.arrow_right,
                          size: 40, color: Color(0xFFD34B4B)),
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          getExercicesByTrainingIdAndSessionId(trainingId,sessionIdArray[day]),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BeginTraining(trainingId: trainingId, sessionId: sessionIdArray[day], maxOrder: exercices)),
                        ),
                    child: Text('Commencer la séance',
                        style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFFD34B4B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                alignment: Alignment.center,
                margin: new EdgeInsets.only(top: 10.0, bottom: 10),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTraining(trainingId: trainingId, sessionId: sessionIdArray[day])),
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
