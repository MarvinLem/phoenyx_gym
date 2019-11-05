import 'package:flutter/material.dart';

class Exercice extends StatelessWidget {
  final Function pageSelected;

  Exercice({this.pageSelected});

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
          child: new Text("Description".toUpperCase(),
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
              child: Text(
                  "La pompe est un exercice physique de musculation qui sollicite principalement le grand pectoral, le deltoïde et les triceps.",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                  textAlign: TextAlign.left),
              alignment: Alignment.topLeft,
              margin: new EdgeInsets.only(left: 20.0, top: 10.0),
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        )
      ]),
      Row(children: [
        Column(
          children: [
            Container(
              child: Text(
                  "La posture de départ est la suivante : face au sol, le corps repose uniquement sur les deux pieds et les deux mains. Les pieds sont joints, et les mains écartées un peu plus loin que l'envergure des épaules.",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                  textAlign: TextAlign.left),
              alignment: Alignment.topLeft,
              margin: new EdgeInsets.only(left: 20.0, top: 10.0),
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        )
      ]),
      Row(children: [
        Column(
          children: [
            Container(
              child: Text(
                  "Le but de l'exercice est d'abaisser tout le corps en restant droit, grâce à l'unique travail des bras. Le corps descend jusqu'à ce que la poitrine (ou le menton) frôle le sol. Un abaissement et une remontée constituent une pompe. Cet exercice physique est fréquemment employé dans la plupart des armées du monde.",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                  textAlign: TextAlign.left),
              alignment: Alignment.topLeft,
              margin: new EdgeInsets.only(left: 20.0, top: 10.0),
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        )
      ]),
      Row(children: [
        Container(
          child: new Text("Zone travaillée".toUpperCase(),
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
                  image: ExactAssetImage('assets/images/chest.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              margin: new EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              padding: new EdgeInsets.symmetric(horizontal: 55, vertical: 55),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        )
      ], mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => pageSelected("Training"),
                child: Text('Enregister le programme',
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
