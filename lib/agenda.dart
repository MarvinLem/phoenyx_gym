import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import './editAgenda.dart';
import './getTraining.dart';
import './createTraining.dart';

import './database/dateDatabase.dart';

class AgendaOptions {
  int trainingDay = 1;
}

class Agenda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AgendaState();
  }
}

class AgendaState extends State<Agenda> {
  var agenda = new AgendaOptions();
  var dayArray = [
    "Lundi",
    "Mardi",
    "Mercredi",
    "Jeudi",
    "Vendredi",
    "Samedi",
    "Dimanche"
  ];
  Map<DateTime, List> training = {};
  DateDatabase db = DateDatabase();
  var _calendarController;

  @override
  void initState() {
    getAllDate();
    _calendarController = CalendarController();
  }

  stringifyDate(date) {
    var startMinute = new DateTime.fromMillisecondsSinceEpoch(date.startAt)
                .minute
                .toString() !=
            '0'
        ? new DateTime.fromMillisecondsSinceEpoch(date.startAt)
            .minute
            .toString()
        : '00';
    var endMinute = new DateTime.fromMillisecondsSinceEpoch(date.endAt)
                .minute
                .toString() !=
            '0'
        ? new DateTime.fromMillisecondsSinceEpoch(date.endAt).minute.toString()
        : '00';
    return Text(
        dayArray[new DateTime.fromMillisecondsSinceEpoch(date.date).weekday -
                1] +
            " " +
            new DateTime.fromMillisecondsSinceEpoch(date.date).day.toString() +
            "/" +
            new DateTime.fromMillisecondsSinceEpoch(date.date)
                .month
                .toString() +
            " - " +
            new DateTime.fromMillisecondsSinceEpoch(date.startAt)
                .hour
                .toString() +
            ":" +
            startMinute +
            "->" +
            new DateTime.fromMillisecondsSinceEpoch(date.endAt)
                .hour
                .toString() +
            ":" +
            endMinute,
        style: TextStyle(fontSize: 16, color: Colors.black87));
  }

