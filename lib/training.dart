import 'package:flutter/material.dart';
import './createTraining.dart';
import './getTraining.dart';

import './database/trainingDatabase.dart';
import './database/dateDatabase.dart';
import './database/sessionDatabase.dart';
import './database/exercicesDatabase.dart';


class Training extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrainingState();
  }
}

class TrainingState extends State<Training> {
  TrainingDatabase db = TrainingDatabase();
  DateDatabase dateDb = DateDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  ExercicesDatabase exercicesDb = ExercicesDatabase();
  List<String> training = [];

  @override
  void initState() {
    getAllTraining();
  }

  deleteTraining(trainingId){
    db.delete(trainingId);
    sessionDb.deleteByTrainingId(trainingId);
    dateDb.deleteByTrainingId(trainingId);
    exercicesDb.deleteByTrainingId(trainingId);
    setState(() {});
  }

  getAllTraining() {
    return FutureBuilder(
        future: db.getAllTraining(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              for (TrainingModel training in snapshot.data)
                Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(20.0),
                          color: Colors.black87,
                          image: DecorationImage(
                            image: ExactAssetImage(
                                'assets/images/chest_training.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(children: [
                          new Text(training.name.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left),
                        ], crossAxisAlignment: CrossAxisAlignment.start),
                        margin: new EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
                        padding: new EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        alignment: Alignment.bottomLeft,
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width - 40,
                            minHeight: 120.0),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetTraining(trainingId: training.id))),
                      onLongPress: () {
                        showMenu(
                          position: RelativeRect.fromLTRB(10, 100, 0, 0),
                          initialValue: true,
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                                child: InkWell(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.delete),
                                        Text("Delete"),
                                      ],
                                    ),
                                    onTap: () => deleteTraining(training.id)
                                ))
                          ],
                          context: context,
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
            ]);
          } else {
            return Center();
          }
        });
  }

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
      getAllTraining(),
      Row(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Color(0xFF3F3F3F),
            ),
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width - 40,
                minHeight: 120.0),
            child: new Container(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width - 40,
                    minHeight: 120.0),
                child: new FlatButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateTraining())),
                    child: new Text("Creer un nouveau programme".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold)),
                    color: Color(0xFF3F3F3F),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(20.0),
                )),
            margin: new EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
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
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                color: Colors.black87,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/chest_training.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(children: [
                new Text("Debutant".toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                new Text("Entrainement pectoraux",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 1, color: Colors.white)),
              ], crossAxisAlignment: CrossAxisAlignment.start),
              margin: new EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              padding: new EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              alignment: Alignment.bottomLeft,
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width - 40,
                  minHeight: 120.0),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetTraining())),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          InkWell(
            child: Container(
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
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                new Text("Entrainement jambes",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 1, color: Colors.white)),
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
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width - 40,
                  minHeight: 120.0),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetTraining())),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
