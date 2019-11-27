import 'package:flutter/material.dart';
import './exercice.dart';

class ExerciceList {
  bool pompes = false;
  bool squat = false;
  bool abdos = false;
}

class CreateExercice extends StatefulWidget {
  final Function pageSelected;

  CreateExercice({this.pageSelected});

  @override
  State<StatefulWidget> createState() {
    return CreateExerciceState(pageSelected: pageSelected);
  }
}

class CreateExerciceState extends State<CreateExercice> {
  final Function pageSelected;

  CreateExerciceState({this.pageSelected});

  var exerciceList = new ExerciceList();

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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice())),
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
                child: GestureDetector(
                    onTap: () => setState(() {
                      if (exerciceList.pompes) {
                        exerciceList.pompes = false;
                      } else {
                        exerciceList.pompes = true;
                      }
                    }),
                    child: exerciceList.pompes ? new Icon(Icons.check_box, color: Color(0xFFD34B4B)) : new Icon(Icons.check_box_outline_blank, color: Color(0xFFD34B4B))),
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
                child: GestureDetector(
                    onTap: () => setState(() {
                      if (exerciceList.squat) {
                        exerciceList.squat = false;
                      } else {
                        exerciceList.squat = true;
                      }
                    }),
                    child: exerciceList.squat ? new Icon(Icons.check_box, color: Color(0xFFD34B4B)) : new Icon(Icons.check_box_outline_blank, color: Color(0xFFD34B4B))),
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
                child: GestureDetector(
                    onTap: () => setState(() {
                      if (exerciceList.abdos) {
                        exerciceList.abdos = false;
                      } else {
                        exerciceList.abdos = true;
                      }
                    }),
                    child: exerciceList.abdos ? new Icon(Icons.check_box, color: Color(0xFFD34B4B)) : new Icon(Icons.check_box_outline_blank, color: Color(0xFFD34B4B))),
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
                onPressed: () => Navigator.pop(context),
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
    ]));
  }
}
