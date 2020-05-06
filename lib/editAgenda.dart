import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import './database/sessionDatabase.dart';

class Seance {
  double start;
  double end;
  int date;

  Seance(this.start, this.end, this.date);
}

class EditAgenda extends StatefulWidget {
  int dateId;

  EditAgenda({this.dateId});

  @override
  State<StatefulWidget> createState() {
    return EditAgendaState(dateId: dateId);
  }
}

class EditAgendaState extends State<EditAgenda> {
  int dateId;
  var dayArray = [
    "Lundi",
    "Mardi",
    "Mercredi",
    "Jeudi",
    "Vendredi",
    "Samedi",
    "Dimanche"
  ];
  EditAgendaState({this.dateId});

  bool buttonPressed = false;
  bool loopActive = false;

  SessionDatabase db = SessionDatabase();

  @override
  void initState() {
    getDateById(dateId);
  }

  getDateById(id) {
    return FutureBuilder(
        future: db.getSessionById(id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var seance = new Seance(
                snapshot.data[0]['startAt'] != null
                    ? ((snapshot.data[0]['startAt'] -
                                snapshot.data[0]['date']) /
                            3600000)
                        .toDouble()
                    : 0,
                snapshot.data[0]['endAt'] != null
                    ? ((snapshot.data[0]['endAt'] - snapshot.data[0]['date']) /
                            3600000)
                        .toDouble()
                    : 0,
                snapshot.data[0]['date']);
            if (seance.start == null && seance.end == null) {
              seance.start = 12;
              seance.end = 12;
            }
            return Column(children: [
              Row(
                children: [
                  Column(
                      children: [
                        Row(
                            children: [
                              Container(
                                  child: Text(
                                    dayArray[
                                            new DateTime.fromMillisecondsSinceEpoch(
                                                        seance.date)
                                                    .weekday -
                                                1] +
                                        " " +
                                        new DateTime.fromMillisecondsSinceEpoch(
                                                seance.date)
                                            .day
                                            .toString() +
                                        "/" +
                                        new DateTime.fromMillisecondsSinceEpoch(
                                                seance.date)
                                            .month
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                    textAlign: TextAlign.left,
                                  ),
                                  margin:
                                      new EdgeInsets.only(top: 20.0, left: 25),
                                  alignment: Alignment.centerLeft),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start)
                ],
              ),
              Row(
                  children: [
                    Column(
                        children: [
                          Row(
                              children: [
                                Container(
                                    child: Text("Debut de la séance:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87),
                                        textAlign: TextAlign.left),
                                    margin: new EdgeInsets.only(
                                        right: 20, left: 25)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center)
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center),
                    Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if (seance.start == 23.75) {
                                        seance.start = 0;
                                      } else {
                                        seance.start += 0.25;
                                      }
                                      if (seance.start > seance.end) {
                                        seance.end = seance.start;
                                        int newEnd = (seance.date +
                                            (seance.end * 3600000))
                                            .toInt();
                                        db.updateEnd(newEnd, dateId);
                                      }
                                      int newStart = (seance.date +
                                              (seance.start * 3600000))
                                          .toInt();
                                      db.updateStart(newStart, dateId);
                                    });
                                    // wait a bit
                                    await Future.delayed(
                                        Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                                  child: Text(
                                      seance.start
                                          .toString()
                                          .replaceAll(".25", ":15")
                                          .replaceAll(".5", ":30")
                                          .replaceAll(".75", ":45")
                                          .replaceAll(".0", ":00"),
                                      style: TextStyle(
                                          fontSize: 26, color: Colors.black87),
                                      textAlign: TextAlign.left))
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          Row(
                            children: [
                              Container(
                                  child: Listener(
                                onPointerDown: (details) async {
                                  buttonPressed = true;
                                  if (loopActive) return;

                                  loopActive = true;

                                  while (buttonPressed) {
                                    // do your thing
                                    setState(() {
                                      if (seance.start == 0) {
                                        seance.start = 23.75;
                                      } else {
                                        seance.start -= 0.25;
                                      }
                                      if (seance.start > seance.end) {
                                        seance.end = seance.start;
                                        int newEnd = (seance.date +
                                            (seance.end * 3600000))
                                            .toInt();
                                        db.updateEnd(newEnd, dateId);
                                      }
                                      int newStart = (seance.date +
                                              (seance.start * 3600000))
                                          .toInt();
                                      db.updateStart(newStart, dateId);
                                    });
                                    // wait a bit
                                    await Future.delayed(
                                        Duration(milliseconds: 100));
                                  }
                                  loopActive = false;
                                },
                                onPointerUp: (details) {
                                  buttonPressed = false;
                                },
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
                  mainAxisAlignment: MainAxisAlignment.start),
              Row(
                  children: [
                    Column(
                        children: [
                          Row(
                              children: [
                                Container(
                                    child: Text("Fin de la séance:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87),
                                        textAlign: TextAlign.left),
                                    margin: new EdgeInsets.only(
                                        right: 20, left: 25)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center)
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center),
                    Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: Listener(
                                    onPointerDown: (details) async {
                                      buttonPressed = true;
                                      if (loopActive) return;

                                      loopActive = true;

                                      while (buttonPressed) {
                                        // do your thing
                                        setState(() {
                                          if (seance.end == 23.75) {
                                            seance.end = 0;
                                          } else {
                                            seance.end += 0.25;
                                          }
                                          if (seance.end < seance.start) {
                                            seance.start = seance.end;
                                            int newStart = (seance.date +
                                                (seance.start * 3600000))
                                                .toInt();
                                            db.updateStart(newStart, dateId);
                                          }
                                          int newEnd = (seance.date +
                                              (seance.end * 3600000))
                                              .toInt();
                                          db.updateEnd(newEnd, dateId);
                                        });
                                        // wait a bit
                                        await Future.delayed(
                                            Duration(milliseconds: 100));
                                      }
                                      loopActive = false;
                                    },
                                    onPointerUp: (details) {
                                      buttonPressed = false;
                                    },
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
                                child: Text(
                                    seance.end
                                        .toString()
                                        .replaceAll(".25", ":15")
                                        .replaceAll(".5", ":30")
                                        .replaceAll(".75", ":45")
                                        .replaceAll(".0", ":00"),
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
                                  child: Listener(
                                    onPointerDown: (details) async {
                                      buttonPressed = true;
                                      if (loopActive) return;

                                      loopActive = true;

                                      while (buttonPressed) {
                                        // do your thing
                                        setState(() {
                                          if (seance.end == 0) {
                                            seance.end = 23.75;
                                          } else {
                                            seance.end -= 0.25;
                                          }
                                          if (seance.end < seance.start) {
                                            seance.start = seance.end;
                                            int newStart = (seance.date +
                                                (seance.start * 3600000))
                                                .toInt();
                                            db.updateStart(newStart, dateId);
                                          }
                                          int newEnd = (seance.date +
                                              (seance.end * 3600000))
                                              .toInt();
                                          db.updateEnd(newEnd, dateId);
                                        });
                                        // wait a bit
                                        await Future.delayed(
                                            Duration(milliseconds: 100));
                                      }
                                      loopActive = false;
                                    },
                                    onPointerUp: (details) {
                                      buttonPressed = false;
                                    },
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
                  mainAxisAlignment: MainAxisAlignment.start),
              Row(children: [
                Column(
                    children: [
                      Row(
                          children: [
                            Container(
                                child: Text("Date de la séance:",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black87),
                                    textAlign: TextAlign.left),
                                margin: new EdgeInsets.only(
                                    top: 20, right: 20, left: 25)),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center)
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center),
                Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2018, 1, 1),
                                    maxTime: DateTime(2024, 12, 31),
                                    theme: DatePickerTheme(
                                        doneStyle: TextStyle(
                                            color: Color(0xFFD34B4B),
                                            fontSize: 16)), onChanged: (date) {
                                  setState(() {
                                    seance.date = date.millisecondsSinceEpoch;
                                    db.updateDate(seance.date, dateId);
                                    db.updateStart((seance.date + (seance.start * 3600000)).toInt(), dateId);
                                    db.updateEnd((seance.date + (seance.end * 3600000)).toInt(), dateId);
                                  });
                                }, onConfirm: (date) {
                                  setState(() {
                                    seance.date = date.millisecondsSinceEpoch;
                                    db.updateDate(seance.date, dateId);
                                    db.updateStart((seance.date + (seance.start * 3600000)).toInt(), dateId);
                                    db.updateEnd((seance.date + (seance.end * 3600000)).toInt(), dateId);
                                  });
                                },
                                    currentTime: DateTime.fromMillisecondsSinceEpoch(seance.date),
                                    locale: LocaleType.fr);
                              },
                              child: Container(
                                  child: Text(
          new DateTime.fromMillisecondsSinceEpoch(seance.date).toString().substring(0, 10),
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black87),
                                      textAlign: TextAlign.left),
                                  margin: new EdgeInsets.only(top: 20))),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start),
                Column(children: [
                  Icon(
                    Icons.edit,
                    color: Color(0xFFD34B4B),
                    size: 20.0,
                  )
                ]),
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
                child: new Text("Changement d'horaire".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10))
          ]),
          getDateById(dateId),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Confirmer les changements',
                        style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFFD34B4B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                alignment: Alignment.center,
                margin: new EdgeInsets.only(top: 30.0, bottom: 30),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ]));
  }
}
