import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_concert_app/pages/HomePage.dart';
import 'package:flutter_concert_app/pages/LoginPage.dart';
import 'package:flutter_concert_app/pages/SettingsPage.dart';
import 'package:flutter_concert_app/pages/FlightsPage.dart';
import 'package:flutter_concert_app/pages/LikedPage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const LikedPage(),
    const FlightsPage(),
    const SettingsPage(),
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
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Color.fromARGB(255, 87, 86, 86),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color.fromARGB(255, 90, 88, 89)),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 90, 88, 89),
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.flight,
                  color: Color.fromARGB(255, 90, 88, 89),
                ),
                label: "Flights",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 87, 86, 86),
                ),
                label: "Settings",
              )
            ],
            elevation: 2,
          ),
        ),
      ),
    );
  }
}
