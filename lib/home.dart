import 'package:flutter/material.dart';
import 'customcolors.dart';
import 'calendar.dart';
import 'social.dart';
import 'profile.dart';

/// This is the stateful widget that the main application instantiates.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//https://willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
//https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
/// This is the private State class that goes with MyStatefulWidget.
class _HomeState extends State<Home> {
  //for navigation
  int _currentIndex = 1;
  final List<Widget> _children = [
    SocialPage(),
    CalendarPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.base_dark,
        selectedItemColor: CustomColors.base_white,
        unselectedItemColor: CustomColors.base_gray,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            //temporary names and icons
            icon: new Icon(Icons.cloud_outlined),
            label: 'Dream Tinder',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book_rounded),
            label: 'Dream Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
