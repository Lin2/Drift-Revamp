import 'package:flutter/material.dart';
import 'customcolors.dart';

class JournalEdit extends StatefulWidget {
  @override
  _JournalEditState createState() => _JournalEditState();
}

const double paddingSize = 7;

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
          Padding(
            padding: EdgeInsets.all(paddingSize),
            child: Ink(
              decoration: const ShapeDecoration(
                color: CustomColors.base_dark,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: BackButtonIcon(),
                color: CustomColors.base_gray,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          /*Padding(
              padding: EdgeInsets.all(paddingSize),
            child: TextField(
              decoration: InputDecoration(),
            ),
              ),*/
        ],
      ),
    );
  }
}

//st
