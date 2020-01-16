import 'package:flutter/material.dart';
import './beginFeedback.dart';

import './database/exercicesDatabase.dart';

class BeginTraining extends StatefulWidget {
  int trainingId;
  int maxOrder;

  BeginTraining({this.trainingId, this.maxOrder});

  @override
  State<StatefulWidget> createState() {
    return BeginTrainingState(trainingId: trainingId, maxOrder: maxOrder);
  }
}

class BeginTrainingState extends State<BeginTraining> {
  int trainingId;
  int maxOrder;
  int order = 1;
  ExercicesDatabase db = ExercicesDatabase();
  List<String> exercices = [];

  BeginTrainingState({this.trainingId, this.maxOrder});

  @override
  void initState() {
    getExercicesByTrainingIdAndOrder(trainingId, order);
  }

  getExercicesByTrainingIdAndOrder(trainingId, order) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndOrder(trainingId, order),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              for (ExercicesModel exercice in snapshot.data)
                Row(children: [Column(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2.0,color: Color(0xFFD34B4B)),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/'+exercice.name+'.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      padding: new EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                )])
            ]);
          } else {
            return Center();
          }
        });
  }

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
          getExercicesByTrainingIdAndOrder(trainingId, order),
          Column(
            children: [
              Container(
                child: new Icon(Icons.play_arrow, color: Color(0xFFD34B4B)),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          getExercicesByTrainingIdAndOrder(trainingId, order+1),
          Column(
            children: [
              Container(
                child: new Icon(Icons.play_arrow, color: Color(0xFFD34B4B)),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          getExercicesByTrainingIdAndOrder(trainingId, order+2),
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
                onPressed: () => setState(() {
                  if(order == maxOrder){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BeginFeedback(trainingId: trainingId)));
                  } else {
                    order += 1;
                  }
                }),
                child: Text('Séance terminée',
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
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BeginFeedback(trainingId: trainingId))),
                child: Text('Mettre fin à la séance',
                    style: TextStyle(fontSize: 12)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFF3F3F3F),
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
