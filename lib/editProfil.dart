import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import './profil.dart';
import './custom_icons_icons.dart';
import './database/userDatabase.dart';


class EditProfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfilState();
  }
}

class EditProfilState extends State<EditProfil> {
  var user = User();
  final _formKey = GlobalKey<FormState>();
  UserDatabase db = UserDatabase();

  @override
  void initState() {
    getUser();
  }

  getUser() async {
    var userData = await db.getLastUser();
    if(userData != null || userData.isNotEmpty){
      setState(() {
        user.size = userData[0]['size'];
        user.weight = userData[0]['weight'];
        user.birthday = userData[0]['birthday'];
        user.gender = userData[0]['gender'];
      });
    }
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
                  constraints:
                      BoxConstraints(minWidth: 130.0, minHeight: 130.0))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: DateTimeField(
                        format: DateFormat("yyyy-MM-dd"),
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: user.birthday != null ? DateTime.fromMillisecondsSinceEpoch(user.birthday) : DateTime.now(),
                              lastDate: DateTime(2100));
                          setState(() {
                            user.birthday = date.millisecondsSinceEpoch;
                          });
                          return date;
                        },
                        controller: TextEditingController()..text = user.birthday != null ? new DateTime.fromMillisecondsSinceEpoch(
                            user.birthday)
                            .day
                            .toString() +
                            "/" +
                            new DateTime.fromMillisecondsSinceEpoch(
                                user.birthday)
                                .month
                                .toString() +
                            "/" +
                            new DateTime.fromMillisecondsSinceEpoch(
                                user.birthday)
                                .year
                                .toString() : '',
                        onChanged: (text) => {},
                        decoration: InputDecoration(
                          icon: Icon(Icons.cake),
                          hintText: 'Entrez votre date de naissance',
                          labelText: 'Date de naissance',
                        )),
                    margin: EdgeInsets.only(right: 30, left: 30)),
                Container(
                  child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ce champ doit être rempli';
                        } else {
                          setState(() {
                            user.size = int.parse(value);
                          });
                        }
                        return null;
                      },
                      controller: TextEditingController()..text = user.size != null ? user.size.toString() : '',
                      onChanged: (text) => {},
                      decoration: InputDecoration(
                        icon: Icon(Icons.straighten),
                        hintText: 'Entrez votre taille (en cm)',
                        labelText: 'Taille',
                      ),
                      keyboardType: TextInputType.number),
                  margin: EdgeInsets.only(right: 30, left: 30),
                ),
                Container(
                  child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ce champ doit être rempli';
                        } else {
                          setState(() {
                            user.weight = int.parse(value);
                          });
                        }
                        return null;
                      },
                      controller: TextEditingController()..text = user.weight != null ? user.weight.toString() : '',
                      onChanged: (text) => {},
                      decoration: InputDecoration(
                        icon: Icon(CustomIcons.balance_scale),
                        hintText: 'Entrez votre poids (en kg)',
                        labelText: 'Poids',
                      ),
                      keyboardType: TextInputType.number),
                  margin: EdgeInsets.only(right: 30, left: 30),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        db.updateUser(user.birthday, user.size, user.weight, user.gender);
                        Navigator.of(context).pop(true);
                      }
                    },
                    child: Text('Sauvegarder les modifications',
                        style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFFD34B4B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                alignment: Alignment.center,
                margin: new EdgeInsets.only(top: 30.0, bottom: 30),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ]));
  }
}
