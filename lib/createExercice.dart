import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:phoenyx_gym/database/trainingDatabase.dart';
import './exercice.dart';

import './database/exercicesDefaultDatabase.dart';
import './database/exercicesDatabase.dart';
import './database/sessionDatabase.dart';
import './database/trainingDatabase.dart';

class ExerciceList {
  var exercicesNames = [];
  int count = 0;
}

class CreateExercice extends StatefulWidget {
  int trainingId;
  int sessionId;
  int seanceId;
  String mode;

  CreateExercice({this.trainingId,this.sessionId, this.seanceId, this.mode});

  @override
  State<StatefulWidget> createState() {
    return CreateExerciceState(trainingId: trainingId, sessionId: sessionId, seanceId: seanceId, mode: mode);
  }
}

class CreateExerciceState extends State<CreateExercice> {
  int trainingId;
  int sessionId;
  int seanceId;
  String mode;
  int exerciceCount = 0;
  String trainingName;
  ExercicesDatabase db = ExercicesDatabase();
  ExercicesDefaultDatabase exercicesDefaultDb = ExercicesDefaultDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();
  SessionDatabase sessionDb = SessionDatabase();

  CreateExerciceState({this.trainingId,this.sessionId, this.seanceId, this.mode});

  var exerciceList = new ExerciceList();

  @override
  void initState() {
    getTrainingName();
    getExercicesByTrainingIdAndSessionId(trainingId,sessionId);
  }

  getTrainingName() async {
    var training = await trainingDb.getTrainingName(trainingId);
    setState(() {
      trainingName = training[0]['name'];
    });
  }

  getExercicesByTrainingIdAndSessionId(trainingId,sessionId) async {
    var exercices = await db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId);
    exerciceCount = exercices.length;
  }

  exercicesCreated() async{
    var sessions = await sessionDb.getSessionBySeanceId(seanceId);
    if(mode == "only"){
      for (var i = 0; i < exerciceList.exercicesNames.length; i++) {
        var exerciceDefault = await exercicesDefaultDb.getExercicesByName(exerciceList.exercicesNames[i]);
        var exercice = ExercicesModel(name: exerciceList.exercicesNames[i],
            series: exerciceDefault[0]['series'],
            repetitions: exerciceDefault[0]['repetitions'],
            weight: exerciceDefault[0]['weight'],
            rest: exerciceDefault[0]['rest'],
            exerciceOrder: i + 1 + exerciceCount,
            trainingId: trainingId,
            sessionId: sessionId);
        db.insert(exercice);
      }
    } else if (mode == "all") {
      for (var d = 0; d < sessions.length; d++) {
        for (var i = 0; i < exerciceList.exercicesNames.length; i++) {
          var exercice = ExercicesModel(name: exerciceList.exercicesNames[i],
              series: 3,
              repetitions: 10,
              weight: 0,
              rest: 120,
              exerciceOrder: i + 1 + exerciceCount,
              trainingId: trainingId,
              sessionId: sessions[d]['id']);
          db.insert(exercice);
        }
      }
    }
    Navigator.pop(context);
  }

  getDefaultExercices() {
    return FutureBuilder(
        future: exercicesDefaultDb.getAllExercices(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              for (ExercicesDefaultModel exerciceDefault in snapshot.data)
            Row(children: [
              Column(
                children: [
                  Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0,color: Color(0xFFD34B4B)),
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/' + exerciceDefault.name + '.png'),
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
                  Container(
                    child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice(exerciceDefaultId: exerciceDefault.id))),
                        child: Text(StringUtils.capitalize(exerciceDefault.name),
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.center)),
                    alignment: Alignment.center,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Column(
                children: [
                  Container(
                      child: GestureDetector(
                          onTap: () => setState(() {
                            if (exerciceList.exercicesNames.contains(exerciceDefault.name)) {
                              exerciceList.count -= 1;
                              exerciceList.exercicesNames.remove(exerciceDefault.name);
                            } else {
                              exerciceList.count += 1;
                              exerciceList.exercicesNames.add(exerciceDefault.name);
                            }
                          }),
                          child: exerciceList.exercicesNames.contains(exerciceDefault.name) ? new Icon(Icons.check_box, color: Color(0xFFD34B4B)) : new Icon(Icons.check_box_outline_blank, color: Color(0xFFD34B4B))),
                      margin: new EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ], mainAxisAlignment: MainAxisAlignment.spaceAround)]);
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
      Row(children: [
        Container(
            child: (trainingName != null) ? new Text(trainingName.toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)):new Text("Programme".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD34B4B),
                    fontWeight: FontWeight.bold)),
            margin: new EdgeInsets.only(left: 20.0, top: 20.0),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-40)),
      ]),
      Row(
        children: [
          Column(
            children: [
              Container(
                child: Text("Quel nouvel exercice voulez vous ajouter ?",
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
                margin: new EdgeInsets.only(left: 20.0, top: 15.0),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      getDefaultExercices(),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: exerciceList.count == 0 ? null : () => exercicesCreated(),
                child:
                    Text('Ajouter '+ exerciceList.count.toString() + ' exercices', style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
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
