import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tesma/max_width_container.dart';
import 'package:tesma/views/login_screens/loading.dart';
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
        body: Container(
          color: Color(0xff45228b),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .15,
                padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log in',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'SegoeUI',
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
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
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 30.0),
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
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 15.0),
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
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 15.0),
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
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthService>().signIn(
                                  userController.text, passwordController.text);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        getbackgroudcolor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Or sign in with",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: Color(0xffd7cee9),
                              fontSize: 16.0,
                            )),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<AuthService>().signInWithGoogle();
                            if (context.read<AuthService>().isSigningIn) {
                              return Loading();
                            }
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/image/google.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthService>().signInWithFacebook();
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/image/facebook.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
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
