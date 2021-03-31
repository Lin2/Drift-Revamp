import 'package:flutter/material.dart';
import 'customcolors.dart';
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
      theme: new ThemeData(scaffoldBackgroundColor: CustomColors.base),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
