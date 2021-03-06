import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import './endFeedback.dart';

import './database/trainingDatabase.dart';
import './database/sessionDatabase.dart';
import './database/exercicesDatabase.dart';
import './database/userDatabase.dart';

class Feedback {
  //Rajouter un push
  List exerciceArray = [];
}

class BeginFeedback extends StatefulWidget {
  int trainingId;
  int sessionId;

  BeginFeedback({this.trainingId, this.sessionId});

  @override
  State<StatefulWidget> createState() {
    return BeginFeedbackState(trainingId: trainingId, sessionId: sessionId);
  }
}

class BeginFeedbackState extends State<BeginFeedback> {
  int trainingId;
  int sessionId;
  ExercicesDatabase db = ExercicesDatabase();
  SessionDatabase sessionDb = SessionDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  UserDatabase userDb = UserDatabase();

  BeginFeedbackState({this.trainingId, this.sessionId});

  var feedback = new Feedback();

  @override
  void initState() {
    feedback.exerciceArray = [];
    updateSessionCount();
    sessionDb.updateDone(1, sessionId);
    updateTrainingDone();
    getExercicesByTrainingId(trainingId, sessionId);
  }

  updateSessionCount() async {
    var session = await sessionDb.getSessionById(sessionId);
    if(session[0]['done'] == 0){
      var user = await userDb.getLastUser();
      var sessionNumber = user[0]['sessions'] != null ? user[0]['sessions'] : 0;
      await userDb.updateUser(user[0]['birthday'], user[0]['size'], user[0]['weight'], user[0]['gender'], sessionNumber + 1);
    }
  }

  updateTrainingDone() async {
    var sessions = await sessionDb.getSessionByTrainingId(trainingId);
    for(var i=0;i<sessions.length;i++){
      if(sessions[i]['done'] == 0){
        return;
      }
    }
    trainingDb.updateDone(1, trainingId);
  }

