import 'package:flutter/material.dart';

class EditExercice extends StatelessWidget {
  final Function pageSelected;

  EditExercice({this.pageSelected});

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
                child: new Text("Exercices - Pompes".toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFD34B4B),
                        fontWeight: FontWeight.bold)),
                margin: new EdgeInsets.only(top: 20.0, left: 20),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
                margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
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
                          child: Text("Nombre de séries:",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87),
                              textAlign: TextAlign.left),
                            margin: new EdgeInsets.only(right: 20)
                        ),
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
                        child: new Icon(Icons.arrow_drop_up,
                            color: Color(0xFFD34B4B)),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text("3 séries",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: new Icon(Icons.arrow_drop_down,
                            color: Color(0xFFD34B4B)),
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
            Column(
                children: [
                  Row(
                      children: [
                        Container(
                            child: Text("Nombre de répétitions:",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                                textAlign: TextAlign.left),
                            margin: new EdgeInsets.only(right: 20)
                        ),
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
                        child: new Icon(Icons.arrow_drop_up,
                            color: Color(0xFFD34B4B)),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text("15 répétitions",
                            style:
                            TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: new Icon(Icons.arrow_drop_down,
                            color: Color(0xFFD34B4B)),
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
            Column(
                children: [
                  Row(
                      children: [
                        Container(
                            child: Text("Temps de repos:",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                                textAlign: TextAlign.left),
                            margin: new EdgeInsets.only(right: 20)
                        ),
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
                        child: new Icon(Icons.arrow_drop_up,
                            color: Color(0xFFD34B4B)),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text("2 : 00",
                            style:
                            TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: new Icon(Icons.arrow_drop_down,
                            color: Color(0xFFD34B4B)),
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
            child: RaisedButton(
                onPressed: () => pageSelected("editTraining"),
                child: Text('Confirmer les changements',
                    style: TextStyle(fontSize: 18)),
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
