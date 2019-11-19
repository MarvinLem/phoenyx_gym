import 'package:flutter/material.dart';
import './createTraining.dart';
import './getTraining.dart';

class Training extends StatelessWidget {
  final Function pageSelected;

  Training({this.pageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(children: [
        Container(
            child: new Text("Vos programmes".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(left: 20.0, top: 20.0))
      ]),
      Row(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Color(0xFF3F3F3F),
            ),
            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-40, minHeight: 120.0),
            child: new Container(
                constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-40, minHeight: 120.0),
                child: new FlatButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTraining())),
                    child: new Text("Creer votre programme".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Color(0xFF3F3F3F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(20.0),
                )),
            margin: new EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            alignment: Alignment.center,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(children: [
        Container(
            child: new Text("Programme prédéfini".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(left: 20.0, top: 20.0))
      ]),
      Row(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-40, minHeight: 120.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Colors.black87,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/chest_training.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: new Container(
              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-40, minHeight: 120.0),
              child: new FlatButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GetTraining())),
                  child: new Column(
                      children: [
                        new Text("Debutant".toUpperCase(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        new Text("Entrainement pectoraux".toUpperCase(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.left),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              padding: new EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            margin: new EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 0,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
      ),
      Row(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Colors.black87,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/legs_training.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: [
              new Text("Debutant".toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
              new Text("Entrainement jambes".toUpperCase(),
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ], crossAxisAlignment: CrossAxisAlignment.start),
            margin: new EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            padding: new EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            alignment: Alignment.bottomLeft,
            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-40, minHeight: 120.0),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
