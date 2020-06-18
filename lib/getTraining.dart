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
    return GetTrainingState(trainingId: trainingId, sessionId: sessionId);
  }
}

class GetTrainingState extends State<GetTraining> {
  int trainingId;
  int sessionId;
  var dayArray = [
    "Lundi",
    "Mardi",
    "Mercredi",
    "Jeudi",
    "Vendredi",
    "Samedi",
    "Dimanche"
  ];
  ExercicesDatabase db = ExercicesDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  int exercices = 0;
  String trainingName;
  int trainingSession;
  int trainingDuration;
  int trainingIsPredefined;
  var sessionArray = [];
  var sessionIdArray = [0];
  int seance = 0;
  int week = 1;
  var actualSession;
  var actualSessionSeance;

  DateTime date = DateTime.now();

  GetTrainingState({this.trainingId, this.sessionId});

  @override
  void initState() {
    getTraining();
    getExercicesByTrainingIdAndSessionId(trainingId, sessionIdArray[seance]);
  }

  getTraining() async {
    var training = await trainingDb.getTraining(trainingId);
    setState(() {
      trainingName = training[0]['name'];
      trainingSession = training[0]['session'];
      trainingDuration = training[0]['duration'];
      trainingIsPredefined = training[0]['predefined'];
    });
    getDaysSession();
  }

