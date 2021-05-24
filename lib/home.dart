import 'package:flutter/material.dart';
import 'customcolors.dart';
import 'calendar.dart';
import 'social.dart';
import 'profile.dart';

//using https://medium.com/flutter/getting-to-the-bottom-of-navigation-in-flutter-b3e440b9386
//as of right now (switching to another)

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.teal),
  Destination('Business', Icons.business, Colors.cyan),
  Destination('School', Icons.school, Colors.orange),
  Destination('Flight', Icons.flight, Colors.blue)
];

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.destination.title} Text'),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[100],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return DestinationView(destination: destination);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          //temporary names and icons
          BottomNavigationBarItem(
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
}

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}
