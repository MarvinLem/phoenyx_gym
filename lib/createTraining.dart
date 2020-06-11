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
  String seanceString =
      "1 séance différente par jour de la semaine choisi (1ère semaine)";
  int seanceNumber;
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
                      child: new Text((widget.index).toString(),
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
                    if (widget.program.monday.contains(widget.index.toString() + ' AMonday') ||
                        widget.program.repeat == true &&
                            widget.program.monday.isNotEmpty) {
                      if (widget.program.repeat) {
                        widget.program.monday = [];
                        widget.program.currentSession -=
                            widget.program.duration;
                      } else {
                        widget.program.monday.remove(widget.index.toString() + ' AMonday');
                        widget.program.currentSession -= 1;
                      }
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        if (widget.program.repeat) {
                          widget.program.monday = [];
                          for (var i = 0; i < widget.program.duration; i++) {
                            widget.program.monday.add((i + 1).toString() + ' AMonday');
                          }
                          widget.program.currentSession +=
                              widget.program.duration;
                        } else {
                          widget.program.monday.add(widget.index.toString() + ' AMonday');
                          widget.program.currentSession += 1;
                        }
                      }
                    }
                  }),
              child: widget.program.repeat
                  ? Container(
                      child: Center(
                          child: new Text("L",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.monday.isNotEmpty
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.monday.isNotEmpty
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    )
                  : Container(
                      child: Center(
                          child: new Text("L",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.monday
                                          .contains(widget.index.toString() + ' AMonday')
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.monday.contains(widget.index.toString() + ' AMonday')
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.tuesday.contains(widget.index.toString() + ' BTuesday') ||
                        widget.program.repeat == true &&
                            widget.program.tuesday.isNotEmpty) {
                      if (widget.program.repeat) {
                        widget.program.tuesday = [];
                        widget.program.currentSession -=
                            widget.program.duration;
                      } else {
                        widget.program.tuesday.remove(widget.index.toString() + ' BTuesday');
                        widget.program.currentSession -= 1;
                      }
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        if (widget.program.repeat) {
                          widget.program.tuesday = [];
                          for (var i = 0; i < widget.program.duration; i++) {
                            widget.program.tuesday.add((i + 1).toString() + ' BTuesday');
                          }
                          widget.program.currentSession +=
                              widget.program.duration;
                        } else {
                          widget.program.tuesday.add(widget.index.toString() + ' BTuesday');
                          widget.program.currentSession += 1;
                        }
                      }
                    }
                  }),
              child: widget.program.repeat
                  ? Container(
                      child: Center(
                          child: new Text("M",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.tuesday.isNotEmpty
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.tuesday.isNotEmpty
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    )
                  : Container(
                      child: Center(
                          child: new Text("M",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.tuesday
                                          .contains(widget.index.toString() + ' BTuesday')
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.tuesday.contains(widget.index.toString() + ' BTuesday')
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.wednesday.contains(widget.index.toString() + ' CWednesday') ||
                        widget.program.repeat == true &&
                            widget.program.wednesday.isNotEmpty) {
                      if (widget.program.repeat) {
                        widget.program.wednesday = [];
                        widget.program.currentSession -=
                            widget.program.duration;
                      } else {
                        widget.program.wednesday.remove(widget.index.toString() + ' CWednesday');
                        widget.program.currentSession -= 1;
                      }
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        if (widget.program.repeat) {
                          widget.program.wednesday = [];
                          for (var i = 0; i < widget.program.duration; i++) {
                            widget.program.wednesday.add((i + 1).toString() + ' CWednesday');
                          }
                          widget.program.currentSession +=
                              widget.program.duration;
                        } else {
                          widget.program.wednesday.add(widget.index.toString() + ' CWednesday');
                          widget.program.currentSession += 1;
                        }
                      }
                    }
                  }),
              child: widget.program.repeat
                  ? Container(
                      child: Center(
                          child: new Text("M",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.wednesday.isNotEmpty
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.wednesday.isNotEmpty
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    )
                  : Container(
                      child: Center(
                          child: new Text("M",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.wednesday
                                          .contains(widget.index.toString() + ' CWednesday')
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.wednesday.contains(widget.index.toString() + ' CWednesday')
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.thursday.contains(widget.index.toString() + ' DThursday') ||
                        widget.program.repeat == true &&
                            widget.program.thursday.isNotEmpty) {
                      if (widget.program.repeat) {
                        widget.program.thursday = [];
                        widget.program.currentSession -=
                            widget.program.duration;
                      } else {
                        widget.program.thursday.remove(widget.index.toString() + ' DThursday');
                        widget.program.currentSession -= 1;
                      }
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        if (widget.program.repeat) {
                          widget.program.thursday = [];
                          for (var i = 0; i < widget.program.duration; i++) {
                            widget.program.thursday.add((i + 1).toString() + ' DThursday');
                          }
                          widget.program.currentSession +=
                              widget.program.duration;
                        } else {
                          widget.program.thursday.add(widget.index.toString() + ' DThursday');
                          widget.program.currentSession += 1;
                        }
                      }
                    }
                  }),
              child: widget.program.repeat
                  ? Container(
                      child: Center(
                          child: new Text("J",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.thursday.isNotEmpty
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.thursday.isNotEmpty
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    )
                  : Container(
                      child: Center(
                          child: new Text("J",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.thursday
                                          .contains(widget.index.toString() + ' DThursday')
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.thursday.contains(widget.index.toString() + ' DThursday')
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.friday.contains(widget.index.toString() + ' EFriday') ||
                        widget.program.repeat == true &&
                            widget.program.friday.isNotEmpty) {
                      if (widget.program.repeat) {
                        widget.program.friday = [];
                        widget.program.currentSession -=
                            widget.program.duration;
                      } else {
                        widget.program.friday.remove(widget.index.toString() + ' EFriday');
                        widget.program.currentSession -= 1;
                      }
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        if (widget.program.repeat) {
                          widget.program.friday = [];
                          for (var i = 0; i < widget.program.duration; i++) {
                            widget.program.friday.add((i + 1).toString() + ' EFriday');
                          }
                          widget.program.currentSession +=
                              widget.program.duration;
                        } else {
                          widget.program.friday.add(widget.index.toString() + ' EFriday');
                          widget.program.currentSession += 1;
                        }
                      }
                    }
                  }),
              child: widget.program.repeat
                  ? Container(
                      child: Center(
                          child: new Text("V",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.friday.isNotEmpty
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.friday.isNotEmpty
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    )
                  : Container(
                      child: Center(
                          child: new Text("V",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.friday
                                          .contains(widget.index.toString() + ' EFriday')
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.friday.contains(widget.index.toString() + ' EFriday')
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.saturday.contains(widget.index.toString() + ' FSaturday') ||
                        widget.program.repeat == true &&
                            widget.program.saturday.isNotEmpty) {
                      if (widget.program.repeat) {
                        widget.program.saturday = [];
                        widget.program.currentSession -=
                            widget.program.duration;
                      } else {
                        widget.program.saturday.remove(widget.index.toString() + ' FSaturday');
                        widget.program.currentSession -= 1;
                      }
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        if (widget.program.repeat) {
                          widget.program.saturday = [];
                          for (var i = 0; i < widget.program.duration; i++) {
                            widget.program.saturday.add((i + 1).toString() + ' FSaturday');
                          }
                          widget.program.currentSession +=
                              widget.program.duration;
                        } else {
                          widget.program.saturday.add(widget.index.toString() + ' FSaturday');
                          widget.program.currentSession += 1;
                        }
                      }
                    }
                  }),
              child: widget.program.repeat
                  ? Container(
                      child: Center(
                          child: new Text("S",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.saturday.isNotEmpty
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.saturday.isNotEmpty
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    )
                  : Container(
                      child: Center(
                          child: new Text("S",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.saturday
                                          .contains(widget.index.toString() + ' FSaturday')
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.saturday.contains(widget.index.toString() + ' FSaturday')
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    )),
        ]),
        Column(children: [
          GestureDetector(
              onTap: () => widget.parent.setState(() {
                    if (widget.program.sunday.contains(widget.index.toString() + ' GSunday') ||
                        widget.program.repeat == true &&
                            widget.program.sunday.isNotEmpty) {
                      if (widget.program.repeat) {
                        widget.program.sunday = [];
                        widget.program.currentSession -=
                            widget.program.duration;
                      } else {
                        widget.program.sunday.remove(widget.index.toString() + ' GSunday');
                        widget.program.currentSession -= 1;
                      }
                    } else {
                      if (widget.program.currentSession < widget.maxSeance) {
                        if (widget.program.repeat) {
                          widget.program.sunday = [];
                          for (var i = 0; i < widget.program.duration; i++) {
                            widget.program.sunday.add((i + 1).toString() + ' GSunday');
                          }
                          widget.program.currentSession +=
                              widget.program.duration;
                        } else {
                          widget.program.sunday.add(widget.index.toString() + ' GSunday');
                          widget.program.currentSession += 1;
                        }
                      }
                    }
                  }),
              child: widget.program.repeat
                  ? Container(
                      child: Center(
                          child: new Text("D",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.sunday.isNotEmpty
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.sunday.isNotEmpty
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    )
                  : Container(
                      child: Center(
                          child: new Text("D",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.program.sunday
                                          .contains(widget.index.toString() + ' GSunday')
                                      ? Colors.white
                                      : Color(0xFFD34B4B)))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B)),
                          color: widget.program.sunday.contains(widget.index.toString() + ' GSunday')
                              ? Color(0xFFD34B4B)
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      constraints:
                          BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                      margin:
                          new EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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

  resetProgram() {
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

  insertDate(day, duration, seance, week, trainingId, seanceIdArray) async {
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

    /*
    startOfDay.millisecondsSinceEpoch < startOfMonday.millisecondsSinceEpoch
        ? weekBonus = 0
        : weekBonus = 1;
    */
    /*
    if (program.repeat == false && globalWeekBonus == 0 && week == 1) {
      startOfDay.millisecondsSinceEpoch < startOfMonday.millisecondsSinceEpoch
          ? globalWeekBonus = 0
          : globalWeekBonus = 1;
    }
    */

    var c = 0;
    for (int i = 0; i < duration; i++) {
      var milliSeconds =
          startOfDay.millisecondsSinceEpoch + millisecondsOf7Days * i;
      var session = SessionModel(
          seance: seance,
          week: week,
          sessionNumber: week,
          date: milliSeconds +
              ((week - 1 - weekBonus + globalWeekBonus) * millisecondsOf7Days),
          startAt: milliSeconds +
              ((week - 1 - weekBonus + globalWeekBonus) * millisecondsOf7Days),
          endAt: milliSeconds +
              ((week - 1 - weekBonus + globalWeekBonus) * millisecondsOf7Days),
          trainingId: trainingId,
          seanceId: seanceIdArray[c],
          done: 0);
      sessionDb.insert(session);
      c < seanceIdArray.length - 1 ? c += 1 : c = 0;
    }
  }

  trainingCreated(name, session, duration, seance) async {
    var training =
        TrainingModel(name: name, session: session, duration: duration, done: 0, predefined: 0);
    db.insert(training);
    var lastTraining = await db.getLastTraining();
    var trainingId = lastTraining[0]["id"];
    var seanceModel = SeanceModel(trainingId: trainingId);

    switch (program.seanceString) {
      case '1 séance différente par jour de la semaine choisi (1ère semaine)':
        for (var i = 0; i < program.session; i++) {
          seanceDb.insert(seanceModel);
        }
        var lastSeances = await seanceDb.getLastSeances(program.session);
        for (var i = 0; i < lastSeances.length; i++) {
          seancesArray.add(lastSeances[i]['id']);
        }
        break;
      case '1 séance':
      case '2 séance':
      case '3 séance':
      case '4 séance':
      case '5 séance':
      case '6 séance':
        for (var i = 0; i < program.seanceNumber; i++) {
          seanceDb.insert(seanceModel);
        }
        var lastSeances = await seanceDb.getLastSeances(program.seanceNumber);
        for (var i = 0; i < lastSeances.length; i++) {
          seancesArray.add(lastSeances[i]['id']);
        }
        break;
      case "unique pour chaque session d'entrainement":
        for (var i = 0; i < program.session * program.duration; i++) {
          seanceDb.insert(seanceModel);
        }
        var lastSeances =
            await seanceDb.getLastSeances(program.session * program.duration);
        for (var i = 0; i < lastSeances.length; i++) {
          seancesArray.add(lastSeances[i]['id']);
        }
        break;
    }

    var days = [...program.monday, ...program.tuesday, ...program.wednesday, ...program.thursday, ...program.friday, ...program.saturday, ...program.sunday];
    days = days..sort();
    for(var i=0;i<days.length;i++){
      var weekString = days[i].split(" ")[0];
      var week = int.parse(weekString);
      var dayString = days[i].split(" ")[1];
      var day;
      switch (dayString){
        case 'AMonday':
          day = 1;
          break;
        case 'BTuesday':
          day = 2;
          break;
        case 'CWednesday':
          day = 3;
          break;
        case 'DThursday':
          day = 4;
          break;
        case 'EFriday':
          day = 5;
          break;
        case 'FSaturday':
          day = 6;
          break;
        case 'GSunday':
          day = 7;
          break;
      }
        insertDate(
            day, 1, seance, week, trainingId,
            [seancesArray[seance - 1]]);
      seance < seancesArray.length ? seance += 1 : seance = 1;
    }

    globalWeekBonus = 0;
    Navigator.pop(context);
  }

  @override
  void dispose() {
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
                      return 'Ce champ doit être rempli';
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
                                if (program.session < 7) {
                                  program.session += 1;
                                  resetProgram();
                                }
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
              Container(
                  child: Text('Nombres de séances différentes',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.left),
                  margin: EdgeInsets.only(top: 40)),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
              children: [
                Container(
                    child: new DropdownButton<String>(
                      isExpanded: true,
                      value: program.seanceString,
                      items: <String>[
                        '1 séance différente par jour de la semaine choisi (1ère semaine)',
                        '1 séance',
                        '2 séance',
                        '3 séance',
                        '4 séance',
                        '5 séance',
                        '6 séance',
                        "unique pour chaque session d'entrainement"
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {
                        switch (value) {
                          case "1 séance":
                            program.seanceNumber = 1;
                            break;
                          case "2 séance":
                            program.seanceNumber = 2;
                            break;
                          case "3 séance":
                            program.seanceNumber = 3;
                            break;
                          case "4 séance":
                            program.seanceNumber = 4;
                            break;
                          case "5 séance":
                            program.seanceNumber = 5;
                            break;
                          case "6 séance":
                            program.seanceNumber = 6;
                            break;
                          default:
                            program.seanceNumber = null;
                            break;
                        }
                        program.seanceString = value;
                      }),
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 25),
                    constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40, maxWidth: MediaQuery.of(context).size.width - 40))
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center),
          Row(
            children: [
              Column(children: [
                Container(
                    child: new Text(
                      "Votre programme se déroule aux mêmes jours chaque semaine ?",
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
                          left: 10, right: 10, top: 50, bottom: 30)),
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
              ? Days(this, null, program.session * program.duration, program)
              : new Column(
                  children: new List.generate(
                      program.duration,
                      (index) => new Days(this, index + 1,
                          program.session * program.duration, program))),
          Row(
            children: [
              Container(
                child:
                    program.session * program.duration == program.currentSession
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
