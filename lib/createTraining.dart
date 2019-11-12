import 'package:flutter/material.dart';

class Days {
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;
}

class CreateTraining extends StatefulWidget {
  final Function pageSelected;

  CreateTraining({this.pageSelected});

  @override
  State<StatefulWidget> createState() {
    return CreateTrainingState(pageSelected: pageSelected);
  }
}

class CreateTrainingState extends State<CreateTraining> {
  final Function pageSelected;

  CreateTrainingState({this.pageSelected});

  var days = new Days();

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
      Row(children: [
        Container(
            child: new Text("Nombre de séance par semaine",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87)),
            margin: new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
        )
      ], crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,),
      Row(
          children: [
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
                        child: Text("3",
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
          mainAxisAlignment: MainAxisAlignment.center),
      Row(children: [
        Container(
          child: new Text("Suivre le programme pendant combien de semaines",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87), textAlign: TextAlign.center,),
          margin: new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40)
        )
      ], crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,),
      Row(
          children: [
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
                        child: Text("15",
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
          mainAxisAlignment: MainAxisAlignment.center),
      Row(children: [
        Container(
            child: new Text("Avoir la séance le",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87), textAlign: TextAlign.center,),
            margin: new EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40)
        )
      ], crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,),
      Row(children: [
        Column(children: [
          Container(
            child: InkWell(
                onTap: () => setState(() {
                  if(days.monday){days.monday = false;} else {days.monday = true;}
                }),
                child: Center(
                    child: new Text(
                        "L",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: days.monday ? Colors.white : Colors.black87)
                    ))),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD34B4B)),
                color: days.monday ? Color(0xFFD34B4B) : Colors.transparent,
                shape: BoxShape.circle),
            constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
            margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ]),
        Column(children: [
          Container(
            child: InkWell(
                onTap: () => setState(() {
                  if(days.tuesday){days.tuesday = false;} else {days.tuesday = true;}
                }),
                child: Center(
                    child: new Text(
                        "M",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: days.tuesday ? Colors.white : Colors.black87)
                    ))),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD34B4B)),
                color: days.tuesday ? Color(0xFFD34B4B) : Colors.transparent,
                shape: BoxShape.circle),
            constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
            margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ]),
        Column(children: [
          Container(
            child: InkWell(
                onTap: () => setState(() {
                  if(days.wednesday){days.wednesday = false;} else {days.wednesday = true;}
                }),
                child: Center(
                    child: new Text(
                        "M",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: days.wednesday ? Colors.white : Colors.black87)
                    ))),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD34B4B)),
                color: days.wednesday ? Color(0xFFD34B4B) : Colors.transparent,
                shape: BoxShape.circle),
            constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
            margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ]),
        Column(children: [
          Container(
            child: InkWell(
                onTap: () => setState(() {
                  if(days.thursday){days.thursday = false;} else {days.thursday = true;}
                }),
                child: Center(
                    child: new Text(
                        "J",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: days.thursday ? Colors.white : Colors.black87)
                    ))),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD34B4B)),
                color: days.thursday ? Color(0xFFD34B4B) : Colors.transparent,
                shape: BoxShape.circle),
            constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
            margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ]),
        Column(children: [
          Container(
            child: InkWell(
                onTap: () => setState(() {
                  if(days.friday){days.friday = false;} else {days.friday = true;}
                }),
                child: Center(
                    child: new Text(
                        "V",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: days.friday ? Colors.white : Colors.black87)
                    ))),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD34B4B)),
                color: days.friday ? Color(0xFFD34B4B) : Colors.transparent,
                shape: BoxShape.circle),
            constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
            margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ]),
        Column(children: [
          Container(
            child: InkWell(
                onTap: () => setState(() {
                  if(days.saturday){days.saturday = false;} else {days.saturday = true;}
                }),
                child: Center(
                    child: new Text(
                        "S",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: days.saturday ? Colors.white : Colors.black87)
                    ))),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD34B4B)),
                color: days.saturday ? Color(0xFFD34B4B) : Colors.transparent,
                shape: BoxShape.circle),
            constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
            margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ]),
        Column(children: [
          Container(
            child: InkWell(
                onTap: () => setState(() {
                  if(days.sunday){days.sunday = false;} else {days.sunday = true;}
                }),
                child: Center(
                    child: new Text(
                        "D",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: days.sunday ? Colors.white : Colors.black87)
                    ))),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD34B4B)),
                color: days.sunday ? Color(0xFFD34B4B) : Colors.transparent,
                shape: BoxShape.circle),
            constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
            margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ]),
      ], mainAxisAlignment: MainAxisAlignment.center,),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => pageSelected("editTraining"),
                child: Text('Créer le programme', style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 20.0, bottom: 10),),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
