import 'package:flutter/material.dart';
import './profil.dart';
import './custom_icons_icons.dart';

class EditProfil extends StatefulWidget {
  final Function pageSelected;

  EditProfil({this.pageSelected});

  @override
  State<StatefulWidget> createState() {
    return EditProfilState(pageSelected: pageSelected);
  }
}

class EditProfilState extends State<EditProfil> {
  final Function pageSelected;

  EditProfilState({this.pageSelected});

  var user = User();
  final _formKey = GlobalKey<FormState>();

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
              constraints: BoxConstraints(minWidth: 130.0, minHeight: 130.0))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.cake),
                    hintText: 'Entrez votre date de naissance',
                    labelText: 'Date de naissance',
                  ),
                  keyboardType: TextInputType.datetime),
              margin: EdgeInsets.only(right: 30, left: 30),
            ),
            Container(
              child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Les données ont été changées')));
                        Navigator.pop(context);
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
