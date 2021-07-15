import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tesma/max_width_container.dart';
import '../../models/firebase_authen.dart';
import 'package:provider/provider.dart';
import 'package:tesma/views/regis_screens/regis_screen.dart';
import 'package:tesma/responsive_layout.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var borderRadius = BorderRadius.circular(15);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MaxWidthContainer(
          child: ReponsiveLayout(
        mobileBody: LoginMobileContent(),
        tabletBody: LoginTabletContent(),
      )),
    );
  }
}

class LoginMobileContent extends StatelessWidget {
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

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 128,
          backgroundColor: Color(0xff45228b),
          title: const Text('Log in',
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              )),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: EdgeInsets.fromLTRB(25, 20, 25, 50),
          child: Column(
            children: [
              Row(children: [
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SegoeUI',
                    color: Color(0xff000000),
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ]),
              Row(children: [
                Text(
                  "Hello there, sign in to continue",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SegoeUI',
                    color: Color(0xffd7cee9),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ]),
              Spacer(),
              Row(children: [
                Text(
                  "Username or email",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SegoeUI',
                    color: Color(0xff000000),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
              Spacer(),
              Container(
                height: 46,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your username or email"),
                  controller: userController,
                ),
              ),
              Spacer(),
              Row(children: [
                Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SegoeUI',
                    color: Color(0xff000000),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
              Spacer(),
              Container(
                height: 46,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your password"),
                  controller: passwordController,
                ),
              ),
              Spacer(),
              Row(children: [
                Text(
                  "Forgot password ?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'SegoeUI',
                      color: Color(0xff7243cf),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
              ]),
              Spacer(),
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
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  child: Container(
                      width: 195,
                      height: 43,
                      child: Center(
                          child: Text(
                        "Log in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xffffffff),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900),
                      )))),
              Spacer(),
              Text("Or sign in with",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SegoeUI',
                    color: Color(0xffd7cee9),
                    fontSize: 16.0,
                  )),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                new GestureDetector(
                  onTap: () {
                    context.read<AuthService>().signInWithGoogle();
                  },
                  child: Icon(
                    Icons.mail,
                    color: Colors.blue,
                    size: 45.0,
                  ),
                ),
                Icon(
                  Icons.facebook,
                  color: Colors.blue,
                  size: 45.0,
                ),
              ]),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Don’t have an account ? ",
                        style: TextStyle(
                          fontFamily: 'SegoeUI',
                          color: Color(0xffd7cee9),
                          fontSize: 16.0,
                        ),
                      ),
                    ]),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyRegisterScreen()),
                      );
                    },
                    child: new Text(
                      "Sign up",
                      style: TextStyle(
                          color: Color(0xff7243cf),
                          fontSize: 16.0,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class LoginTabletContent extends StatelessWidget {
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

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 128,
          backgroundColor: Color(0xff45228b),
          title: const Text('Log in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              )),
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
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthService>().signInWithGoogle();
                    },
                    child: Icon(
                      Icons.mail,
                      color: Colors.blue,
                      size: 36.0,
                    )),
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
                    ),
                  ),
                ]),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyRegisterScreen()),
                ),
                child: Text("Sign up"),
              ),
            ],
          ),
        ));
  }
}
