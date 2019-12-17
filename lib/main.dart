import 'package:flutter/material.dart';
import './home.dart';
import './training.dart';
import './agenda.dart';
import './profil.dart';
import './bottom.dart';
import './style.dart';

void main() => runApp(MyApp());


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String pageName;

  pageSelected(String page){
      pageName = page;
      onItemTapped(selectedIndex);
  }

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 0){
      return Home(pageSelected: pageSelected);
    } else if(selectedIndex == 1) {
        return Training(pageSelected: pageSelected);
    } else if(selectedIndex == 2){
        return Agenda();
    } else if(selectedIndex == 3){
        return Profil(pageSelected: pageSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Phoenix Gym")),
      body: onItemTapped(selectedIndex),
      bottomNavigationBar: Bottom(onItemTapped: onItemTapped, selectedIndex: selectedIndex),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Phoenix Gym',
        theme: appTheme(),
        routes: {
          '/home': (context) => Home(),
          '/training': (context) => Training(),
          '/agenda': (context) => Agenda(),
          '/profil': (context) => Profil(),
        },
        home: new HomeScreen());
  }
}