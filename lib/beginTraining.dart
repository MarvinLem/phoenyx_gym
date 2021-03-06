import 'package:flutter/material.dart';
import './beginFeedback.dart';

import './database/trainingDatabase.dart';
import './database/exercicesDatabase.dart';

class BeginTraining extends StatefulWidget {
  int trainingId;
  int sessionId;
  int maxOrder;

  BeginTraining({this.trainingId, this.sessionId, this.maxOrder});

  @override
  State<StatefulWidget> createState() {
    return BeginTrainingState(
        trainingId: trainingId, sessionId: sessionId, maxOrder: maxOrder);
  }
}

class BeginTrainingState extends State<BeginTraining> {
  int countdown = 10;
  int trainingId;
  int sessionId;
  int maxOrder;
  int order = 1;
  int remainingSeries;
  int remainingRest;
  String remainingName;
  int remainingReps;
  int remainingWeight;
  int timer;
  int trainingIsPredefined;
  bool restPhase = false;
  ExercicesDatabase db = ExercicesDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  List<String> exercices = [];

  BeginTrainingState({this.trainingId, this.sessionId, this.maxOrder});

  @override
  void initState() {
    getTraining();
    getRemaingVariables(trainingId, sessionId, order);
    getExercicesByTrainingIdAndSessionIdAndOrder(trainingId, sessionId, order);
    startCountdownTimer();
  }

  getTraining() async {
    var training = await trainingDb.getTraining(trainingId);
    setState(() {
      trainingIsPredefined = training[0]['predefined'];
    });
    print(trainingIsPredefined);
  }

  startCountdownTimer() async {
    while (countdown > 0) {
      await Future.delayed(Duration(milliseconds: 1000));
      setState(() {
        countdown -= 1;
      });
    }
  }

  startRestTimer() async {
    while (timer > 0 && restPhase == true) {
      await Future.delayed(Duration(milliseconds: 1000));
      setState(() {
        timer -= 1;
      });
    }
    if (timer == 0 || restPhase == false) {
      setState(() {
        restPhase = false;
        return;
      });
    }
  }

  getRemaingVariables(trainingId, sessionId, order) async {
    var exercice = await db.getExercicesByTrainingIdAndSessionIdAndOrder(
        trainingId, sessionId, order);
    setState(() {
      remainingSeries = exercice[0]['series'];
      remainingRest = exercice[0]['rest'];
      remainingName = exercice[0]['name'];
      remainingReps = exercice[0]['repetitions'];
      remainingWeight = exercice[0]['weight'];
    });
  }

  setRemainingVariables(series, rest) async {
    setState(() {
      remainingSeries = series;
      remainingRest = rest;
    });
  }

