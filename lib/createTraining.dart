import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './editTraining.dart';

import './database/trainingDatabase.dart';
import './database/sessionDatabase.dart';
import './database/dateDatabase.dart';

class Program {
  String name = "Nouveau programme";
  int session = 3;
  int duration = 5;
  int seance = 1;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;
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
                              color: Color(0xFFD34B4B),
                              fontSize: 16))),
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
                    if (widget.program.monday) {
                      widget.program.monday = false;
                      widget.program.currentSession -= 1;
                    } else {
                        if(widget.program.currentSession < widget.maxSeance) {
                          widget.program.monday = true;
                          widget.program.currentSession += 1;
                        }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("L",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.monday
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color:
                        widget.program.monday ? Color(0xFFD34B4B) : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.tuesday) {
                      widget.program.tuesday = false;
                      widget.program.currentSession -= 1;
                    } else {
                      if(widget.program.currentSession < widget.maxSeance) {
                        widget.program.tuesday = true;
                        widget.program.currentSession += 1;
                      }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("M",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.tuesday
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.tuesday
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
                    if (widget.program.wednesday) {
                      widget.program.wednesday = false;
                      widget.program.currentSession -= 1;
                    } else {
                        if(widget.program.currentSession < widget.maxSeance) {
                          widget.program.wednesday = true;
                          widget.program.currentSession += 1;
                        }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("M",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.wednesday
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.wednesday
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
                    if (widget.program.thursday) {
                      widget.program.thursday = false;
                      widget.program.currentSession -= 1;
                    } else {
                        if(widget.program.currentSession < widget.maxSeance) {
                          widget.program.thursday = true;
                          widget.program.currentSession += 1;
                        }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("J",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.thursday
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.thursday
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
                    if (widget.program.friday) {
                      widget.program.friday = false;
                      widget.program.currentSession -= 1;
                    } else {
                        if(widget.program.currentSession < widget.maxSeance) {
                          widget.program.friday = true;
                          widget.program.currentSession += 1;
                        }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("V",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.friday
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color:
                        widget.program.friday ? Color(0xFFD34B4B) : Colors.transparent,
                    shape: BoxShape.circle),
                constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.saturday) {
                      widget.program.saturday = false;
                      widget.program.currentSession -= 1;
                    } else {
                        if(widget.program.currentSession < widget.maxSeance) {
                          widget.program.saturday = true;
                          widget.program.currentSession += 1;
                        }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("S",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.saturday
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color: widget.program.saturday
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
                    if (widget.program.sunday) {
                      widget.program.sunday = false;
                      widget.program.currentSession -= 1;
                    } else {
                        if(widget.program.currentSession < widget.maxSeance) {
                          widget.program.sunday = true;
                          widget.program.currentSession += 1;
                        }
                    }
                  }),
              child: Container(
                child: Center(
                    child: new Text("D",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.program.sunday
                                ? Colors.white
                                : Color(0xFFD34B4B)))),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD34B4B)),
                    color:
                        widget.program.sunday ? Color(0xFFD34B4B) : Colors.transparent,
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
  SessionDatabase sessionDb = SessionDatabase();
  DateDatabase dateDb = DateDatabase();
  final formController = TextEditingController(text: "Votre programme");

  var program = new Program();

  insertDate(day,duration,sessionId,trainingId) async {
    var now = new DateTime.now();
    var startOfDay = new DateTime(now.year, now.month, now.day);
    int millisecondsOf7Days = 604800000;
    while(startOfDay.weekday!=day)
    {
      startOfDay=startOfDay.add(new Duration(days: 1));
    }
    for(int i=0;i<duration;i++) {
      var milliSeconds = startOfDay.millisecondsSinceEpoch + millisecondsOf7Days * i;
      var date = DateModel(date: milliSeconds,
          startAt: milliSeconds,
          endAt: milliSeconds,
          sessionId: sessionId,
          trainingId: trainingId);
      dateDb.insert(date);
    }
  }

  trainingCreated(name, session, duration, seance) async {
    var training = TrainingModel(
        name: name, session: session, duration: duration);
    db.insert(training);
    var lastTraining = await db.getLastTraining();
    var trainingId = lastTraining[0]["id"];
      if(program.monday == true) {
        var session = SessionModel(seance: seance, date: DateTime.now().millisecondsSinceEpoch, trainingId: trainingId);
        sessionDb.insert(session);
        seance += 1;
        var lastSession = await sessionDb.getLastSession();
        var sessionId = lastSession[0]["id"];
        insertDate(1,duration,sessionId,trainingId);
      }
      if(program.tuesday == true) {
        var session = SessionModel(seance: seance, date: DateTime.now().millisecondsSinceEpoch, trainingId: trainingId);
        sessionDb.insert(session);
        seance += 1;
        var lastSession = await sessionDb.getLastSession();
        var sessionId = lastSession[0]["id"];
        insertDate(2,duration,sessionId,trainingId);
      }
      if(program.wednesday == true) {
        var session = SessionModel(seance: seance, date: DateTime.now().millisecondsSinceEpoch, trainingId: trainingId);
        sessionDb.insert(session);
        seance += 1;
        var lastSession = await sessionDb.getLastSession();
        var sessionId = lastSession[0]["id"];
        insertDate(3,duration,sessionId,trainingId);
      }
      if(program.thursday == true) {
        var session = SessionModel(seance: seance, date: DateTime.now().millisecondsSinceEpoch, trainingId: trainingId);
        sessionDb.insert(session);
        seance += 1;
        var lastSession = await sessionDb.getLastSession();
        var sessionId = lastSession[0]["id"];
        insertDate(4,duration,sessionId,trainingId);
      }
      if(program.friday == true) {
        var session = SessionModel(seance: seance, date: DateTime.now().millisecondsSinceEpoch, trainingId: trainingId);
        sessionDb.insert(session);
        seance += 1;
        var lastSession = await sessionDb.getLastSession();
        var sessionId = lastSession[0]["id"];
        insertDate(5,duration,sessionId,trainingId);
      }
      if(program.saturday == true) {
        var session = SessionModel(seance: seance, date: DateTime.now().millisecondsSinceEpoch, trainingId: trainingId);
        sessionDb.insert(session);
        seance += 1;
        var lastSession = await sessionDb.getLastSession();
        var sessionId = lastSession[0]["id"];
        insertDate(6,duration,sessionId,trainingId);
      }
      if(program.sunday == true) {
        var session = SessionModel(seance: seance, date: DateTime.now().millisecondsSinceEpoch, trainingId: trainingId);
        sessionDb.insert(session);
        seance += 1;
        var lastSession = await sessionDb.getLastSession();
        var sessionId = lastSession[0]["id"];
        insertDate(7,duration,sessionId,trainingId);
      }
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
              ? Days(this, null, program.session,program)
              : new Column(
                  children: new List.generate(
                      program.duration, (index) => new Days(this, index, program.session, program))),
          Row(
            children: [
              Container(
                child: program.session == program.currentSession ? RaisedButton(
                    onPressed: () => trainingCreated(formController.text,program.session,program.duration,program.seance),
                    child: Text('Créer le programme',
                        style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFFD34B4B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))) : RaisedButton(
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
