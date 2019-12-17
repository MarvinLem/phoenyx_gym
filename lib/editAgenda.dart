import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Seance {
  double start = 17.00;
  double end = 18.00;
  DateTime date = DateTime(2019, 11, 19);
}

class EditAgenda extends StatefulWidget {
  final Function pageSelected;

  EditAgenda({this.pageSelected});

  @override
  State<StatefulWidget> createState() {
    return EditAgendaState(pageSelected: pageSelected);
  }
}

class EditAgendaState extends State<EditAgenda> {
  final Function pageSelected;

  EditAgendaState({this.pageSelected});

  var seance = new Seance();

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
          Row(
            children: [
              Column(
                  children: [
                    Row(
                        children: [
                          Container(
                              child: Text(
                                "Lundi 15/10",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black87),
                                textAlign: TextAlign.left,
                              ),
                              margin: new EdgeInsets.only(top: 20.0, left: 25),
                              alignment: Alignment.centerLeft),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start),
                    Row(children: [
                      Container(
                          decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFFD34B4B)),
                              borderRadius: new BorderRadius.circular(20.0)),
                          constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width - 40,
                              minHeight: 60.0),
                          alignment: Alignment.centerLeft,
                          margin: new EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 20,
                          ),
                          padding: new EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(children: [
                            Row(children: [
                              Text("Entrainements Pecs Séance du Lundi")
                            ]),
                          ]))
                    ]),
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
                                        fontSize: 18, color: Colors.black87),
                                    textAlign: TextAlign.left),
                                margin:
                                    new EdgeInsets.only(right: 20, left: 25)),
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
                              child: GestureDetector(
                            onTap: () => setState(() {
                              if (seance.start == 23.75) {
                                seance.start = 0;
                              } else {
                                seance.start += 0.25;
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
                            child: Text(
                                seance.start
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
                              child: GestureDetector(
                            onTap: () => setState(() {
                              if (seance.start == 0) {
                                seance.start = 23.75;
                              } else {
                                seance.start -= 0.25;
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
                                        fontSize: 18, color: Colors.black87),
                                    textAlign: TextAlign.left),
                                margin:
                                    new EdgeInsets.only(right: 20, left: 25)),
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
                              child: GestureDetector(
                            onTap: () => setState(() {
                              if (seance.end == 23.75) {
                                seance.end = 0;
                              } else {
                                seance.end += 0.25;
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
                              child: GestureDetector(
                            onTap: () => setState(() {
                              if (seance.end == 0) {
                                seance.end = 23.75;
                              } else {
                                seance.end -= 0.25;
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
                      Container(
                          child: Text(seance.date.toString().substring(0, 10),
                              style: TextStyle(
                                  fontSize: 24, color: Colors.black87),
                              textAlign: TextAlign.left),
                          margin: new EdgeInsets.only(top: 20)),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start),
            Column(children: [
              InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 1, 1),
                        maxTime: DateTime(2020, 12, 31),
                        theme: DatePickerTheme(doneStyle:
                        TextStyle(color: Color(0xFFD34B4B), fontSize: 16)),
                        onChanged: (date) {
                          setState(() {
                            seance.date = date;
                          });
                    },onConfirm: (date) {
                          setState(() {
                            seance.date = date;
                          });
                    }, currentTime: DateTime.now(), locale: LocaleType.fr);
                  },
                  child: Icon(
                    Icons.edit,
                    color: Color(0xFFD34B4B),
                    size: 20.0,
                  ))
            ]),
          ]),
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
