import 'package:flutter/material.dart';
import 'customcolors.dart';

class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
      color: CustomColors.base_dark,
      image: const DecorationImage(
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Colors.black,
        width: 8,
      ),
      borderRadius: BorderRadius.circular(12),
    ));
  }
}
