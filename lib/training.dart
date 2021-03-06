import 'package:flutter/material.dart';
import './createTraining.dart';
import './getTraining.dart';

import './database/trainingDatabase.dart';
import './database/seanceDatabase.dart';
import './database/sessionDatabase.dart';
import './database/exercicesDatabase.dart';

class Training extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrainingState();
  }
}

class ItemMenu extends StatefulWidget {
  final modal;
  final trainingId;
  Function callback;

  ItemMenu({this.modal, this.trainingId, this.callback});

  @override
  State<StatefulWidget> createState() {
    return ItemMenuState(modal: modal, trainingId: trainingId, callback: callback);
  }
}

class ItemMenuState extends State<ItemMenu> {
  bool modal;
  int trainingId;
  Function callback;
  TrainingDatabase db = TrainingDatabase();
  SeanceDatabase seanceDb = SeanceDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  ExercicesDatabase exercicesDb = ExercicesDatabase();

  ItemMenuState({this.modal, this.trainingId, this.callback});

  deleteTraining(trainingId) {
    db.delete(trainingId);
    seanceDb.deleteByTrainingId(trainingId);
    sessionDb.deleteByTrainingId(trainingId);
    exercicesDb.deleteByTrainingId(trainingId);
    setState(() {
      this.widget.callback();
    });
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        modal == false ?
        setState(() {
          modal = true;
        }) : deleteTraining(trainingId);
      },
      child: Container(
        padding: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Icon(Icons.delete),
        Text(modal == false ? 'Supprimer' : 'Etes vous sûr ?'),
      ],
    ),
    ));
  }
}

class TrainingState extends State<Training> {
  TrainingDatabase db = TrainingDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  ExercicesDatabase exercicesDb = ExercicesDatabase();
  List<String> training = [];
  bool modal = false;

  @override
  void initState() {
    getAllTrainingNotDone();
    getAllTrainingDone();
    modal = false;
  }

  void callback() {
    setState(() {
        modal = false;
    });
  }

  getAllTrainingNotDone() {
    return FutureBuilder(
        future: db.getAllTrainingNotDone(),
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
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                            minHeight: 120.0,
                            maxWidth: MediaQuery.of(context).size.width - 40),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetTraining(trainingId: training.id))),
                      onLongPress: () {
                        showMenu(
                          position: RelativeRect.fromLTRB(10, 100, 0, 0),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                                value: modal,
                                child: StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return ItemMenu(modal: modal, trainingId: training.id, callback: callback);
                                        }),
                            )
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

  getAllTrainingPredefined() {
    return FutureBuilder(
        future: db.getAllTrainingPredefined(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              Row(children: [
                Container(
                    child: new Text("Programmes prédéfinis".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFD34B4B),
                            fontWeight: FontWeight.bold)),
                    margin: new EdgeInsets.only(left: 20.0, top: 20.0))
              ]),
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
                                'assets/images/legs_training.png'),
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
                          new Text(training.name.toUpperCase(),
                              maxLines: 2,
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
                            minHeight: 120.0,
                            maxWidth: MediaQuery.of(context).size.width - 40),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetTraining(trainingId: training.id))),
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

  getAllTrainingDone() {
    return FutureBuilder(
        future: db.getAllTrainingDone(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var trainingLength = snapshot.data.length;
            if (trainingLength > 0) {
            return Column(children: [
              Row(children: [
                Container(
                    child: new Text("Vos programmes terminés".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFD34B4B),
                            fontWeight: FontWeight.bold)),
                    margin: new EdgeInsets.only(left: 20.0, top: 20.0))
              ]),
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
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                            minHeight: 120.0,
                            maxWidth: MediaQuery.of(context).size.width - 40),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetTraining(trainingId: training.id))),
                      onLongPress: () {
                        showMenu(
                          position: RelativeRect.fromLTRB(10, 100, 0, 0),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                              value: modal,
                              child: StatefulBuilder(builder:
                                  (BuildContext context,
                                  StateSetter setState) {
                                return ItemMenu(modal: modal, trainingId: training.id, callback: callback);
                              }),
                            )
                          ],
                          context: context,
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
            ]);} else {
              return Center();
            }
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
      getAllTrainingNotDone(),
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
                    child: new Text("Créer un nouveau programme".toUpperCase(),
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
      getAllTrainingPredefined(),
      /*
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
       */
      getAllTrainingDone(),
      Container(margin: new EdgeInsets.only(bottom: 20))
    ]);
  }
}
