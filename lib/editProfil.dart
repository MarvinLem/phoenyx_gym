import 'package:flutter/material.dart';

class EditProfil extends StatelessWidget {
  final Function pageSelected;

  EditProfil({this.pageSelected});

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
      Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: TextFormField(
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
                  decoration: InputDecoration(
                    hintText: 'Entrez votre taille (en cm)',
                    labelText: 'Taille',
                  ),
                  keyboardType: TextInputType.number),
              margin: EdgeInsets.only(right: 30, left: 30),
            ),
            Container(
              child: TextFormField(
                  decoration: InputDecoration(
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
                onPressed: () => pageSelected("Profil"),
                child: Text('Sauvegarder les modifications',
                    style: TextStyle(fontSize: 18)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                color: Color(0xFFD34B4B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 30.0, bottom: 10),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }
}
