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
        tabletBody: LoginMobileContent(),
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
        // appBar: AppBar(
        //   toolbarHeight: 128,
        //   backgroundColor: Color(0xff45228b),
        //   title: Container(
        //     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        //     child: const Text('Log in',
        //         style: TextStyle(
        //           fontFamily: 'SegoeUI',
        //           color: Colors.white,
        //           fontSize: 40.0,
        //           fontWeight: FontWeight.w900,
        //         )),
        //   ),
        // ),
        body: Container(
          color: Colors.purple,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .15,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: const Text('Log in',
                    style: TextStyle(
                      fontFamily: 'SegoeUI',
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(25, 20, 25, 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Container(
                      //height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffe5e8fb),
                          //width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: Color(0xffd7cee9),
                              fontSize: 16.0,
                            ),
                            border: OutlineInputBorder(),
                            labelText: "Enter your username or email"),
                        controller: userController,
                      ),
                    ),
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
                    Container(
                      // height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffe5e8fb),
                          //width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: Color(0xffd7cee9),
                              fontSize: 16.0,
                            ),
                            border: OutlineInputBorder(),
                            labelText: "Enter your password"),
                        controller: passwordController,
                      ),
                    ),
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
                    ElevatedButton(
                        onPressed: () {
                          context.read<AuthService>().signIn(
                              userController.text, passwordController.text);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                getbackgroudcolor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                        child: Container(
                            //width: 195,
                            //height: 43,
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
                    Text("Or sign in with",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SegoeUI',
                          color: Color(0xffd7cee9),
                          fontSize: 16.0,
                        )),
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
              ),
            ],
          ),
        ));
  }
}
