import 'package:flutter/material.dart';
import 'package:phoenyx_gym/database/trainingDatabase.dart';
import './exercice.dart';

import './database/exercicesDatabase.dart';
import './database/trainingDatabase.dart';

class ExerciceList {
  var exercicesNames = [];
  bool pompes = false;
  bool squat = false;
  bool abdos = false;
  int count = 0;
}

class CreateExercice extends StatefulWidget {
  int trainingId;
  int sessionId;

  CreateExercice({this.trainingId,this.sessionId});

  @override
  State<StatefulWidget> createState() {
    return CreateExerciceState(trainingId: trainingId, sessionId: sessionId);
  }
}

class CreateExerciceState extends State<CreateExercice> {
  int trainingId;
  int sessionId;
  int exerciceCount = 0;
  String trainingName;
  ExercicesDatabase db = ExercicesDatabase();
  TrainingDatabase trainingDb = TrainingDatabase();

  CreateExerciceState({this.trainingId,this.sessionId});

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
    for(var i=0;i<exerciceList.exercicesNames.length;i++) {
      var exercice = ExercicesModel(name: exerciceList.exercicesNames[i],
          series: 3,
          repetitions: 10,
          weight: 0,
          rest: 120,
          exerciceOrder: i+1+exerciceCount,
          trainingId: trainingId,
          sessionId: sessionId);
      db.insert(exercice);
    }
    Navigator.pop(context);
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
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0,color: Color(0xFFD34B4B)),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/pompes.png'),
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice())),
                  child: Text("Pompes",
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
                      if (exerciceList.pompes) {
                        exerciceList.pompes = false;
                        exerciceList.count -= 1;
                        exerciceList.exercicesNames.remove("pompes");
                      } else {
                        exerciceList.pompes = true;
                        exerciceList.count += 1;
                        exerciceList.exercicesNames.add("pompes");
                      }
                    }),
                    child: exerciceList.pompes ? new Icon(Icons.check_box, color: Color(0xFFD34B4B)) : new Icon(Icons.check_box_outline_blank, color: Color(0xFFD34B4B))),
                margin: new EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ], mainAxisAlignment: MainAxisAlignment.spaceAround),
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0,color: Color(0xFFD34B4B)),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/squat.png'),
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
                  child: Text("Squat",
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
                      if (exerciceList.squat) {
                        exerciceList.squat = false;
                        exerciceList.count -= 1;
                        exerciceList.exercicesNames.remove("squat");
                      } else {
                        exerciceList.squat = true;
                        exerciceList.count += 1;
                        exerciceList.exercicesNames.add("squat");
                      }
                    }),
                    child: exerciceList.squat ? new Icon(Icons.check_box, color: Color(0xFFD34B4B)) : new Icon(Icons.check_box_outline_blank, color: Color(0xFFD34B4B))),
                margin: new EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ], mainAxisAlignment: MainAxisAlignment.spaceAround),
      Row(children: [
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0,color: Color(0xFFD34B4B)),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/abdos.png'),
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
                  child: Text("Abdos",
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
                      if (exerciceList.abdos) {
                        exerciceList.abdos = false;
                        exerciceList.count -= 1;
                        exerciceList.exercicesNames.remove("abdos");
                      } else {
                        exerciceList.abdos = true;
                        exerciceList.count += 1;
                        exerciceList.exercicesNames.add("abdos");
                      }
                    }),
                    child: exerciceList.abdos ? new Icon(Icons.check_box, color: Color(0xFFD34B4B)) : new Icon(Icons.check_box_outline_blank, color: Color(0xFFD34B4B))),
                margin: new EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ], mainAxisAlignment: MainAxisAlignment.spaceAround),
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
