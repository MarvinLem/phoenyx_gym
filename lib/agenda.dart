import 'package:flutter/material.dart';

class Agenda extends StatelessWidget {
  final Function pageSelected;

  Agenda({this.pageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(children: [
        Container(
            child: new Text("Calendrier flexible".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10))
      ]),
      Row(
        children: [
          Column(children: [
            SizedBox(
                width: 340,
                child: Container(
                    child: Text("Octobre 2018", textAlign: TextAlign.center),
                    margin:
                        new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding:
                        new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD34B4B))))),
            Row(children: [
              Column(children: [
                Container(
                  child: InkWell(
                      onTap: () => pageSelected("getAgenda"),
                      child: Center(
                          child: new Text(
                        "1",
                        textAlign: TextAlign.center,
                      ))),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD34B4B)),
                      shape: BoxShape.circle),
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
              ]),
              Column(children: [
                Container(
                  child: Center(
                      child: new Text(
                    "2",
                    textAlign: TextAlign.center,
                  )),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD34B4B)),
                      shape: BoxShape.circle),
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
              ]),
            ]),
          ]),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(children: [
        Container(
            child: new Text("Prochains entrainements".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(left: 20.0, top: 20.0))
      ]),
      Row(
        children: [
          Column(children: [
            Row(children: [
              Container(
                  child: Text("Lundi 15/10 - 17h -> 18h",
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                  margin: new EdgeInsets.only(top: 20.0)),
              Container(
                  child: InkWell(
                      onTap: () => pageSelected("editAgenda"),
                      child: Text("Changer l'horaire",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              color: Colors.black87))),
                  margin: new EdgeInsets.only(left: 20.0, top: 20.0)),
            ]),
            Row(children: [
              Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Color(0xFFD34B4B)),
                      borderRadius: new BorderRadius.circular(20.0)),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 40,
                      minHeight: 60.0),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(children: [
                    Row(children: [
                      Text("Entrainements Pectoraux Séance du Lundi")
                    ]),
                  ]))
            ], mainAxisAlignment: MainAxisAlignment.center),
          ])
        ],
      ),
      Row(
        children: [
          Column(children: [
            Row(children: [
              Container(
                  child: Text("Mardi 16/10 - 18h -> 19h",
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                  margin: new EdgeInsets.only(top: 20.0)),
              Container(
                  child: InkWell(
                      onTap: () => pageSelected("editAgenda"),
                      child: Text("Changer l'horaire",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              color: Colors.black87))),
                  margin: new EdgeInsets.only(left: 20.0, top: 20.0)),
            ]),
            Row(children: [
              Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Color(0xFFD34B4B)),
                      borderRadius: new BorderRadius.circular(20.0)),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 40,
                      minHeight: 60.0),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 20,
                  ),
                  child: Column(children: [
                    Row(children: [
                      Text("Entrainements Jambes Séance du Mardi")
                    ]),
                  ]))
            ], mainAxisAlignment: MainAxisAlignment.center),
          ])
        ],
      )
    ]);
  }
}
