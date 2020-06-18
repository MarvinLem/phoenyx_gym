import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './editProfil.dart';
import './database/userDatabase.dart';

class User {
  int size;
  int weight;
  int birthday;
  String gender;
  int sessions;

  User({this.size, this.weight, this.birthday, this.gender, this.sessions});
}

class Profil extends StatefulWidget {
  final Function pageSelected;

  Profil({this.pageSelected});

  @override
  State<StatefulWidget> createState() {
    return ProfilState(pageSelected: pageSelected);
  }
}

class ProfilState extends State<Profil> {
  final Function pageSelected;
  var user;
  UserDatabase db = UserDatabase();

  ProfilState({this.pageSelected});

  @override
  void initState() {
    getUser();
  }

  getUser() async {
    user = await db.getLastUser();
  }

  sessionTrophy() {
    if(user[0]['sessions'] < 0) {
      return Column(children: [
        Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                    'assets/images/unlocked.png'),
                fit: BoxFit.cover,
              ),
            ),
            constraints:
            BoxConstraints(minWidth: 71, minHeight: 90),
            margin: EdgeInsets.only(top: 20)),
        Container(
            child: new Text(
              'Compléter 1 séance',
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.only(top: 10),
            constraints: BoxConstraints(
                maxWidth:
                MediaQuery
                    .of(context)
                    .size
                    .width / 3 -
                    40)),
        Container(
            child: new LinearPercentIndicator(
              width: 100.0,
              lineHeight: 10.0,
              percent: user[0]['sessions'] != null
                  ? user[0]['sessions'] / 1
                  : 0,
              backgroundColor: Color(0xFFC8C8C8),
              progressColor: Color(0xFFD34B4B),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 30))
      ]);
    } else if(user[0]['sessions'] > 0 && user[0]['sessions'] < 3) {
      return Column(children: [
        Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                    'assets/images/bronze.png'),
                fit: BoxFit.cover,
              ),
            ),
            constraints:
            BoxConstraints(minWidth: 71, minHeight: 90),
            margin: EdgeInsets.only(top: 20)),
        Container(
            child: new Text(
              'Compléter 3 séances',
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.only(top: 10),
            constraints: BoxConstraints(
                maxWidth:
                MediaQuery.of(context).size.width / 3 -
                    40)),
        Container(
            child: new LinearPercentIndicator(
              width: 100.0,
              lineHeight: 10.0,
              percent: user[0]['sessions'] != null
                  ? user[0]['sessions'] / 3
                  : 0,
              backgroundColor: Color(0xFFC8C8C8),
              progressColor: Color(0xFFD34B4B),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 30))
      ]);
    } else if(user[0]['sessions'] >= 3 && user[0]['sessions'] < 5) {
      return Column(children: [
        Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                    'assets/images/silver.png'),
                fit: BoxFit.cover,
              ),
            ),
            constraints:
            BoxConstraints(minWidth: 71, minHeight: 90),
            margin: EdgeInsets.only(top: 20)),
        Container(
            child: new Text(
              'Compléter 5 séances',
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.only(top: 10),
            constraints: BoxConstraints(
                maxWidth:
                MediaQuery.of(context).size.width / 3 -
                    40)),
        Container(
            child: new LinearPercentIndicator(
              width: 100.0,
              lineHeight: 10.0,
              percent: user[0]['sessions'] != null
                  ? user[0]['sessions'] / 5
                  : 0,
              backgroundColor: Color(0xFFC8C8C8),
              progressColor: Color(0xFFD34B4B),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 30))
      ]);
    } else if(user[0]['sessions'] >= 5) {
      return Column(children: [
        Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                    'assets/images/gold.png'),
                fit: BoxFit.cover,
              ),
            ),
            constraints:
            BoxConstraints(minWidth: 71, minHeight: 90),
            margin: EdgeInsets.only(top: 20)),
        Container(
            child: new Text(
              'Compléter 5 séances',
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.only(top: 10),
            constraints: BoxConstraints(
                maxWidth:
                MediaQuery.of(context).size.width / 3 -
                    40)),
        Container(
            child: new LinearPercentIndicator(
              width: 100.0,
              lineHeight: 10.0,
              percent: 1,
              backgroundColor: Color(0xFFC8C8C8),
              progressColor: Color(0xFFD34B4B),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 30))
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(
        children: [
          Container(
              child: new Text("Profil".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD34B4B),
                      fontWeight: FontWeight.bold)),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 20.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/profil.png'),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: BoxConstraints(minWidth: 130.0, minHeight: 130.0))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty || user[0]['birthday'] == null)
              ? Container(
                  child: new Text("Date de naissance:   ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3F3F3F),
                      )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10))
              : Container(
                  child: new Text(
                      "Date de naissance: " +
                          new DateTime.fromMillisecondsSinceEpoch(
                                  user[0]['birthday'])
                              .day
                              .toString() +
                          "/" +
                          new DateTime.fromMillisecondsSinceEpoch(
                                  user[0]['birthday'])
                              .month
                              .toString() +
                          "/" +
                          new DateTime.fromMillisecondsSinceEpoch(
                                  user[0]['birthday'])
                              .year
                              .toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3F3F3F),
                      )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty || user[0]['size'] == null)
              ? Container(
                  child: new Text("Taille:   ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3F3F3F),
                      )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10))
              : Container(
                  child:
                      new Text("Taille: " + user[0]['size'].toString() + "cm",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3F3F3F),
                          )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty || user[0]['weight'] == null)
              ? Container(
                  child: new Text("Poids:   ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3F3F3F),
                      )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10))
              : Container(
                  child:
                      new Text("Poids: " + user[0]['weight'].toString() + "kg",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3F3F3F),
                          )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty || user[0]['gender'] == null)
              ? Container(
                  child: new Text("Sexe:   ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3F3F3F),
                      )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10))
              : Container(
                  child: new Text("Sexe: " + user[0]['gender'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3F3F3F),
                      )),
                  alignment: Alignment.center,
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          Container(
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfil()),
                  ).then((_) {
                    setState(() {
                      getUser();
                    });
                  });
                },
                child:
                    Text('Modifier le profil', style: TextStyle(fontSize: 18)),
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
      Row(
        children: [
          Container(
              child: new Text("Vos exploits sportifs".toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFD34B4B),
                      fontWeight: FontWeight.bold)),
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 30.0, bottom: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Row(
        children: [
          (user == null || user.isEmpty || user[0]['sessions'] == null)
              ? Container(
                  child: Column(children: [
                    Container(
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image:
                                ExactAssetImage('assets/images/unlocked.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        constraints:
                            BoxConstraints(minWidth: 71, minHeight: 90),
                        margin: EdgeInsets.only(top: 20)),
                    Container(
                        child: new Text(
                          'Compléter 1 séance',
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width / 3 - 40)),
                    Container(
                        child: new LinearPercentIndicator(
                          width: 100.0,
                          lineHeight: 10.0,
                          percent: 0,
                          backgroundColor: Color(0xFFC8C8C8),
                          progressColor: Color(0xFFD34B4B),
                        ),
                        margin: EdgeInsets.only(top: 10, bottom: 30))
                  ]),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width / 3 - 40))
              : Container(
                  child: sessionTrophy(),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width / 3 - 40)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 3 - 40)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 3 - 40)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
