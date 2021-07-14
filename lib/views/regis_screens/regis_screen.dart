import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

const darkPurpleColor = Color(0xFF45228B);
const lightPurpleColor = Color(0xFF7243CF);
const whiteColor = Color(0xFFFFFFFF);

class MyRegisterScreen extends StatefulWidget {
  @override
  _MyRegisterScreen createState() {
    return _MyRegisterScreen();
  }
}

class _MyRegisterScreen extends State<MyRegisterScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> userSetup(String displayName, String numberPhone) async {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser.uid.toString();
      users.add({
        'userName': displayName,
        'numberPhone': numberPhone,
        'uid': uid,
      });
      return;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: darkPurpleColor,
                        fontSize: 40.0,
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 40),
                    height: 48.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: userController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your username',
                      labelText: 'Enter your username',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                      labelText: 'Enter your email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: numberPhoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your number phone',
                      labelText: 'Enter your number phone',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                      labelText: 'Enter your password',
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await Firebase.initializeApp();
                        UserCredential us = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        User updateUser = FirebaseAuth.instance.currentUser;
                        updateUser.updateProfile(
                            displayName: userController.text);
                        userSetup(
                            userController.text, numberPhoneController.text);
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                      } catch (e) {
                        print(e.toString());
                      }
                      SnackBar(
                        content: Text('Yay! Completed!'),
                      );
                    },
                    child: Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
