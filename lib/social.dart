import 'package:flutter/material.dart';
import 'package:swipeable_card/swipeable_card.dart';
import 'customcolors.dart';

import 'card.dart';

//https://pub.dev/packages/swipeable_card/example
class SocialPage extends StatefulWidget {
  const SocialPage({Key key}) : super(key: key);

  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  //temp values
  final List<CustomCard> cards = [
    //can have any number of constructors, default is dreamer and dream(purple)
    //maybe can have chance to get restless/just dreamer for spice?
    CustomCard(dreamtype: "surreal dream"),
    CustomCard(dreamer: "restless dreamer"),
    CustomCard(dreamtype: "dream"),
    CustomCard(dreamer: "early bird", dreamtype: "emotional dream"),
    CustomCard(dreamtype: "special dream"),
    CustomCard(dreamtype: "nightmare"),
    CustomCard(dreamtype: "good dream"),
  ];
  int currentCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    SwipeableWidgetController _cardController = SwipeableWidgetController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            if (currentCardIndex < cards.length)
              SwipeableWidget(
                cardController: _cardController,
                animationDuration: 500,
                horizontalThreshold: 0.85,
                child: cards[currentCardIndex],
                nextCards: <Widget>[
                  // show next card
                  // if there are no next cards, show nothing
                  if (!(currentCardIndex + 1 >= cards.length))
                    Align(
                      alignment: Alignment.center,
                      //TODO make this not awkward
                      child: cards[currentCardIndex], //temp card during swipe
                    ),
                ],
                onLeftSwipe: () => swipeLeft(),
                onRightSwipe: () => swipeRight(),
              )
            else
              // if the deck is complete, add a button to reset deck
              Center(
                child: TextButton(
                  child: Text("Reset deck"),
                  onPressed: () => setState(() => currentCardIndex = 0),
                ),
              ),

            // only show the card controlling buttons when there are cards
            // otherwise, just hide it
            if (currentCardIndex < cards.length)
              cardControllerRow(_cardController),
          ],
        ),
      ),
    );
  }

  void swipeLeft() {
    //left means go next
    // NOTE: it is your job to change the card
    setState(() {
      currentCardIndex++;
    });
  }

  void swipeRight() {
    //right means go previous
    setState(() {
      if (currentCardIndex == 0) {
        currentCardIndex = cards.length - 1; //if first, loop to back
      } else {
        currentCardIndex--;
      }
    });
  }

  Widget cardControllerRow(SwipeableWidgetController cardController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextButton(
          child: Text("Previous"),
          onPressed: () => cardController.triggerSwipeRight(),
        ),
        TextButton(
          child: Text("Next"),
          onPressed: () => cardController.triggerSwipeLeft(),
        ),
      ],
    );
  }
}
