import 'package:flutter/material.dart';
import './getTraining.dart';

class Home extends StatelessWidget {
  final Function pageSelected;

  Home({this.pageSelected});

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
                margin: new EdgeInsets.only(top: 20.0, bottom: 30),
              ),
              Container(
                  child: new Column(
                      children: [
                        Container(
                          child: new Text(
                            "Prochaine séance".toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFD34B4B),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                            children: [
                              InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GetTraining())),
                                  child: Row(children: [
                                    Column(children: [
                                      Container(
                                        child: Column(children: [
                                          Row(children: [
                                            new Text("Wed",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFFD34B4B),
                                                ))
                                          ]),
                                          Row(children: [
                                            new Text("15",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xFFD34B4B),
                                                ))
                                          ]),
                                          Row(children: [
                                            new Text("Mars",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFFD34B4B),
                                                ))
                                          ])
                                        ]),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFFD34B4B)),
                                            shape: BoxShape.circle),
                                        constraints: BoxConstraints(
                                            minWidth: 33.0, minHeight: 33.0),
                                        margin: new EdgeInsets.only(top: 5),
                                        padding: new EdgeInsets.all(15),
                                      ),
                                    ]),
                                    Column(
                                        children: [
                                          Row(children: [
                                            Container(
                                                child: Text("Nom du programme",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87)),
                                                margin: new EdgeInsets.only(
                                                    left: 8, top: 5)),
                                          ]),
                                          Row(children: [
                                            Container(
                                                child: Text(
                                                    "Entrainements pectoraux",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87)),
                                                margin: new EdgeInsets.only(
                                                    left: 8, top: 10.0))
                                          ]),
                                          Row(children: [
                                            Container(
                                                child: Text("17:00 -> 18:00",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87)),
                                                margin: new EdgeInsets.only(
                                                    left: 8, top: 10.0)),
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
                                                      left: 25, top: 6),
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
                            mainAxisAlignment: MainAxisAlignment.start)
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
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
            minHeight: MediaQuery.of(context).size.height - 136),
      )
    ]);
  }
}
