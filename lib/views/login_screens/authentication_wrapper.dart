import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesma/views/login_screens/loading.dart';
import 'package:tesma/views/login_screens/login_screen.dart';
import '../../views/main_screens/mainscreen.dart';
import '../../models/firebase_authen.dart';

class AuthenticationWrapper extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider(
          create: (context) => AuthService(FirebaseAuth.instance),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<AuthService>(context);

              if (provider.isSigningIn) {
                return Loading();
              } else if (snapshot.hasData) {
                return MyHomePage();
              } else {
                return LoginForm();
              }
            },
          ),
        ),
      );
  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );
}
