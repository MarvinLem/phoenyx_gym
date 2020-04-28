import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:phoenyx_gym/database/dateDatabase.dart';
import 'package:phoenyx_gym/database/sessionDatabase.dart';
import 'package:phoenyx_gym/database/trainingDatabase.dart';
import './getTraining.dart';
import './createTraining.dart';

import './database/trainingDatabase.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var sessionIdArray = [];
  var dayArray = ["Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"];
  var monthArray = ["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Décembre"];
  DateDatabase db = DateDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();

  @override
  void initState() {
    getAllDate();
  }

  stringifyDate(date){
    var startMinute = new DateTime.fromMillisecondsSinceEpoch(date.startAt).minute.toString() != '0' ? new DateTime.fromMillisecondsSinceEpoch(date.startAt).minute.toString() : '00';
    var endMinute = new DateTime.fromMillisecondsSinceEpoch(date.endAt).minute.toString() != '0' ? new DateTime.fromMillisecondsSinceEpoch(date.endAt).minute.toString() : '00';
    return Text(
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
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16, color: Colors.black87));
  }

  getAllDate() {
    var now = DateTime.now();
    var startOfDay = new DateTime(now.year, now.month, now.day);
    var milliSeconds = startOfDay.millisecondsSinceEpoch - 86400000;
    return FutureBuilder(
        future: db.getAllInformationsForHome(milliSeconds),
        builder: (BuildContext context,
            AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            if(snapshot.data.length > 0) {
              return Column(children: [
                for (DateModel date in snapshot.data)
                  Container(
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetTraining(trainingId: date.trainingId, sessionId: date.sessionId))),
                            child: Row(children: [
                              Column(children: [
                                Container(
                                  child: Column(children: [
                                    Row(children: [
                                      new Text(dayArray[new DateTime.fromMillisecondsSinceEpoch(date.date).weekday-1],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: Color(0xFFD34B4B),
                                          ))
                                    ]),
                                    Row(children: [
                                      new Text(new DateTime.fromMillisecondsSinceEpoch(date.date).day.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFD34B4B),
                                          ))
                                    ]),
                                    Row(children: [
                                      new Text(monthArray[new DateTime.fromMillisecondsSinceEpoch(date.date).month-1],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFD34B4B),
                                          ))
                                    ])
                                  ]),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFFD34B4B)),
                                      shape: BoxShape.circle),
                                  constraints: BoxConstraints(
                                      minWidth: 70.0, minHeight: 70.0),
                                  margin: new EdgeInsets.only(top: 5),
                                  padding: new EdgeInsets.all(15),
                                ),
                              ]),
                              Column(
                                  children: [
                                    Row(children: [
                                      Container(
                                          child: Text(date.name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87)),
                                          margin: new EdgeInsets.only(
                                              left: 18, top: 5)),
                                    ]),
                                    Row(children: [
                                      (date.startAt != null && date.endAt != null) ? Container(
                                          child: stringifyDate(date),
                                          margin: new EdgeInsets.only(
                                              left: 18, top: 10.0)) : Center(),
                                    ])
                                  ],
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center),
                              Column(
                                  children: [
                                    Row(children: [
                                      Container(
                                        margin: new EdgeInsets.only(
                                            left: 15, top: 6),
                                        constraints:
                                        new BoxConstraints(
                                            minWidth: 70,
                                            minHeight: 70),
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black87,
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/chest_training.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    ]),
                                  ],
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start)
                            ])),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start), margin: new EdgeInsets.only(
                      top: 10))
              ]);
            } else {
              return Column(children: [
                Container(
                  child: Text("Vous ne posseder encore aucune séance",
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                  margin: new EdgeInsets.only(bottom: 20, top: 20),
                ),
                RaisedButton(
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
                        borderRadius: BorderRadius.circular(50)))
              ], crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start);
            }
        } else {
            return Center();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: Column(
            children: [
              Container(
                child: new Text("Phoenix Gym".toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Edo',
                        fontSize: 48,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(top: 40.0, bottom: 60),
              ),
              Container(
                  child: new Column(
                      children: [
                        Container(
                          child: new Text(
                            "Prochaines séances".toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFD34B4B),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        getAllDate(),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 30,
                      maxWidth: MediaQuery.of(context).size.width - 30),
                  padding: new EdgeInsets.all(15),
                  decoration: new BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10.0)))
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start),
        decoration: new BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage('assets/images/background.png'))),
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height),
      )
    ]);
  }
}
