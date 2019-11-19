import 'package:flutter/material.dart';
import './getTraining.dart';

class EndFeedback extends StatelessWidget {
  final Function pageSelected;

  EndFeedback({this.pageSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Phoenix Gym'),
    ),
    body: ListView(children: [
      Row(
        children: [
          Container(
              child: new Text(
                "Fin de la séance".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              margin: new EdgeInsets.only(top: 20.0)),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
              child: new Text(
                "Nous conseillons par rapport à vos\n ressentis de changer ces exercices",
                style: TextStyle(fontSize: 16, color: Color(0xFF3F3F3F)),
                textAlign: TextAlign.center,
              ),
              margin: new EdgeInsets.only(top: 20.0)),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
          children: [
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
                  margin: new EdgeInsets.only(right: 20, top: 20, bottom: 20),
                )
              ],
            ),
            Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text("Pompes",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                        alignment: Alignment.topLeft,
                        margin: new EdgeInsets.only(bottom: 5),
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
                  child: Text("3 x 15 - 2 minutes de repos",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      textAlign: TextAlign.left),
                  alignment: Alignment.topLeft,
                  margin: new EdgeInsets.only(bottom: 5),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: Text("3 x 20 - 2 minutes de repos",
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.left),
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.only(bottom: 15),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
          children: [
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
                  margin: new EdgeInsets.only(right: 20, top: 20, bottom: 20),
                )
              ],
            ),
            Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text("Squat",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                        alignment: Alignment.topLeft,
                        margin: new EdgeInsets.only(bottom: 5),
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
            child: Text("3 x 15 - 2 minutes de repos",
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.left),
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.only(bottom: 5),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: Text("3 x 20 - 2 minutes de repos",
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.left),
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.only(bottom: 15),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
          children: [
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
                  margin: new EdgeInsets.only(right: 20, top: 20, bottom: 20),
                )
              ],
            ),
            Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text("Abdos",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                        alignment: Alignment.topLeft,
                        margin: new EdgeInsets.only(bottom: 5),
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
            child: Text("3 x 15 - 2 minutes de repos",
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.left),
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.only(bottom: 5),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: Text("3 x 20 - 2 minutes de repos",
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.left),
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.only(bottom: 15),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                child: Text('Changer le programme',
                    style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 5.0, bottom: 10),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                child: Text('Ne rien modifier', style: TextStyle(fontSize: 16)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFF3F3F3F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 5.0, bottom: 10),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]));
  }
}
