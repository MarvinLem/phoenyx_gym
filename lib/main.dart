import 'package:flutter/material.dart';

import './home.dart';
import './training.dart';
import './agenda.dart';
import './profil.dart';
import './bottom.dart';
import './style.dart';

import './database/trainingDatabase.dart';

void main() => runApp(MyApp());

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String pageName;
  TrainingDatabase db = TrainingDatabase();

  onItemTapped(index){
    setState(() {
      selectedIndex = index;
    });
  }

  selectedView(int index) {
    if (selectedIndex == 0) {
      return Home();
    } else if (selectedIndex == 1) {
      return Training();
    } else if (selectedIndex == 2) {
      return Agenda();
    } else if (selectedIndex == 3) {
      return Profil();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Phoenix Gym")),
      body: FutureBuilder(
          future: db.initDB(),
          builder: (BuildContext context, snapshot) {
              return selectedView(selectedIndex);
          }),
      bottomNavigationBar:
          Bottom(selectedIndex: selectedIndex, onItemTapped: onItemTapped),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Phoenix Gym',
        theme: appTheme(),
        home: new HomeScreen());
  }
}
