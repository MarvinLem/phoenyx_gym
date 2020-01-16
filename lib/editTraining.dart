import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import './createExercice.dart';
import './editExercice.dart';

import './database/trainingDatabase.dart';
import './database/exercicesDatabase.dart';

class EditTraining extends StatefulWidget {
  int trainingId;

  EditTraining({this.trainingId});

  @override
  State<StatefulWidget> createState() {
    return EditTrainingState(trainingId: trainingId);
  }
}

class EditTrainingState extends State<EditTraining> {
  int trainingId;
  ExercicesDatabase db = ExercicesDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  List<String> exercices = [];

  EditTrainingState({this.trainingId});

  @override
  void initState() {
    getExercicesByTrainingId(trainingId);
  }

  trainingDeleted(id) async{
    await trainingDb.delete(trainingId);
    await db.deleteExercicesByTrainingId(trainingId);
    var count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == 2;
    });
  }

  getExercicesByTrainingId(trainingId) {
    return FutureBuilder(
        future: db.getExercicesByTrainingId(trainingId),
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
                                                EditExercice(id: exercice.id))),
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
                  child: new Text("Votre séance du lundi",
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
          getExercicesByTrainingId(trainingId),
          Row(children: [
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateExercice(trainingId: trainingId))),
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
          ]),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => Navigator.of(context)
                        .popUntil((route) => route.isFirst),
                    child: Text('Enregister le programme',
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
                    onPressed: () => trainingDeleted(trainingId),
                    child: Text('Supprimer ce programme',
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
