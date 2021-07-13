import 'package:flutter/material.dart';
import '../../models/firebase_authen.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  // This widget is the root of your application.
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                    .Signin(userController.text, passwordController.text);
              },
              child: Text("Signin"))
        ],
      ),
    );
  }
}