  void onDaySelected(DateTime day, List events) {
    events.forEach((event) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GetTraining(trainingId: event[0], sessionId: event[1]))));
  }

  getCalendar() {
    return FutureBuilder(
        future: db.getAllDate(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              training = {};
              for (DateModel date in snapshot.data) {
                DateTime datetime =
                    DateTime.fromMillisecondsSinceEpoch(date.date);
                training[datetime] != null
                    ? training[datetime].add([date.trainingId, date.sessionId])
                    : training.putIfAbsent(
                        datetime,
                        () => [
                              [date.trainingId, date.sessionId]
                            ]);
              }
              return TableCalendar(
                  availableGestures: AvailableGestures.horizontalSwipe,
                  calendarController: _calendarController,
                  locale: 'fr_FR',
                  events: training,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  availableCalendarFormats: const {
                    CalendarFormat.month: '',
                  },
                  calendarStyle: CalendarStyle(
                    weekendStyle: TextStyle(color: Color(0xFFD34B4B)),
                    selectedColor: Color(0xFFD34B4B),
                    todayColor: Color(0xFF9E3838),
                    markersColor: Color(0xFFD34B4B),
                    highlightSelected: false,
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Color(0xFFD34B4B)),
                  ),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                  ),
                  onDaySelected: onDaySelected);
            } else {
              return TableCalendar(
                  calendarController: _calendarController,
                  locale: 'fr_FR',
                  events: training,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  availableCalendarFormats: const {
                    CalendarFormat.month: '',
                  },
                  calendarStyle: CalendarStyle(
                    weekendStyle: TextStyle(color: Color(0xFFD34B4B)),
                    selectedColor: Color(0xFFD34B4B),
                    todayColor: Color(0xFF9E3838),
                    markersColor: Color(0xFFD34B4B),
                    highlightSelected: false,
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Color(0xFFD34B4B)),
                  ),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                  ),
                  onDaySelected: onDaySelected);
            }
          } else {
            return Center();
          }
        });
  }

  getAllDate() {
    var now = DateTime.now();
    var startOfDay = new DateTime(now.year, now.month, now.day);
    var milliSeconds = startOfDay.millisecondsSinceEpoch - 86400000;
    return FutureBuilder(
        future: db.getAllInformationsForHome(milliSeconds),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              return Column(children: [
                for (DateModel date in snapshot.data)
                  Row(
                    children: [
                      Column(children: [
                        Row(children: [
                          Container(
                              child: (date.startAt != date.date &&
                                      date.endAt != date.date)
                                  ? stringifyDate(date)
                                  : Text(
                                      dayArray[
                                              new DateTime.fromMillisecondsSinceEpoch(
                                                          date.date)
                                                      .weekday -
                                                  1] +
                                          " " +
                                          new DateTime.fromMillisecondsSinceEpoch(
                                                  date.date)
                                              .day
                                              .toString() +
                                          "/" +
                                          new DateTime.fromMillisecondsSinceEpoch(
                                                  date.date)
                                              .month
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87)),
                              margin:
                                  new EdgeInsets.only(top: 20.0, left: 25.0)),
                          Container(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditAgenda(dateId: date.id)),
                                    );
                                  },
                                  child: Text("Changer l'horaire",
                                      style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                          color: Colors.black87))),
                              margin:
                                  new EdgeInsets.only(left: 20.0, top: 20.0)),
                        ]),
                        Row(children: [
                          Container(
                              decoration: new BoxDecoration(
                                  border:
                                      new Border.all(color: Color(0xFFD34B4B)),
                                  borderRadius:
                                      new BorderRadius.circular(20.0)),
                              constraints: BoxConstraints(
                                  minWidth:
                                      MediaQuery.of(context).size.width - 40,
                                  minHeight: 60.0),
                              alignment: Alignment.center,
                              margin: new EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Column(children: [
                                Row(children: [
                                  Text(date.name,
                                      style: TextStyle(fontSize: 16))
                                ]),
                              ]))
                        ], mainAxisAlignment: MainAxisAlignment.center),
                      ], crossAxisAlignment: CrossAxisAlignment.start)
                    ],
                  ),
              ]);
            } else {
              return Column(
                  children: [
                    Container(
                      child: Text("Vous ne posseder encore aucune séance",
                          style:
                              TextStyle(fontSize: 16, color: Colors.black87)),
                      margin: new EdgeInsets.only(bottom: 20, top: 20),
                    ),
                    Container(
                        child: RaisedButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateTraining()),
                                ),
                            child: Text('Créer votre premier programme',
                                style: TextStyle(fontSize: 18)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            color: Color(0xFFD34B4B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        margin: new EdgeInsets.only(bottom: 20))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start);
            }
          } else {
            return Center();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(children: [
          Container(
              child: new Text("Calendrier flexible".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD34B4B),
                      fontWeight: FontWeight.bold)),
              margin: new EdgeInsets.only(left: 20.0, top: 20.0, bottom: 0))
        ]),
        getCalendar(),
        /*
        Row(
          children: [
            Column(children: [
              SizedBox(
                  width: 340,
                  child: Container(
                      child: Row(children: [
                        Container(
                          child: GestureDetector(
                            child: new Icon(Icons.arrow_left,
                                size: 30, color: Color(0xFFD34B4B)),
                          ),
                        ),
                        Text("Octobre 2018", textAlign: TextAlign.center),
                        Container(
                          child: GestureDetector(
                            child: new Icon(Icons.arrow_right,
                                size: 30, color: Color(0xFFD34B4B)),
                          ),
                        ),
                      ], mainAxisAlignment: MainAxisAlignment.center),
                      margin: new EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding:
                          new EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD34B4B))))),
              Row(children: [
                Column(
                  children: [
                    agenda.trainingDay == 1
                        ? Draggable<int>(
                            data: agenda.trainingDay,
                            child: Container(
                              child: InkWell(
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GetAgenda()),
                                      ),
                                  child: Center(
                                      child: new Text("1",
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Colors.white)))),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFD34B4B)),
                                  color: Color(0xFFD34B4B),
                                  shape: BoxShape.circle),
                              constraints: BoxConstraints(
                                  minWidth: 33.0, minHeight: 33.0),
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                            ),
                            feedback: Container(
                              child: Center(
                                child: Icon(
                                  Icons.fitness_center,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFD34B4B)),
                                  color: Color(0xFFD34B4B),
                                  shape: BoxShape.circle),
                              constraints: BoxConstraints(
                                  minWidth: 40.0, minHeight: 40.0),
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                            ),
                            childWhenDragging: Container(
                              child: Center(
                                  child: new Text("1",
                                      textAlign: TextAlign.center)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFD34B4B)),
                                  shape: BoxShape.circle),
                              constraints: BoxConstraints(
                                  minWidth: 33.0, minHeight: 33.0),
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                            ))
                        : DragTarget<int>(
                            builder: (context, List<int> candidateData,
                                rejectedData) {
                              return Container(
                                child: Center(
                                    child: new Text(
                                  "1",
                                  textAlign: TextAlign.center,
                                )),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFD34B4B)),
                                    shape: BoxShape.circle),
                                constraints: BoxConstraints(
                                    minWidth: 33.0, minHeight: 33.0),
                                margin: new EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                              );
                            },
                            onAccept: (data) {
                              setState(() {
                                agenda.trainingDay = 1;
                              });
                            },
                          )
                  ],
                ),
                Column(children: [
                  agenda.trainingDay == 2
                      ? Draggable<int>(
                          data: agenda.trainingDay,
                          child: Container(
                            child: InkWell(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GetAgenda()),
                                    ),
                                child: Center(
                                    child: new Text("2",
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Colors.white)))),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFD34B4B)),
                                color: Color(0xFFD34B4B),
                                shape: BoxShape.circle),
                            constraints:
                                BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                            margin: new EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                          ),
                          feedback: Container(
                            child: Center(
                              child: Icon(
                                Icons.fitness_center,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFD34B4B)),
                                color: Color(0xFFD34B4B),
                                shape: BoxShape.circle),
                            constraints:
                                BoxConstraints(minWidth: 40.0, minHeight: 40.0),
                            margin: new EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                          ),
                          childWhenDragging: Container(
                            child: Center(
                                child:
                                    new Text("2", textAlign: TextAlign.center)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFD34B4B)),
                                shape: BoxShape.circle),
                            constraints:
                                BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                            margin: new EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                          ))
                      : DragTarget<int>(
                          builder:
                              (context, List<int> candidateData, rejectedData) {
                            return Container(
                              child: Center(
                                  child: new Text(
                                "2",
                                textAlign: TextAlign.center,
                              )),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFD34B4B)),
                                  shape: BoxShape.circle),
                              constraints: BoxConstraints(
                                  minWidth: 33.0, minHeight: 33.0),
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                            );
                          },
                          onAccept: (data) {
                            setState(() {
                              agenda.trainingDay = 2;
                            });
                          },
                        )
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "3",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "4",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "5",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "6",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "7",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
              ]),
              Row(children: [
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "8",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "9",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "10",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "11",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "12",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "13",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Center(
                        child: new Text(
                      "14",
                      textAlign: TextAlign.center,
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B)),
                        shape: BoxShape.circle),
                    constraints:
                        BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                ]),
              ]),
            ]),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        */
        Row(children: [
          Container(
              child: new Text("Prochains entrainements".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD34B4B),
                      fontWeight: FontWeight.bold)),
              margin: new EdgeInsets.only(left: 20.0, top: 20.0))
        ]),
        getAllDate(),
      ],
    );
  }
}
