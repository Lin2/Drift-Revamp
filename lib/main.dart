import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //https://www.youtube.com/watch?v=EXp0gq9kGxI
import 'customcolors.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Drift',
        theme: new ThemeData(scaffoldBackgroundColor: CustomColors.base),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('error ${snapshot.error.toString()}');
                return Text('something went wrong');
              } else if (snapshot.hasData) {
                //means firebase is properly  initialized
                return Home();
              } else {
                return Center(
                  //return loading indicator
                  child: CircularProgressIndicator(),
                );
              }
            })
        //Home(),
        );
  }
}
