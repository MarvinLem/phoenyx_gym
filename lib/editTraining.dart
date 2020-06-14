import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './createExercice.dart';
import './editExercice.dart';

import './database/trainingDatabase.dart';
import './database/exercicesDatabase.dart';
import './database/sessionDatabase.dart';

class EditTraining extends StatefulWidget {
  int trainingId;
  int sessionId;
  String mode;

  EditTraining({this.trainingId, this.sessionId, this.mode});

  @override
  State<StatefulWidget> createState() {
    return EditTrainingState(trainingId: trainingId,sessionId: sessionId, mode: mode);
  }
}

class EditTrainingState extends State<EditTraining> {
  int trainingId;
  int sessionId;
  int seanceId;
  String mode;
  String trainingName;
  ExercicesDatabase db = ExercicesDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  List<String> exercices = [];
  var count = 0;

  EditTrainingState({this.trainingId,this.sessionId, this.mode});

  @override
  void initState() {
    getTrainingName();
    getSeanceId();
    getExercicesByTrainingIdAndSessionId(trainingId,sessionId);
  }

  getSeanceId() async {
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

  sessionDeleted(id) async{
    await sessionDb.delete(sessionId);
    await db.deleteExercicesByTrainingIdAndSessionId(trainingId,sessionId);
    var count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == 2;
    });
  }

  getExercicesByTrainingIdAndSessionId(trainingId,sessionId) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
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
                                ExactAssetImage(('assets/images/' + exercice.name + '.png').replaceAll(' ', '_')),
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
                                child: Text(exercice.series.toString() + " séries de " + exercice.repetitions.toString() + " répétitions",
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
                                child: Text(exercice.rest.toString() + " secondes de repos",
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
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditExercice(id: exercice.id,trainingId: trainingId, sessionId: sessionId, mode: mode))),
                                    child: Text("Modifier l'exercice",
                                        style: TextStyle(
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.underline)),
                                  ),
                                  margin:
                                      new EdgeInsets.only(top: 2, bottom: 5)),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start)
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
                child: (trainingName != null) ? new Text(trainingName.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold)):new Text("Programme".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(left: 20.0, top: 20.0),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40)),
          ]),
          getExercicesByTrainingIdAndSessionId(trainingId,sessionId),
          InkWell(onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateExercice(trainingId: trainingId,sessionId: sessionId,seanceId: seanceId, mode: mode))),
              child: Row(children: [
            Column(
              children: [
                Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Color(0xFFD34B4B)),
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/add.png'),
                      fit: BoxFit.none,
                    ),
                  ),
                  constraints: BoxConstraints(minWidth: 80.0, minHeight: 80.0),
                  margin:
                      new EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                )
              ],
            ),
            Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: InkWell(
                            child: Text("Ajouter un nouvel exercice",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                                textAlign: TextAlign.left)),
                        alignment: Alignment.topLeft,
                        margin: new EdgeInsets.only(bottom: 5),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start)
          ])),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => {
                      Navigator.popUntil(context, (route) {
                      return count++ == 2;
                    })},
                    child: Text('Enregister la séance',
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
                    onPressed: () => sessionDeleted(sessionId),
                    child: Text('Supprimer cette séance',
                        style: TextStyle(fontSize: 15)),
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
