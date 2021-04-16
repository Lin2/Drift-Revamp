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
  //TODO choose priority ordering for dreamtype(also relevant for colors)
  final String dreamtype;
  Color get dreamcolor => getDreamColor(dreamtype);
  //String get finalstring => 'A ' + '$dreamer' + '\'s  $dreamtype' + ': ';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 320,

      // Warning: hard-coding values like this is a bad practice
      padding: EdgeInsets.all(22.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          //maybe rid of this
          width: 1.0,
          color: CustomColors.base_white.withOpacity(0.9),
        ),
      ),

      /*child: Text(
        finalstring,
        style: TextStyle(
          fontSize: 30.0,
          color: CustomColors.base_white.withOpacity(0.8),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }*/

      child: RichText(
        text: new TextSpan(
            style: new TextStyle(
              fontSize: 30.0,
              color: CustomColors.base_white.withOpacity(0.8),
              fontWeight: FontWeight.w900,
            ),
            children: [
              new TextSpan(text: 'A $dreamer\'s '),
              new TextSpan(
                  text: '$dreamtype', style: new TextStyle(color: dreamcolor)),
              new TextSpan(text: ': '),
            ]),
      ),
    );
  }

  Color getDreamColor(String dreamtype) {
    //TODO make these names not sound like janky english + diff color for emotional
    switch (dreamtype) {
      case "dream":
        {
          return CustomColors.accent_purple;
        }
      case "good dream":
        {
          return CustomColors.accent_violet;
        }
      case "nightmare":
        {
          return CustomColors.accent_red;
        }
      case "surreal dream":
        {
          return CustomColors.accent_blue;
        }
      case "emotional dream":
        {
          return CustomColors.base_gray;
        }
      case "special dream":
        {
          return CustomColors.accent_yellow;
        }
    }
  }
}
