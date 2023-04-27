import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_concert_app/pages/HomePage.dart';
import 'package:flutter_concert_app/pages/LoginPage.dart';
import 'package:flutter_concert_app/pages/SettingsPage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Liked Events'),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _widgetOptions[_selectedIndex]),
        bottomNavigationBar: Container(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Color.fromARGB(255, 87, 86, 86),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home, color: Color.fromARGB(255, 90, 88, 89)),),
                BottomNavigationBarItem(
                    label: "Search",
                    activeIcon: Icon(Icons.favorite, color: Color.fromARGB(255, 90, 88, 89)),
                    icon: Icon(Icons.favorite_outline_sharp,  color: Color.fromARGB(255, 90, 88, 89)),),
                
                BottomNavigationBarItem(
                    label: "Settings",
                    icon: Icon(Icons.settings, 
                        color: Color.fromARGB(255, 90, 88, 89)),
                    activeIcon: Icon(Icons.settings,
                        color: Color.fromARGB(255, 87, 86, 86))),
                BottomNavigationBarItem(
                    label: "new_icon",
                    icon: Icon(Icons.car_crash_outlined, color: Color.fromARGB(255, 90, 88, 89)),///// N
                    activeIcon: Icon(Icons.car_crash,)),
              ],
              elevation: 2,
            ),
          ),
        ));
  }
}
