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
//https://medium.com/@swav.kulinski/flutter-navigating-off-the-charts-e118562a36a5
//https://medium.com/flutter/getting-to-the-bottom-of-navigation-in-flutter-b3e440b9386
/// This is the private State class that goes with MyStatefulWidget.

class _HomeState extends State<Home> {
  //for navigation
  static final navigatorKey = GlobalKey<NavigatorState>();
  final _pages = {
    "/": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text("HomePage"),
          ),
        ),
    "SocialPage": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text("HomePage"),
          ),
        ),
    "CalendarPage": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text("HomePage"),
          ),
        ),
    "ProfilePage": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text("HomePage"),
          ),
        ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.base_dark,
        selectedItemColor: CustomColors.base_white,
        unselectedItemColor: CustomColors.base_gray,
        onTap: (routeIndex) => navigatorKey.currentState
            .pushNamed(_pages.keys.toList()[routeIndex]),
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
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }

  Widget _buildBody() => MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: (route) => _pages[route.name]());
}
