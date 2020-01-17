import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import './endFeedback.dart';

import './database/exercicesDatabase.dart';

class Feedback {
  List exerciceArray = ['J\'ai réussi mes exercices normalement','J\'ai réussi mes exercices normalement','J\'ai réussi mes exercices normalement'];
}

class BeginFeedback extends StatefulWidget {
  int trainingId;
  int sessionId;

  BeginFeedback({this.trainingId,this.sessionId});

  @override
  State<StatefulWidget> createState() {
    return BeginFeedbackState(trainingId: trainingId,sessionId: sessionId);
  }
}

class BeginFeedbackState extends State<BeginFeedback> {
  int trainingId;
  int sessionId;
  ExercicesDatabase db = ExercicesDatabase();

  BeginFeedbackState({this.trainingId, this.sessionId});

  var feedback = new Feedback();

  @override
  void initState() {
    getExercicesByTrainingId(trainingId);
  }

  getExercicesByTrainingId(trainingId) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              for (ExercicesModel exercice in snapshot.data)
                Column(children: [
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
                                image: ExactAssetImage('assets/images/'+exercice.name+'.png'),
                                fit: BoxFit.none,
                              ),
                            ),
                            constraints:
                            BoxConstraints(minWidth: 80.0, minHeight: 80.0),
                            margin:
                            new EdgeInsets.only(right: 20, top: 20, bottom: 20),
                          )
                        ],
                      ),
                      Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Text(StringUtils.capitalize(exercice.name),
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black87),
                                      textAlign: TextAlign.left),
                                  alignment: Alignment.topLeft,
                                  margin: new EdgeInsets.only(bottom: 5),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center)
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center),
              Row(
                  children: [
                    Container(
                      child: new DropdownButton<String>(
                        value: feedback.exerciceArray[exercice.exerciceOrder - 1].toString(),
                        items: <String>['J\'ai réussi mes exercices normalement', 'J\'ai réussi mes exercices et j\'aurais pu travailler plus', 'J\'ai réussi mais j\'ai eu des difficultés à la fin des exercices', 'Je n\'ai pas réussi à terminer les exercices'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) => setState(() {
                          feedback.exerciceArray[exercice.exerciceOrder - 1] = value;
                        }),
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-40),
                      padding:
                      new EdgeInsets.symmetric(vertical: 10),
                      margin: new EdgeInsets.only(bottom: 15),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center)]),
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
          Row(
            children: [
              Container(
                  child: new Text(
                    "Fin de la séance".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  margin: new EdgeInsets.only(top: 20.0)),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: [
              Container(
                  child: new Text(
                    "Avez-vous accompli correctement\n les taches demandés ?",
                    style: TextStyle(fontSize: 16, color: Color(0xFF3F3F3F)),
                    textAlign: TextAlign.center,
                  ),
                  margin: new EdgeInsets.only(top: 20.0)),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          getExercicesByTrainingId(trainingId),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EndFeedback(trainingId: trainingId,sessionId: sessionId,exerciceArray: feedback.exerciceArray))),
                    child: Text('Valider le feedback',
                        style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFFD34B4B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                alignment: Alignment.center,
                margin: new EdgeInsets.only(top: 5.0, bottom: 30),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ]));
  }
}
