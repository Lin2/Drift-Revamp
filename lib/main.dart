import 'package:flutter/material.dart';
//import 'calendar.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0x776970ff)),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
