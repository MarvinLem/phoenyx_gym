import 'package:flutter/material.dart';

class EditAgenda extends StatelessWidget {
  final Function pageSelected;

  EditAgenda({this.pageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(children: [
        Container(
            child: new Text("Changement d'horaire".toUpperCase(),
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
                            "Lundi 15/10",
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
                          Text("Entrainements Pecs Séance du Lundi")
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
            Column(
                children: [
                  Row(
                      children: [
                        Container(
                            child: Text("Debut de la séance:",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                                textAlign: TextAlign.left),
                            margin: new EdgeInsets.only(right: 20, left: 25)),
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
                        child: Text("17 : 00",
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
          mainAxisAlignment: MainAxisAlignment.start),
      Row(
          children: [
            Column(
                children: [
                  Row(
                      children: [
                        Container(
                            child: Text("Fin de la séance:",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                                textAlign: TextAlign.left),
                            margin: new EdgeInsets.only(right: 20, left: 25)),
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
                        child: Text("18 : 00",
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
          mainAxisAlignment: MainAxisAlignment.start),
      Row(children: [
        Column(
            children: [
              Row(
                  children: [
                    Container(
                        child: Text("Date de la séance:",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                        margin: new EdgeInsets.only(top: 20, right: 20, left: 25)),
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
                    child: Text("15/10/2018",
                        style: TextStyle(fontSize: 24, color: Colors.black87),
                        textAlign: TextAlign.left),
                    margin: new EdgeInsets.only(top: 20)
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start),
      ]),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => pageSelected("agenda"),
                child: Text('Confirmer les changements',
                    style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 30.0, bottom: 10),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
