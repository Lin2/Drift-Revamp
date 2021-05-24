import 'package:flutter/material.dart';
import 'customcolors.dart';

class JournalEdit extends StatefulWidget {
  @override
  _JournalEditState createState() => _JournalEditState();
}

class _JournalEditState extends State<JournalEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.04,
            ),
          ),
          BackButton(color: CustomColors.base_white),
        ],
      ),
    );
  }
}

//st
