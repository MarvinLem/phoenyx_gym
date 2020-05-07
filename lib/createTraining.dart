import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './editTraining.dart';

import './database/trainingDatabase.dart';
import './database/seanceDatabase.dart';
import './database/sessionDatabase.dart';

class Program {
  String name = "Nouveau programme";
  int session = 3;
  int duration = 5;
  int seance = 1;
  var monday = [];
  var tuesday = [];
  var wednesday = [];
  var thursday = [];
  var friday = [];
  var saturday = [];
  var sunday = [];
  bool repeat = true;
  int currentSession = 0;
}

class Days extends StatefulWidget {
  CreateTrainingState parent;
  int index;
  int maxSeance;
  Program program;

  Days(this.parent, this.index, this.maxSeance, this.program);

  @override
  State<StatefulWidget> createState() {
    return DaysState();
  }
}

class DaysState extends State<Days> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (widget.index != null)
            ? Column(children: [
                Container(
                  child: Center(
                      child: new Text((widget.index + 1).toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFD34B4B), fontSize: 16))),
                  decoration: BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.circle),
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.only(top: 5, bottom: 5, right: 10),
                ),
              ])
            : Container(),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.monday.contains(widget.index)) {
                      widget.program.monday.remove(widget.index);
                      widget.program.currentSession -= 1;
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        widget.program.monday.add(widget.index);
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("L",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.monday.contains(widget.index)
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.monday.contains(widget.index)
                        ? Color(0xFFD34B4B)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.tuesday.contains(widget.index)) {
                      widget.program.tuesday.remove(widget.index);
                      widget.program.currentSession -= 1;
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        widget.program.tuesday.add(widget.index);
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("M",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.tuesday.contains(widget.index)
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.tuesday.contains(widget.index)
                        ? Color(0xFFD34B4B)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.wednesday.contains(widget.index)) {
                      widget.program.wednesday.remove(widget.index);
                      widget.program.currentSession -= 1;
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        widget.program.wednesday.add(widget.index);
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("M",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                widget.program.wednesday.contains(widget.index)
                                    ? Colors.white
                                    : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.wednesday.contains(widget.index)
                        ? Color(0xFFD34B4B)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.thursday.contains(widget.index)) {
                      widget.program.thursday.remove(widget.index);
                      widget.program.currentSession -= 1;
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        widget.program.thursday.add(widget.index);
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("J",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                widget.program.thursday.contains(widget.index)
                                    ? Colors.white
                                    : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.thursday.contains(widget.index)
                        ? Color(0xFFD34B4B)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.friday.contains(widget.index)) {
                      widget.program.friday.remove(widget.index);
                      widget.program.currentSession -= 1;
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        widget.program.friday.add(widget.index);
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("V",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.friday.contains(widget.index)
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.friday.contains(widget.index)
                        ? Color(0xFFD34B4B)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.saturday.contains(widget.index)) {
                      widget.program.saturday.remove(widget.index);
                      widget.program.currentSession -= 1;
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        widget.program.saturday.add(widget.index);
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("S",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                widget.program.saturday.contains(widget.index)
                                    ? Colors.white
                                    : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.saturday.contains(widget.index)
                        ? Color(0xFFD34B4B)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.sunday.contains(widget.index)) {
                      widget.program.sunday.remove(widget.index);
                      widget.program.currentSession -= 1;
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        widget.program.sunday.add(widget.index);
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("D",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.sunday.contains(widget.index)
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.sunday.contains(widget.index)
                        ? Color(0xFFD34B4B)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              )),
        ]),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

class CreateTraining extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateTrainingState();
  }
}

class CreateTrainingState extends State<CreateTraining> {
  TrainingDatabase db = TrainingDatabase();
  SeanceDatabase seanceDb = SeanceDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  final formController = TextEditingController(text: "Votre programme");

  var program = new Program();
  var globalWeekBonus = 0;
  var seancesArray = [];

  resetProgram(){
    setState(() {
      program.monday = [];
      program.tuesday = [];
      program.wednesday = [];
      program.thursday = [];
      program.friday = [];
      program.saturday = [];
      program.sunday = [];
      program.currentSession = 0;
    });
  }

  insertDate(day, duration, seance, week, trainingId, seanceId) async {
    var weekBonus = 0;
    var now = new DateTime.now();
    var startOfDay = new DateTime(now.year, now.month, now.day);
    var startOfMonday = startOfDay;
    int millisecondsOf7Days = 604800000;

    while (startOfDay.weekday != day) {
      startOfDay = startOfDay.add(new Duration(days: 1));
    }

    while (startOfMonday.weekday != 1) {
      startOfMonday = startOfMonday.add(new Duration(days: 1));
    }

    startOfDay.millisecondsSinceEpoch < startOfMonday.millisecondsSinceEpoch
        ? weekBonus = 0
        : weekBonus = 1;

    if(program.repeat == false && globalWeekBonus == 0 && week == 1) {
      startOfDay.millisecondsSinceEpoch < startOfMonday.millisecondsSinceEpoch
          ? globalWeekBonus = 0
          : globalWeekBonus = 1;
    }

    for (int i = 0; i < duration; i++) {
      var milliSeconds =
          startOfDay.millisecondsSinceEpoch + millisecondsOf7Days * i;
      var session = SessionModel(
          seance: seance,
          week: week != null ? week : i + 1 + weekBonus,
          sessionNumber: week != null ? week : i+1,
          date: week != null ? milliSeconds + ((week-1 - weekBonus + globalWeekBonus) * millisecondsOf7Days) : milliSeconds,
          startAt: week != null ? milliSeconds + ((week-1 - weekBonus + globalWeekBonus) * millisecondsOf7Days) : milliSeconds,
          endAt: week != null ? milliSeconds + ((week-1 - weekBonus + globalWeekBonus) * millisecondsOf7Days): milliSeconds,
          trainingId: trainingId,
          seanceId: seanceId);
      sessionDb.insert(session);
    }
  }

  trainingCreated(name, session, duration, seance) async {
    var training = TrainingModel(name: name, session: session, duration: duration);
    db.insert(training);
    var lastTraining = await db.getLastTraining();
    var trainingId = lastTraining[0]["id"];
    //Creer le nombre de séance adéquat ( pour le moment c'est le nombre de jours selectionnés différents
    var seanceModel = SeanceModel(trainingId: trainingId);
    for(var i=0;i<program.session;i++){
      seanceDb.insert(seanceModel);
    }
    var lastSeances = await seanceDb.getLastSeances(program.session);
    for(var i=0;i<lastSeances.length;i++){
      seancesArray.add(lastSeances[i]['id']);
    }
    if (program.monday.isNotEmpty) {
      if(program.repeat) {
        insertDate(1, duration, seance, null, trainingId, seancesArray[seance-1]);
      } else {
        program.monday.forEach((week) => insertDate(1, 1, seance, week+1, trainingId,seancesArray[seance-1]));
      }
      seance += 1;
    }
    if (program.tuesday.isNotEmpty) {
      if(program.repeat) {
        insertDate(2, duration, seance, null, trainingId, seancesArray[seance-1]);
      } else {
        program.tuesday.forEach((week) => insertDate(2, 1, seance, week+1, trainingId, seancesArray[seance-1]));
      }
        seance += 1;
    }
    if (program.wednesday.isNotEmpty) {
      if(program.repeat) {
        insertDate(3, duration, seance, null, trainingId, seancesArray[seance-1]);
      } else {
        program.wednesday.forEach((week) => insertDate(3, 1, seance, week+1, trainingId, seancesArray[seance-1]));
      }
      seance += 1;
    }
    if (program.thursday.isNotEmpty) {
      if(program.repeat) {
        insertDate(4, duration, seance, null, trainingId, seancesArray[seance-1]);
      } else {
        program.thursday.forEach((week) => insertDate(4, 1, seance, week+1, trainingId, seancesArray[seance-1]));
      }
      seance += 1;
    }
    if (program.friday.isNotEmpty) {
      if(program.repeat) {
        insertDate(5, duration, seance, null, trainingId, seancesArray[seance-1]);
      } else {
        program.friday.forEach((week) => insertDate(5, 1, seance, week+1, trainingId, seancesArray[seance-1]));
      }
      seance += 1;
    }
    if (program.saturday.isNotEmpty) {
      if(program.repeat) {
        insertDate(6, duration, seance, null, trainingId, seancesArray[seance-1]);
      } else {
        program.saturday.forEach((week) => insertDate(6, 1, seance, week+1, trainingId, seancesArray[seance-1]));
      }
      seance += 1;
    }
    if (program.sunday.isNotEmpty) {
      if(program.repeat) {
        insertDate(7, duration, seance, null, trainingId, seancesArray[seance-1]);
      } else {
        program.sunday.forEach((week) => insertDate(7, 1, seance, week+1, trainingId, seancesArray[seance-1]));
      }
      seance += 1;
    }
    globalWeekBonus = 0;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    formController.dispose();
    super.dispose();
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
                child: new Text("Nouveau programme".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(left: 20.0, top: 20.0)),
          ]),
          Row(
            children: [
              Container(
                child: new Text("Nom du programme",
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
                margin:
                    new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(children: [
            Expanded(
                child: Container(
              child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: formController,
                  decoration: InputDecoration(
                    hintText: 'Entrez le nom de votre programme',
                  ),
                  keyboardType: TextInputType.text),
              margin: EdgeInsets.only(right: 50, left: 50),
            ))
          ]),
          Row(
            children: [
              Container(
                child: new Text("Nombre de séance par semaine",
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
                margin:
                    new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
              )
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
                              child: GestureDetector(
                            onTap: () => setState(() {
                              program.session += 1;
                              resetProgram();
                            }),
                            child: new Icon(Icons.arrow_drop_up,
                                size: 50, color: Color(0xFFD34B4B)),
                          )),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(program.session.toString(),
                                style: TextStyle(
                                    fontSize: 26, color: Colors.black87),
                                textAlign: TextAlign.left),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        children: [
                          Container(
                              child: GestureDetector(
                            onTap: () => setState(() {
                              if (program.session > 1) {
                                program.session -= 1;
                                resetProgram();
                              }
                            }),
                            child: new Icon(Icons.arrow_drop_down,
                                size: 50, color: Color(0xFFD34B4B)),
                          )),
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
                  child: new Text(
                    "Suivre le programme pendant combien de semaines",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  margin:
                      new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 40))
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
                              child: GestureDetector(
                            onTap: () => setState(() {
                              program.duration += 1;
                              resetProgram();
                            }),
                            child: new Icon(Icons.arrow_drop_up,
                                size: 50, color: Color(0xFFD34B4B)),
                          )),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(program.duration.toString(),
                                style: TextStyle(
                                    fontSize: 26, color: Colors.black87),
                                textAlign: TextAlign.left),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        children: [
                          Container(
                            child: GestureDetector(
                                onTap: () => setState(() {
                                      if (program.duration > 1) {
                                        program.duration -= 1;
                                        resetProgram();
                                      }
                                    }),
                                child: new Icon(Icons.arrow_drop_down,
                                    size: 50, color: Color(0xFFD34B4B))),
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
              Column(children: [
                Container(
                    child: new Text(
                      "Votre programme est répeté chaque semaine ?",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.start,
                    ),
                    margin: new EdgeInsets.only(
                        left: 40.0, top: 30.0, bottom: 10.0),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 150))
              ]),
              Column(
                children: [
                  Container(
                      child: GestureDetector(
                          onTap: () => setState(() {
                                if (program.repeat) {
                                  program.repeat = false;
                                } else {
                                  program.repeat = true;
                                }
                                resetProgram();
                              }),
                          child: program.repeat
                              ? new Icon(Icons.check_box,
                                  color: Color(0xFFD34B4B))
                              : new Icon(Icons.check_box_outline_blank,
                                  color: Color(0xFFD34B4B))),
                      margin: new EdgeInsets.only(
                          left: 10, right: 10, top: 40, bottom: 30)),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          Row(
            children: <Widget>[
              Container(
                  child: new Text(
                    "Avoir la séance le",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  margin:
                      new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 40))
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          program.repeat
              ? Days(this, null, program.session, program)
              : new Column(
                  children: new List.generate(
                      program.duration,
                      (index) => new Days(this, index,
                          program.session * program.duration, program))),
          Row(
            children: [
              Container(
                child: program.repeat
                    ? program.session == program.currentSession
                        ? RaisedButton(
                            onPressed: () => trainingCreated(
                                formController.text,
                                program.session,
                                program.duration,
                                program.seance),
                            child: Text('Créer le programme',
                                style: TextStyle(fontSize: 18)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            color: Color(0xFFD34B4B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)))
                        : RaisedButton(
                            child: Text("Selectionner d'abord les séances",
                                style: TextStyle(fontSize: 18)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            color: Color(0xFFD34B4B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)))
                    : program.session * program.duration ==
                            program.currentSession
                        ? RaisedButton(
                            onPressed: () => trainingCreated(
                                formController.text,
                                program.session,
                                program.duration,
                                program.seance),
                            child: Text('Créer le programme',
                                style: TextStyle(fontSize: 18)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            color: Color(0xFFD34B4B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)))
                        : RaisedButton(
                            child: Text("Selectionner d'abord les séances",
                                style: TextStyle(fontSize: 18)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            color: Color(0xFFD34B4B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                alignment: Alignment.center,
                margin: new EdgeInsets.only(top: 20, bottom: 30),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ]));
  }
}
