import 'package:flutter/material.dart';
import './beginTraining.dart';
import './editTraining.dart';

class GetTraining extends StatelessWidget {
  final Function pageSelected;

  GetTraining({this.pageSelected});

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
      Row(children: [
        Container(
          child: new Text("Votre séance du Lundi".toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFD34B4B),
                  fontWeight: FontWeight.bold)),
          margin: new EdgeInsets.only(left: 20.0, top: 20.0),
        )
      ]),
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFD34B4B)),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/push-ups.png'),
                  fit: BoxFit.none,
                ),
              ),
              constraints: BoxConstraints(minWidth: 80.0, minHeight: 80.0),
              margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            )
          ],
        ),
        Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text("Pompes",
                        style: TextStyle(fontSize: 18, color: Colors.black87), textAlign: TextAlign.left),
                    alignment: Alignment.topLeft,
                    margin: new EdgeInsets.only(bottom: 5),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Row(
                  children: [
                    Container(
                      child: Text("3x15 - 2 minutes de repos",
                          style: TextStyle(fontSize: 18, color: Colors.black87)),
                      margin: new EdgeInsets.only(bottom: 5),),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start
        )
      ]),
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFD34B4B)),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/weightlifting.png'),
                  fit: BoxFit.none,
                ),
              ),
              constraints: BoxConstraints(minWidth: 80.0, minHeight: 80.0),
              margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            )
          ],
        ),
        Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text("Squat - 50 kg",
                        style: TextStyle(fontSize: 18, color: Colors.black87), textAlign: TextAlign.left),
                    alignment: Alignment.topLeft,
                    margin: new EdgeInsets.only(bottom: 5),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Row(
                  children: [
                    Container(
                      child: Text("3x15 - 2 minutes de repos",
                          style: TextStyle(fontSize: 18, color: Colors.black87)),
                      margin: new EdgeInsets.only(bottom: 5),),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start
        )
      ]),
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFD34B4B)),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/abs-workout.png'),
                  fit: BoxFit.none,
                ),
              ),
              constraints: BoxConstraints(minWidth: 80.0, minHeight: 80.0),
              margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            )
          ],
        ),
        Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text("Abdos",
                        style: TextStyle(fontSize: 18, color: Colors.black87), textAlign: TextAlign.left),
                    alignment: Alignment.topLeft,
                    margin: new EdgeInsets.only(bottom: 5),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Row(
                  children: [
                    Container(
                      child: Text("3x15 - 2 minutes de repos",
                          style: TextStyle(fontSize: 18, color: Colors.black87)),
                      margin: new EdgeInsets.only(bottom: 5),),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start
        )
      ]),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BeginTraining()),
                ),
                child: Text('Commencer la scéance', style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 10.0, bottom: 10),),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditTraining()),
                ),
                child: Text('Modifier la séance', style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFF3F3F3F),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 10.0, bottom: 10),),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )
    ]));
  }
}