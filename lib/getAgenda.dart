import 'package:flutter/material.dart';

class GetAgenda extends StatelessWidget {
  final Function pageSelected;

  GetAgenda({this.pageSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Phoenyx Gym'),
        ),
        body: ListView(children: [
      Row(children: [
        Container(
            child: new Text("Entrainement 15 octobre".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10))
      ]),
      Row(
        children: [
          Column(
              children: [
                Row(
                    children: [
                      Container(
                          child: Text(
                            "Programme réalisé",
                            style:
                            TextStyle(fontSize: 16, color: Colors.black87),
                            textAlign: TextAlign.left,
                          ),
                          margin: new EdgeInsets.only(top: 20.0, left: 25),
                          alignment: Alignment.centerLeft),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start),
                Row(children: [
                  Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFFD34B4B)),
                          borderRadius: new BorderRadius.circular(20.0)),
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width - 40,
                          minHeight: 60.0),
                      alignment: Alignment.centerLeft,
                      margin: new EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 20,
                      ),
                      padding: new EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(children: [
                        Row(children: [
                          Text("Entrainements Pectoraux Séance du Lundi")
                        ]),
                      ]))
                ]),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start)
        ],
      ),
      Row(
          children: [
            Container(
                child: Text(
                  "Exercices réalisés",
                  style:
                  TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.left,
                ),
                margin: new EdgeInsets.only(top: 20.0, left: 25),
                alignment: Alignment.centerLeft),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start),
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
                onPressed: () => Navigator.pop(context),
                child: Text('Retourner au calendrier',
                    style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(bottom: 10),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]));
  }
}
