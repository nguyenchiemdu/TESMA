import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../models/firebase_authen.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  // This widget is the root of your application.
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color getbackgroudcolor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xff7243cf);
      }
      return Color(0xff45228b);
    }

    //var borderRadius = BorderRadius.circular(15);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Row(children: [
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              Row(children: [
                Text(
                  "Hello there, sign in to continue",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xffd7cee9),
                    fontSize: 16.0,
                  ),
                ),
              ]),
              Row(children: [
                Text(
                  "Username or email",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16.0,
                  ),
                ),
              ]),
              TextField(
                decoration:
                    InputDecoration(labelText: "Enter your username or email"),
                controller: userController,
              ),
              Row(children: [
                Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16.0,
                  ),
                ),
              ]),
              TextField(
                decoration: InputDecoration(labelText: "Enter your password"),
                controller: passwordController,
              ),
              Row(children: [
                Text(
                  "Forgot password ?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff7243cf),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<AuthService>()
                        .signIn(userController.text, passwordController.text);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith(getbackgroudcolor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: Container(
                      width: 167,
                      height: 38,
                      child: Center(
                          child: Text(
                        "Sign in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )))),
              Text("Or sign in with",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffd7cee9),
                    fontSize: 16.0,
                  )),
              Container(
                  child: Row(children: [
                Icon(
                  Icons.mail,
                  color: Colors.blue,
                  size: 36.0,
                ),
                Icon(
                  Icons.facebook,
                  color: Colors.blue,
                  size: 36.0,
                ),
              ])),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don’t have an account ? ",
                    style: TextStyle(
                      color: Color(0xffd7cee9),
                      fontSize: 16.0,
                    )),
                TextSpan(
                    text: "Sign up",
                    style: TextStyle(
                      color: Color(0xff7243cf),
                      fontSize: 16.0,
                    )),
              ]))
            ],
          ),
        ));
  }
}