  getExercicesByTrainingId(trainingId, sessionId) {
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            for (ExercicesModel exercice in snapshot.data) {
              if (snapshot.data.length > feedback.exerciceArray.length) {
                feedback.exerciceArray.add(null);
              }
            }
            return Column(children: [
              for (ExercicesModel exercice in snapshot.data)
                Column(children: [
                  Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.0, color: Color(0xFFD34B4B)),
                                image: DecorationImage(
                                  image: ExactAssetImage(('assets/images/' + exercice.name + '.png').replaceAll(' ', '_')),
                                  fit: BoxFit.none,
                                ),
                              ),
                              constraints: BoxConstraints(
                                  minWidth: 80.0, minHeight: 80.0),
                              margin: new EdgeInsets.only(
                                  right: 20, top: 20, bottom: 25),
                            )
                          ],
                        ),
                        Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                        StringUtils.capitalize(exercice.name),
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87),
                                        textAlign: TextAlign.left),
                                    alignment: Alignment.topLeft,
                                    margin: new EdgeInsets.only(bottom: 5),
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
                          /*
                      child: new DropdownButton<String>(
                        value: feedback.exerciceArray[exercice.exerciceOrder - 1].toString(),
                        items: <String>['J\'ai réussi mes exercices normalement', 'J\'ai réussi mes exercices et j\'aurais pu travailler plus', 'J\'ai réussi mais j\'ai eu des difficultés à la fin des exercices', 'Je n\'ai pas réussi à terminer les exercices'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) => setState(() {
                          feedback.exerciceArray[exercice.exerciceOrder - 1] = value;
                        }),
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      */
                          child: Row(children: <Widget>[
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    feedback.exerciceArray[
                                        exercice.exerciceOrder - 1] = 0;
                                  });
                                },
                                child: feedback.exerciceArray[
                                exercice.exerciceOrder - 1] ==
                                    0
                                    ? Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 12),
                                  constraints: new BoxConstraints(
                                      minWidth: 55, minHeight: 55),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/sad-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                    : Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 22),
                                  constraints: new BoxConstraints(
                                      minWidth: 45, minHeight: 45),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/sad-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    feedback.exerciceArray[
                                        exercice.exerciceOrder - 1] = 1;
                                  });
                                },
                                child: feedback.exerciceArray[
                                exercice.exerciceOrder - 1] ==
                                    1
                                    ? Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 17),
                                  constraints: new BoxConstraints(
                                      minWidth: 55, minHeight: 55),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/meh-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                    : Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 22),
                                  constraints: new BoxConstraints(
                                      minWidth: 45, minHeight: 45),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/meh-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    feedback.exerciceArray[
                                        exercice.exerciceOrder - 1] = 2;
                                  });
                                },
                                child: feedback.exerciceArray[
                                exercice.exerciceOrder - 1] ==
                                    2
                                    ? Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 17),
                                  constraints: new BoxConstraints(
                                      minWidth: 55, minHeight: 55),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/happy-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                    : Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 22),
                                  constraints: new BoxConstraints(
                                      minWidth: 45, minHeight: 45),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/happy-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    feedback.exerciceArray[
                                        exercice.exerciceOrder - 1] = 3;
                                  });
                                },
                                child: feedback.exerciceArray[
                                            exercice.exerciceOrder - 1] ==
                                        3
                                    ? Container(
                                        margin: new EdgeInsets.symmetric(
                                            horizontal: 17),
                                        constraints: new BoxConstraints(
                                            minWidth: 55, minHeight: 55),
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/smile-color.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: new EdgeInsets.symmetric(
                                            horizontal: 22),
                                        constraints: new BoxConstraints(
                                            minWidth: 45, minHeight: 45),
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/smile-color.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                          ]),
                          constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width - 40),
                          margin: new EdgeInsets.only(bottom: 60),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center)
                ]),
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
              Column(children: [
                Container(
                    constraints:
                        new BoxConstraints(minWidth: 25, minHeight: 25))
              ]),
              Column(children: [
                Container(
                    child: new Text(
                      "Fin de la séance".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFD34B4B),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                    constraints: new BoxConstraints(minWidth: 260))
              ]),
              Column(children: [
                InkWell(
                    onTap: () {
                      showMenu(
                        position: RelativeRect.fromLTRB(10, 100, 0, 0),
                        items: <PopupMenuEntry>[
                          PopupMenuItem(
                            child: Column(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 236,top: 5),
                                  constraints: BoxConstraints(
                                      maxWidth: 20, maxHeight: 20),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/cross.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  constraints: BoxConstraints(
                                      maxWidth: 40, maxHeight: 40),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/sad-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Text(
                                  "Vous n'avez pas reussi à réaliser l'exercice demandé et vous n'étiez pas pret d'y arriver.", textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 14)),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  constraints: BoxConstraints(
                                      maxWidth: 40, maxHeight: 40),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/meh-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Text(
                                  "Vous n'avez pas reussi à réaliser l'exercice demandé mais vous y étiez presque.", textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 14)),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  constraints: BoxConstraints(
                                      maxWidth: 40, maxHeight: 40),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/happy-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Text(
                                  "Vous avez reussi à réaliser l'exercice normalement.", textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 14)),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  constraints: BoxConstraints(
                                      maxWidth: 40, maxHeight: 40),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/smile-color.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Text(
                                  "Vous avez reussi à réaliser l'exercice et c'était meme très facile.", textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 14))
                            ]),
                          )
                        ],
                        context: context,
                      );
                    },
                    child: Container(
                      margin: new EdgeInsets.only(top: 20.0),
                      constraints:
                          new BoxConstraints(minWidth: 25, minHeight: 25),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/tooltip.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ])
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: [
              Container(
                  child: new Text(
                    "Avez-vous accompli correctement\n les taches demandés ?",
                    style: TextStyle(fontSize: 16, color: Color(0xFF3F3F3F)),
                    textAlign: TextAlign.center,
                  ),
                  margin: new EdgeInsets.only(top: 20.0)),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          getExercicesByTrainingId(trainingId, sessionId),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EndFeedback(
                                trainingId: trainingId,
                                sessionId: sessionId,
                                exerciceArray: feedback.exerciceArray))),
                    child: Text('Valider le feedback',
                        style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFFD34B4B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                alignment: Alignment.center,
                margin: new EdgeInsets.only(top: 5.0, bottom: 30),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ]));
  }
}
