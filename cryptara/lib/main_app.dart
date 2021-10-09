import 'package:cryptara/screens/learn_screen.dart';
import 'package:flutter/material.dart';

import 'package:cryptara/widgets/default/default_app_bar.dart';
import 'package:cryptara/screens/home_screen.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  static TextStyle optionStyle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LearnScreen(),
    Text(
      'Trade',
      style: optionStyle,
    ),
    Text(
      'Shop',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
