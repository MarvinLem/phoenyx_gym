import 'package:flutter/material.dart';
import './editTraining.dart';

class Program {
  int session = 3;
  int duration = 5;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;
}

class CreateTraining extends StatefulWidget {
  final Function pageSelected;

  CreateTraining({this.pageSelected});

  @override
  State<StatefulWidget> createState() {
    return CreateTrainingState(pageSelected: pageSelected);
  }
}

class CreateTrainingState extends State<CreateTraining> {
  final Function pageSelected;

  CreateTrainingState({this.pageSelected});

  var program = new Program();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Phoenix Gym'),
        ),
        body: ListView(children: [
      Row(children: [
        Container(
            child: new Text("Nom du programme".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(left: 20.0, top: 20.0)),
      ]),
      Row(
        children: [
          Container(
            child: new Text("Nombre de séance par semaine",
                style: TextStyle(fontSize: 18, color: Colors.black87)),
            margin: new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
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
                            style:
                                TextStyle(fontSize: 26, color: Colors.black87),
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
                          if(program.session>1){
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
              margin: new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
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
                            style:
                                TextStyle(fontSize: 26, color: Colors.black87),
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
                              if(program.duration>1){
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
          Container(
              child: new Text(
                "Avoir la séance le",
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              margin: new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 40))
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Column(children: [
            Container(
              child: GestureDetector(
                  onTap: () => setState(() {
                        if (program.monday) {
                          program.monday = false;
                        } else {
                          program.monday = true;
                        }
                      }),
                  child: Center(
                      child: new Text("L",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: program.monday
                                  ? Colors.white
                                  : Color(0xFFD34B4B))))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD34B4B)),
                  color:
                      program.monday ? Color(0xFFD34B4B) : Colors.transparent,
                  shape: BoxShape.circle),
              constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
              margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ]),
          Column(children: [
            Container(
              child: GestureDetector(
                  onTap: () => setState(() {
                        if (program.tuesday) {
                          program.tuesday = false;
                        } else {
                          program.tuesday = true;
                        }
                      }),
                  child: Center(
                      child: new Text("M",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: program.tuesday
                                  ? Colors.white
                                  : Color(0xFFD34B4B))))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD34B4B)),
                  color:
                      program.tuesday ? Color(0xFFD34B4B) : Colors.transparent,
                  shape: BoxShape.circle),
              constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
              margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ]),
          Column(children: [
            Container(
              child: GestureDetector(
                  onTap: () => setState(() {
                        if (program.wednesday) {
                          program.wednesday = false;
                        } else {
                          program.wednesday = true;
                        }
                      }),
                  child: Center(
                      child: new Text("M",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: program.wednesday
                                  ? Colors.white
                                  : Color(0xFFD34B4B))))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD34B4B)),
                  color: program.wednesday
                      ? Color(0xFFD34B4B)
                      : Colors.transparent,
                  shape: BoxShape.circle),
              constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
              margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ]),
          Column(children: [
            Container(
              child: GestureDetector(
                  onTap: () => setState(() {
                        if (program.thursday) {
                          program.thursday = false;
                        } else {
                          program.thursday = true;
                        }
                      }),
                  child: Center(
                      child: new Text("J",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: program.thursday
                                  ? Colors.white
                                  : Color(0xFFD34B4B))))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD34B4B)),
                  color:
                      program.thursday ? Color(0xFFD34B4B) : Colors.transparent,
                  shape: BoxShape.circle),
              constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
              margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ]),
          Column(children: [
            Container(
              child: GestureDetector(
                  onTap: () => setState(() {
                        if (program.friday) {
                          program.friday = false;
                        } else {
                          program.friday = true;
                        }
                      }),
                  child: Center(
                      child: new Text("V",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: program.friday
                                  ? Colors.white
                                  : Color(0xFFD34B4B))))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD34B4B)),
                  color:
                      program.friday ? Color(0xFFD34B4B) : Colors.transparent,
                  shape: BoxShape.circle),
              constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
              margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ]),
          Column(children: [
            Container(
              child: GestureDetector(
                  onTap: () => setState(() {
                        if (program.saturday) {
                          program.saturday = false;
                        } else {
                          program.saturday = true;
                        }
                      }),
                  child: Center(
                      child: new Text("S",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: program.saturday
                                  ? Colors.white
                                  : Color(0xFFD34B4B))))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD34B4B)),
                  color:
                      program.saturday ? Color(0xFFD34B4B) : Colors.transparent,
                  shape: BoxShape.circle),
              constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
              margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ]),
          Column(children: [
            Container(
              child: GestureDetector(
                  onTap: () => setState(() {
                        if (program.sunday) {
                          program.sunday = false;
                        } else {
                          program.sunday = true;
                        }
                      }),
                  child: Center(
                      child: new Text("D",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: program.sunday
                                  ? Colors.white
                                  : Color(0xFFD34B4B))))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD34B4B)),
                  color:
                      program.sunday ? Color(0xFFD34B4B) : Colors.transparent,
                  shape: BoxShape.circle),
              constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
              margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ]),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditTraining())),
                child:
                    Text('Créer le programme', style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 20.0, bottom: 10),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]));
  }
}
