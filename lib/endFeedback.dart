import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import './database/exercicesDatabase.dart';

class EndFeedback extends StatefulWidget {
  int trainingId;
  int sessionId;
  List exerciceArray;

  EndFeedback({this.trainingId,this.sessionId,this.exerciceArray});

  @override
  State<StatefulWidget> createState() {
    return EndFeedbackState(
        trainingId: trainingId, sessionId: sessionId,exerciceArray: exerciceArray);
  }
}

class EndFeedbackState extends State<EndFeedback> {
  final int trainingId;
  final int sessionId;
  final List exerciceArray;
  List exerciceFeedbackArray = [];
  ExercicesDatabase db = ExercicesDatabase();

  EndFeedbackState({this.trainingId, this.sessionId,this.exerciceArray});

  @override
  void initState() {
    getExercicesByTrainingIdAndSessionId(trainingId,sessionId);
  }

  changeExerciceByFeedback(exercice, feedback) async {
    switch(feedback){
      case 0: {
      //trop dur on réduit les reps
        //Si on a plus de 5 reps, on reduit les reps
        if(exercice.repetitions > 5){
          if(exercice.repetitions % 2 == 0){
            exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions - 2,'weight': exercice.weight,'rest': exercice.rest});
          } else if(exercice.repetitions % 2 == 1 || exercice.repetitions == 6) {
            exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions - 1,'weight': exercice.weight,'rest': exercice.rest});
          }
          //Si on a moins de 5 reps, on reduit le poids ou rien
        } else {
          if(exercice.weight >= 5){
            exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions = 10,'weight': exercice.weight - 5,'rest': exercice.rest});
          } else {
            exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions,'weight': exercice.weight,'rest': exercice.rest});
          }
        }
      }
      break;
      case 1: {
        //on garde pareil
        exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions,'weight': exercice.weight,'rest': exercice.rest});
      }
      break;
      case 2: {
        //on augmente
        //Si on a moins de 15 reps, on augmente les reps
        if(exercice.repetitions < 15){
          if(exercice.repetitions % 2 == 0){
            exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions + 2,'weight': exercice.weight,'rest': exercice.rest});
          } else if(exercice.repetitions % 2 == 1 || exercice.repetitions == 14) {
            exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions + 1,'weight': exercice.weight,'rest': exercice.rest});
          }
          //Si on a 15 reps, on augmente le poids
        } else {
          exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions = 8,'weight': exercice.weight + 5,'rest': exercice.rest});
        }
      }
      break;
      case 3: {
        //on augmente beaucoup
        //on augmente le poids
          exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions,'weight': exercice.weight + 5,'rest': exercice.rest});
      }
      break;
      default: {
          //on garde pareil
          exerciceFeedbackArray.add({'id': exercice.id,'series': exercice.series,'repetitions': exercice.repetitions,'weight': exercice.weight,'rest': exercice.rest});
      }
    }
  }

  updateExercices(){
    for(var c=0; c<exerciceFeedbackArray.length; c++){
      db.updateExercice(exerciceFeedbackArray[c]['series'],exerciceFeedbackArray[c]['repetitions'],exerciceFeedbackArray[c]['weight'],exerciceFeedbackArray[c]['rest'],exerciceFeedbackArray[c]['id']);
    }
  }

  getExercicesByTrainingIdAndSessionId(trainingId,sessionId){
    return FutureBuilder(
        future: db.getExercicesByTrainingIdAndSessionId(trainingId, sessionId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var i = 0;
            for (ExercicesModel exercice in snapshot.data) {
                changeExerciceByFeedback(exercice, exerciceArray[i]);
                i += 1;
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
                                  image: ExactAssetImage('assets/images/'+exercice.name+'.png'),
                                  fit: BoxFit.none,
                                ),
                              ),
                              constraints: BoxConstraints(
                                  minWidth: 80.0, minHeight: 80.0),
                              margin: new EdgeInsets.only(
                                  right: 20, top: 20, bottom: 20),
                            )
                          ],
                        ),
                        Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(StringUtils.capitalize(exercice.name),
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
                        child: Text(exercice.series.toString() + " x " + exercice.repetitions.toString() + " - " + exercice.rest.toString() + " secondes de repos" + (exercice.weight != 0 && exercice.weight != null ? ' - ' + exercice.weight.toString() + 'kg' : ''),
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                        alignment: Alignment.topLeft,
                        margin: new EdgeInsets.only(bottom: 5),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('--> ' + exerciceFeedbackArray[exercice.exerciceOrder - 1]['series'].toString() + " x " + exerciceFeedbackArray[exercice.exerciceOrder - 1]['repetitions'].toString() + " - " + exerciceFeedbackArray[exercice.exerciceOrder - 1]['rest'].toString() + " secondes de repos" + ( exerciceFeedbackArray[exercice.exerciceOrder - 1]['weight'] != 0 && exerciceFeedbackArray[exercice.exerciceOrder - 1]['weight'] != null ? ' - ' + exerciceFeedbackArray[exercice.exerciceOrder - 1]['weight'].toString() + 'kg' : ''),
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            textAlign: TextAlign.left),
                        alignment: Alignment.topLeft,
                        margin: new EdgeInsets.only(bottom: 15),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
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
              Container(
                  child: new Text(
                    "Fin de la séance".toUpperCase(),
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
              Container(
                  child: new Text(
                    "Nous conseillons par rapport à vos\n ressentis de changer ces exercices",
                    style: TextStyle(fontSize: 16, color: Color(0xFF3F3F3F)),
                    textAlign: TextAlign.center,
                  ),
                  margin: new EdgeInsets.only(top: 20.0)),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          getExercicesByTrainingIdAndSessionId(trainingId,sessionId),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () => {
                      updateExercices(),
                      Navigator.of(context)
                        .popUntil((route) => route.isFirst)},
                    child: Text('Changer le programme',
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
                    onPressed: () => Navigator.of(context)
                        .popUntil((route) => route.isFirst),
                    child: Text('Ne rien modifier',
                        style: TextStyle(fontSize: 16)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFF3F3F3F),
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
