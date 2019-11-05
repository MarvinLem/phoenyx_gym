import 'package:flutter/material.dart';

class CreateExercice extends StatelessWidget {
  final Function pageSelected;

  CreateExercice({this.pageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
          Column(
            children: [
              Container(
                child: Text("Quel nouvel exercice voulez vous ajouter ?",
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
                margin: new EdgeInsets.only(left: 20.0, top: 15.0),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
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
            Container(
              child: InkWell(
                  onTap: () => pageSelected("Exercice"),
                  child: Text("Pompes",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.center)),
              alignment: Alignment.center,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            Container(
                child: new Icon(Icons.add_circle, color: Color(0xFFD34B4B)),
                margin: new EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ], mainAxisAlignment: MainAxisAlignment.spaceAround),
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
            Container(
              child: InkWell(
                  onTap: () => pageSelected("Exercice"),
                  child: Text("Squat",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.center)),
              alignment: Alignment.center,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            Container(
                child: new Icon(Icons.add_circle, color: Color(0xFFD34B4B)),
                margin: new EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ], mainAxisAlignment: MainAxisAlignment.spaceAround),
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
            Container(
              child: InkWell(
                  onTap: () => pageSelected("Exercice"),
                  child: Text("Abdos",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.center)),
              alignment: Alignment.center,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(
          children: [
            Container(
                child: new Icon(Icons.add_circle, color: Color(0xFFD34B4B)),
                margin: new EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ], mainAxisAlignment: MainAxisAlignment.spaceAround),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => pageSelected("editTraining"),
                child:
                    Text('Ajouter 0 exercices', style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 10.0, bottom: 10),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
