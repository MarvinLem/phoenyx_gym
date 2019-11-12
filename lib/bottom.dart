import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  final Function onItemTapped;
  final int selectedIndex;

  Bottom({this.onItemTapped, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed ,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: new Text('Accueil')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: new Text('Entrainement')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: new Text('Agenda')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: new Text('Profil')
        )
      ],
      currentIndex: selectedIndex,
      backgroundColor: Color(0xFF3F3F3F),
      selectedItemColor: Color(0xFFD34B4B),
      unselectedItemColor: Colors.white,
      onTap: onItemTapped,
    );
  }
}
