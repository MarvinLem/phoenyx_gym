import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Function pageSelected;

  Home({this.pageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: Column(children: [
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
                  Row(children: [
                    Column(children: [
                      Container(
                      child: new Text(
                          "13",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFFD34B4B),
                          )
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFD34B4B)),
                            shape: BoxShape.circle),
                        constraints:
                            BoxConstraints(minWidth: 33.0, minHeight: 33.0),
                        margin: new EdgeInsets.only(top: 15),
                        padding: new EdgeInsets.all(15),
                      ),
                    ]),
                    Column(children: [
                      Row(children: [
                        Container(
                            child: Text("Lundi 15/10 - 17h -> 18h",
                                style: TextStyle(fontSize: 16, color: Colors.black87)),
                            margin: new EdgeInsets.only(left: 20, top: 20.0)),
                      ]),
                      Row(children: [
                        Container(
                            child: Text("Entrainements pectoraux",
                                style: TextStyle(fontSize: 16, color: Colors.black87)),
                            margin: new EdgeInsets.only(left: 20, top: 10.0))
                      ])
                    ],crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center )
                ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start
              )], crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start),
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width - 40,maxWidth: MediaQuery.of(context).size.width - 40),
              padding: new EdgeInsets.all(20),
              decoration: new BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10.0)))
        ], crossAxisAlignment: CrossAxisAlignment.center,
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
