import 'package:drift/authenticationservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customcolors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: [
          Text("Profile"),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text("Sign out"),
          )
        ],
      ),
    );
  }
}
