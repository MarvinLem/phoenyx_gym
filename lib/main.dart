import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './home.dart';
import './training.dart';
import './agenda.dart';
import './profil.dart';
import './bottom.dart';
import './style.dart';

import './database/database.dart';

void main() => runApp(MyApp());

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  AllDatabase db = AllDatabase();

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF9E3838),
    ));
    return new Scaffold(
      appBar: selectedIndex != 0 ? AppBar(title: Text("Phoenix Gym")) : null,
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
