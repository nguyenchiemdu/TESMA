import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/firebase_authen.dart';

class HomePageLoginTest extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Homepage'),
        ElevatedButton(
            onPressed: () {
              context.read<AuthService>().signOut();
            },
            child: Text("Signout"))
      ]),
    );
  }
}
