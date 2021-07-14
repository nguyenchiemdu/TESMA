import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';
import 'package:provider/provider.dart';
import '../../views/main_screens/mainscreen.dart';

class AuthenticationWrapper extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MyHomePage();
    } else {
      return LoginForm();
    }
  }
}
