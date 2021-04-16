import 'package:flutter/material.dart';
import 'customcolors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    this.color = CustomColors.base_dark,
    this.dreamer = "dreamer",
    this.dreamtype = "dream",
  }) : super(key: key);
  final Color color;
  final String dreamer;
  final String dreamtype;
  String get finalstring => 'A ' + '$dreamer' + '\'s  $dreamtype' + ': ';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 320,

      // Warning: hard-coding values like this is a bad practice
      padding: EdgeInsets.all(38.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: CustomColors.base_white.withOpacity(0.9),
        ),
      ),

      child: Text(
        finalstring,
        style: TextStyle(
          fontSize: 36.0,
          // color: Colors.white,
          color: CustomColors.base_white.withOpacity(0.8),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
