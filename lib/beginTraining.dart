import 'package:flutter/material.dart';
import './beginFeedback.dart';

class BeginTraining extends StatelessWidget {
  final Function pageSelected;

  BeginTraining({this.pageSelected});

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
                "Séance en cours".toUpperCase(),
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
          Column(
            children: [
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFD34B4B)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/push-ups.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                margin: new EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: new EdgeInsets.symmetric(horizontal: 35, vertical: 35),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Column(
            children: [
              Container(
                child: new Icon(Icons.play_arrow, color: Color(0xFFD34B4B)),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Column(
            children: [
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFD34B4B)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/push-ups.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                margin: new EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                padding: new EdgeInsets.symmetric(horizontal: 45, vertical: 45),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Column(
            children: [
              Container(
                child: new Icon(Icons.play_arrow, color: Color(0xFFD34B4B)),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Column(
            children: [
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFD34B4B)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/push-ups.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                margin: new EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                padding: new EdgeInsets.symmetric(horizontal: 35, vertical: 35),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
              child: new Text(
                "Il vous reste 2 séries".toUpperCase(),
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3F3F3F),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
              child: new Text(
                "Repos".toUpperCase(),
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF3F3F3F),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ), margin: new EdgeInsets.only(top: 20),),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: new Text(
              "1:15".toUpperCase(),
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF3F3F3F),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ), margin: new EdgeInsets.only(top: 10, bottom: 10),),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () => pageSelected("beginTraining"),
                child: Text('Mettre en pause la séance',
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
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BeginFeedback())),
                child: Text('Mettre fin à la séance',
                    style: TextStyle(fontSize: 12)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFF3F3F3F),
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
