import 'package:flutter/material.dart';
import './createExercice.dart';
import './editExercice.dart';

class EditTraining extends StatelessWidget {
  final Function pageSelected;

  EditTraining({this.pageSelected});

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
        Column(
          children: [
            Container(
              child: GestureDetector(
                child: new Icon(Icons.arrow_left,
                    size: 40, color: Color(0xFFD34B4B)),
              ),
              margin: new EdgeInsets.only(top: 20.0),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Column(children: [
          Container(
            child: new Text("Votre séance du lundi",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(top: 20.0),
          )
        ]),
        Column(
          children: [
            Container(
              child: GestureDetector(
                child: new Icon(Icons.arrow_right,
                    size: 40, color: Color(0xFFD34B4B)),
              ),
              margin: new EdgeInsets.only(top: 20.0),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ], mainAxisAlignment: MainAxisAlignment.center,),
      /*
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0,color: Color(0xFFD34B4B)),
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
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.left),
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
                      child: Text("3 séries de 15 répétitions",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black87)),
                      margin: new EdgeInsets.only(bottom: 5),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start),
              Row(
                  children: [
                    Container(
                      child: Text("2 minutes de repos",
                          style:
                          TextStyle(fontSize: 14, color: Colors.black87)),
                      margin: new EdgeInsets.only(bottom: 5),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start),
              Row(
                  children: [
                    Container(
                      child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditExercice())),
                          child: Text("Modifier l'exercice",
                              style: TextStyle(fontSize: 12, decoration: TextDecoration.underline)),
                    ), margin: new EdgeInsets.only(top: 2, bottom: 5)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start)
      ]),
       */
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0,color: Color(0xFFD34B4B)),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/add.png'),
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
                    child: InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateExercice())),child: Text("Ajouter un nouvel exercice",
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                        textAlign: TextAlign.left)),
                    alignment: Alignment.topLeft,
                    margin: new EdgeInsets.only(bottom: 5),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start)
      ]),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                child: Text('Enregister le programme',
                    style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 10.0, bottom: 30),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]));
  }
}
