import 'package:flutter/material.dart';
import '../../models/firebase_authen.dart';
import 'package:provider/provider.dart';
import 'package:tesma/views/regis_screens/regis_screen.dart';

class LoginForm extends StatelessWidget {
  // This widget is the root of your application.
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Email"),
            controller: userController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<AuthService>()
                  .signIn(userController.text, passwordController.text);
            },
            style: ButtonStyle(
                //backgroundColor: Color.fromRGBO(69, 34, 139, 10),
                ),
            child: Text(
              "Signin",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyRegisterScreen()));
            },
            child: Text(
              "Sign up",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
