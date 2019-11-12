import 'package:flutter/material.dart';
import './home.dart';
import './training.dart';
import './getTraining.dart';
import './getAgenda.dart';
import './exercice.dart';
import './createTraining.dart';
import './createExercice.dart';
import './editTraining.dart';
import './editExercice.dart';
import './editAgenda.dart';
import './beginTraining.dart';
import './beginFeedback.dart';
import './endFeedback.dart';
import './agenda.dart';
import './profil.dart';
import './editProfil.dart';
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
      if(pageName == "createTraining"){
        return CreateTraining(pageSelected: pageSelected);
      } else if(pageName == "editTraining") {
        return EditTraining(pageSelected: pageSelected);
      } else if(pageName == "getTraining") {
        return GetTraining(pageSelected: pageSelected);
      } else if(pageName == "beginTraining") {
        return BeginTraining(pageSelected: pageSelected);
      } else if(pageName == "Exercice") {
        return Exercice(pageSelected: pageSelected);
      } else if(pageName == "createExercice") {
        return CreateExercice(pageSelected: pageSelected);
      } else if(pageName == "editExercice") {
        return EditExercice(pageSelected: pageSelected);
      } else if(pageName == "beginFeedback") {
        return BeginFeedback(pageSelected: pageSelected);
      } else if(pageName == "endFeedback") {
        return EndFeedback(pageSelected: pageSelected);
      } else {
        return Training(pageSelected: pageSelected);
      }
    } else if(selectedIndex == 2){
      if(pageName == "getAgenda"){
        return GetAgenda(pageSelected: pageSelected);
      } else if(pageName == "editAgenda"){
        return EditAgenda(pageSelected: pageSelected);
      } else {
        return Agenda(pageSelected: pageSelected);
      }
    } else if(selectedIndex == 3){
      if(pageName == "editProfil"){
         return EditProfil(pageSelected: pageSelected);
      } else {
        return Profil(pageSelected: pageSelected);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Phoenyx Gym")),
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