  getExercicesByTrainingIdAndSessionIdAndOrder(trainingId, sessionId, order) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionIdAndOrder(
            trainingId, sessionId, order),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length != 0) {
              return Column(children: [
                Row(children: [
                  Column(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 2.0, color: Color(0xFFD34B4B)),
                          image: DecorationImage(
                            image: ExactAssetImage(('assets/images/' + snapshot.data[0]['name'] + '.png').replaceAll(' ', '_')),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        padding: new EdgeInsets.symmetric(
                            horizontal: 35, vertical: 35),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  )
                ]),
              ]);
            } else {
              return Column(children: [
                Row(children: [
                  Column(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        margin: new EdgeInsets.symmetric(
                            horizontal: 25, vertical: 30),
                        padding: new EdgeInsets.symmetric(
                            horizontal: 35, vertical: 35),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  )
                ]),
              ]);
            }
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
        body: countdown < 1
            ? ListView(children: [
                Row(
                  children: [
                    Container(
                        child: new Text(
                          "Séance en cours".toUpperCase(),
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
                    getExercicesByTrainingIdAndSessionIdAndOrder(
                        trainingId, sessionId, order - 1),
                    (order != 1)
                        ? Column(
                            children: [
                              Container(
                                child: new Icon(Icons.play_arrow,
                                    color: Color(0xFFD34B4B)),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          )
                        : Center(),
                    getExercicesByTrainingIdAndSessionIdAndOrder(
                        trainingId, sessionId, order),
                    (maxOrder >= order + 1)
                        ? Column(
                            children: [
                              Container(
                                child: new Icon(Icons.play_arrow,
                                    color: Color(0xFFD34B4B)),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          )
                        : Center(),
                    getExercicesByTrainingIdAndSessionIdAndOrder(
                        trainingId, sessionId, order + 1),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                Row(
                  children: [
                    Container(
                        child: remainingWeight != 0
                            ? new Text(
                                (remainingReps.toString() +
                                        " " +
                                        remainingName +
                                        " - " +
                                        remainingWeight.toString() +
                                        "kg")
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF3F3F3F),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            : new Text(
                                (remainingReps.toString() + " " + remainingName)
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF3F3F3F),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                        margin: new EdgeInsets.only(bottom: 10)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: [
                    Container(
                        child: new Text(
                      ("Il vous reste " +
                              remainingSeries.toString() +
                              " séries")
                          .toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3F3F3F),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: [
                    restPhase
                        ? Container(
                            child: new Text(
                              "Phase de repos en cours".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3F3F3F),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            margin: new EdgeInsets.only(top: 20),
                          )
                        : Container(
                            child: new Text(
                              "Phase d'exercice en cours".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3F3F3F),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            margin: new EdgeInsets.only(top: 20, bottom: 20),
                          ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                restPhase
                    ? Row(
                        children: [
                          Container(
                            child: new Text(
                              timer.toString().toUpperCase(),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF3F3F3F),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            margin: new EdgeInsets.only(top: 10, bottom: 20),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                    : Center(),
                Row(
                  children: [
                    Container(
                      child: RaisedButton(
                          onPressed: () => setState(() {
                                if (restPhase == true) {
                                  restPhase = false;
                                } else {
                                  if (order == maxOrder &&
                                      remainingSeries == 1) {
                                    trainingIsPredefined != 1 ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BeginFeedback(
                                                trainingId: trainingId,
                                                sessionId: sessionId))) : Navigator.of(context).popUntil((route) => route.isFirst);
                                  } else {
                                    if (remainingSeries > 1) {
                                      remainingSeries -= 1;
                                      restPhase = true;
                                      timer = remainingRest;
                                      startRestTimer();
                                    } else {
                                      order += 1;
                                      getRemaingVariables(
                                          trainingId, sessionId, order);
                                      restPhase = true;
                                      timer = remainingRest;
                                      startRestTimer();
                                    }
                                  }
                                }
                              }),
                          child: restPhase
                              ? Text('Passer le temps de repos',
                                  style: TextStyle(fontSize: 18))
                              : Text('Série terminée',
                                  style: TextStyle(fontSize: 18)),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                          color: Color(0xFFD34B4B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      alignment: Alignment.center,
                      margin: new EdgeInsets.only(top: 5.0, bottom: 10),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  children: [
                    Container(
                      child: RaisedButton(
                          onPressed: () => setState(() {
                                if (order == maxOrder) {
                                  trainingIsPredefined != 1 ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BeginFeedback(
                                              trainingId: trainingId,
                                              sessionId: sessionId))) : Navigator.of(context).popUntil((route) => route.isFirst);
                                } else {
                                  order += 1;
                                  getRemaingVariables(
                                      trainingId, sessionId, order);
                                }
                              }),
                          child: Text('Passer cet exercice',
                                  style: TextStyle(fontSize: 14)),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                          color: Color(0xFF9E3838),
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
                          onPressed: () => trainingIsPredefined != 1 ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BeginFeedback(
                                      trainingId: trainingId,
                                      sessionId: sessionId))) : Navigator.of(context).popUntil((route) => route.isFirst),
                          child: Text('Mettre fin à la séance',
                              style: TextStyle(fontSize: 12)),
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
                ),
              ])
            : Center(
                child: InkWell(
                    child: Column(
                        children: [
                          Text(
                            (countdown.toString()).toUpperCase(),
                            style: TextStyle(
                                fontSize: 72,
                                color: Color(0xFF3F3F3F),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Toucher l'écran pour commencer l'entrainement",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3F3F3F),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                              child: RaisedButton(
                                  onPressed: () => setState(() {
                                        countdown += 10;
                                      }),
                                  child: Text('Ajouter 10 secondes',
                                      style: TextStyle(fontSize: 18)),
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(15),
                                  color: Color(0xFFD34B4B),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              margin: EdgeInsets.only(top: 80))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center),
                    onTap: () => setState(() {
                          countdown = 0;
                        }))));
  }
}