  editTraining(mode) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditTraining(
              trainingId: trainingId,
              sessionId: sessionIdArray[seance],
              mode: mode)),
    );
  }

  updateActualSessionSeance() async {
    if (sessionId != null)
      actualSession = await sessionDb.getSessionById(sessionIdArray[seance]);
    actualSession != null ? week = actualSession[0]['week'] : week = 1;
    setState(() {
      actualSessionSeance = actualSession[0]['seance'];
    });
  }

  updateWeek() async {
    var session = await sessionDb.getSessionByTrainingIdAndWeek(trainingId, week);
    sessionId = session[0]['id'];
    actualSession = await sessionDb.getSessionById(sessionId);
    getDaysSession();
  }

  getDaysSession() async {
    //Avoir les (session du training) prochaines séances
    if(sessionId == null) {
      var firstSession = await sessionDb.getSessionByTrainingId(trainingId);
      sessionId = firstSession[0]['id'];
    }
    if (sessionId != null && actualSession == null)
      actualSession = await sessionDb.getSessionById(sessionId);
    actualSession != null ? week = actualSession[0]['week'] : week = 1;
    if(actualSession != null) actualSessionSeance = actualSession[0]['seance'];
    var session = await sessionDb.getSessionByTrainingIdAndWeek(trainingId, week);
    sessionIdArray = [];
    for (int i = 0; i < session.length; i++) {
      setState(() {
        //Rajouter pour qu'on est seulement le nombre de session par semaine
        sessionIdArray.add(session[i]['id']);
      });
    }
    if (actualSession != null) {
      seance = sessionIdArray.indexOf(sessionId);
      week = actualSession[0]['week'];
    } else {
      seance = 0;
      week = 1;
    }
  }

  getExercicesByTrainingIdAndSessionId(trainingId, sessionId) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            exercices = snapshot.data.length;
            if (exercices > 0) {
              return Column(children: [
                for (ExercicesModel exercice in snapshot.data)
                  Row(children: [
                    Column(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2.0, color: Color(0xFFD34B4B)),
                            image: DecorationImage(
                              image: ExactAssetImage(('assets/images/' + exercice.name + '.png').replaceAll(' ', '_')),
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
                                child: exercice.weight != 0 &&
                                        exercice.weight != null
                                    ? new Text(
                                        StringUtils.capitalize(exercice.name) +
                                            " - " +
                                            exercice.weight.toString() +
                                            "kg",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87),
                                        textAlign: TextAlign.left)
                                    : new Text(
                                        StringUtils.capitalize(exercice.name),
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87),
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
                      child: exercices > 0
                          ? RaisedButton(
                              onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BeginTraining(
                                            trainingId: trainingId,
                                            sessionId: sessionIdArray[seance],
                                            maxOrder: exercices)),
                                  ),
                              child: Text(actualSession[0]['done'] == 0 ? 'Commencer la séance' : 'Recommencer la séance' ,
                                  style: TextStyle(fontSize: 18)),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(15),
                              color: Color(0xFFD34B4B),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)))
                          : Center(),
                      margin: EdgeInsets.only(top: 5, bottom: 30),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ]);
            } else {
              return Column(
                children: [
                  Row(children: [
                  Container(
                    child: Text("Cette séance ne contient aucun exercice",
                        style: TextStyle(fontSize: 16, color: Colors.black87)),
                    margin: new EdgeInsets.only(bottom: 20, top: 20),
                  )],
                    mainAxisAlignment: MainAxisAlignment.center),
                  Row(
                    children: [
                      Container(
                        child: RaisedButton(
                            onPressed: () => editTraining('all'),
                            child: Text('Modifier toutes les séances',
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
            Column(children: [
              Container(
                  child: (trainingName != null)
                      ? new Text(
                          trainingName.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFD34B4B),
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      : new Text("Programme".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFD34B4B),
                              fontWeight: FontWeight.bold)),
                  margin:
                      new EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 100,
                      maxWidth: MediaQuery.of(context).size.width - 100))
            ]),
            actualSession != null && actualSession[0]['done'] == 0 ? Column(children: [
              trainingIsPredefined != 1 ? GestureDetector(
                  onTap: () {
                    showMenu(
                      position: RelativeRect.fromLTRB(100, 100, 100, 100),
                      items: <PopupMenuEntry>[
                        PopupMenuItem(
                          child: GestureDetector(
                        child: Container(
                        padding: EdgeInsets.all(10),
                            child: Text("Modifier la séance")),
                            onTap: () => editTraining('only')),
                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                    child: Container(
                        padding: EdgeInsets.all(10),
                            child: Text("Modifier toutes les séances")),
                            onTap: () => editTraining('all'),
                          ),
                        )
                      ],
                      context: context,
                    );
                  },
                  child: Container(
                    margin: new EdgeInsets.only(top: 20.0, left: 20),
                    constraints:
                        new BoxConstraints(minWidth: 20, minHeight: 20),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/more.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )) : Center()
            ]) : Center()
          ]),
          Row(children: [
            Column(
              children: [
                (week != 1)
                    ? Container(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            if (week > 1) {
                              week -= 1;
                              updateWeek();
                            }
                          }),
                          child: new Icon(Icons.arrow_left,
                              size: 40, color: Color(0xFFD34B4B)),
                        ),
                        margin: new EdgeInsets.only(top: 15.0))
                    : Container(constraints: BoxConstraints(minWidth: 10)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Column(
              children: [
                Container(
                    child: (trainingName != null)
                        ? new Text(("Semaine " + week.toString()).toUpperCase(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFD34B4B),
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis)
                        : new Text("Semaine".toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFD34B4B),
                                fontWeight: FontWeight.bold)),
                    margin:
                        new EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 40))
              ],
            ),
            Column(
              children: [
                (trainingDuration != null && week < trainingDuration)
                    ? Container(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            if (week < trainingDuration) {
                              week += 1;
                              updateWeek();
                            }
                          }),
                          child: new Icon(Icons.arrow_right,
                              size: 40, color: Color(0xFFD34B4B)),
                        ),
                        margin: new EdgeInsets.only(top: 15.0),
                      )
                    : Container(constraints: BoxConstraints(minWidth: 40)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ]),
          Row(children: [
            Container(
                child: (actualSession != null && actualSession[0]['date'] != null)
                    ? new Text(
                        ("Séance " + actualSessionSeance.toString()).toUpperCase() +
                            " - " + dayArray[new DateTime.fromMillisecondsSinceEpoch(actualSession[0]['date']).weekday -
    1] + " " +
                            new DateTime.fromMillisecondsSinceEpoch(
                                    actualSession[0]['date'])
                                .day
                                .toString() +
                            "/" +
                            new DateTime.fromMillisecondsSinceEpoch(
                                    actualSession[0]['date'])
                                .month
                                .toString() +
                            "/" +
                            new DateTime.fromMillisecondsSinceEpoch(
                                    actualSession[0]['date'])
                                .year
                                .toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFD34B4B),
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis)
                    : new Text("Séance".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFD34B4B),
                            fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 40)),
          ]),
          Row(
            children: [
              Column(
                children: [
                  (seance != 0)
                      ? Container(
                          child: GestureDetector(
                            onTap: () => setState(() {
                              if (seance > 0) {
                                seance -= 1;
                                updateActualSessionSeance();
                              }
                            }),
                            child: new Icon(Icons.arrow_left,
                                size: 40, color: Color(0xFFD34B4B)),
                          ),
                          margin: new EdgeInsets.only(top: 15.0))
                      : Container(constraints: BoxConstraints(minWidth: 40)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Column(children: [
                Container(
                    child: (sessionIdArray.isEmpty)
                        ? new Text("Votre séance du loading",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFD34B4B),
                                fontWeight: FontWeight.bold))
                        : new Text(
                            ("Votre " +
                                    (seance + 1).toString() +
                                    " séance de la semaine")
                                .replaceAll("1", "1re")
                                .replaceAll("2", "2e")
                                .replaceAll("3", "3e")
                                .replaceAll("4", "4e")
                                .replaceAll("5", "5e")
                                .replaceAll("6", "6e")
                                .replaceAll("7", "7e"),
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFD34B4B),
                                fontWeight: FontWeight.bold)),
                    margin: new EdgeInsets.only(top: 15.0),
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width - 120))
              ]),
              Column(
                children: [
                  (seance < sessionIdArray.length - 1)
                      ? Container(
                          child: GestureDetector(
                            onTap: () => setState(() {
                              if (seance < sessionIdArray.length - 1) {
                                seance += 1;
                                updateActualSessionSeance();
                              }
                            }),
                            child: new Icon(Icons.arrow_right,
                                size: 40, color: Color(0xFFD34B4B)),
                          ),
                          margin: new EdgeInsets.only(top: 15.0),
                        )
                      : Container(constraints: BoxConstraints(minWidth: 40)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          getExercicesByTrainingIdAndSessionId(
              trainingId, sessionIdArray[seance]),
        ]));
  }
}
