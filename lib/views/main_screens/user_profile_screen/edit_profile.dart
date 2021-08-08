import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:tesma/models/firebase_authen.dart';
//import 'package:provider/provider.dart';
import 'package:tesma/models/userinf.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/views/main_screens/user_profile_screen/user_profile_screen.dart';

Future<void> userUpdate(
    String highSchool, String faceBook, String phoneNumber) async {
  User currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  if (phoneNumber != '')
    users.doc(currentUser.uid).update({
      'numberPhone': phoneNumber,
    });
  if (faceBook != '') users.doc(currentUser.uid).update({'faceBook': faceBook});
  if (highSchool != '')
    users.doc(currentUser.uid).update({
      'highSchool': highSchool,
    });
}

class EditProfile extends StatefulWidget {
  final DocumentSnapshot userdata;
  //final UserInf userinfor;
  const EditProfile({Key key, this.userdata}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController highSchoolController = TextEditingController();
  final TextEditingController faceBookController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void initState() {
    super.initState();
    userinf = UserInf.fromSnapshot(widget.userdata);
  }

  UserInf userinf;
  String phoneNumber = '';
  String highSchool = '';
  String faceBook = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -5 * SizeConfig.heightMultiplier,
            right: 0 * SizeConfig.widthMultiplier,
            left: 0 * SizeConfig.widthMultiplier,
            child: Container(
                height: 40 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  color: darkPurpleColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: Container(
                    padding: EdgeInsets.only(
                        top: 10 * SizeConfig.heightMultiplier,
                        left: 10 * SizeConfig.widthMultiplier),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "EDIT PROFILE",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'SegoeUI-Black',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1 * SizeConfig.widthMultiplier,
                              )),
                        ),
                      ],
                    ))),
          ),
          //  Profile - Edit
          Positioned(
            top: 14 * SizeConfig.heightMultiplier,
            child: Container(
              height: 31.5 * SizeConfig.heightMultiplier,
              width: MediaQuery.of(context).size.width -
                  20 * SizeConfig.widthMultiplier,
              margin: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.widthMultiplier),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Container(
                    width: 20 * SizeConfig.widthMultiplier,
                    height: 11.42826 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1 * SizeConfig.widthMultiplier,
                            color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://cdns-images.dzcdn.net/images/artist/061868f886135e41428193285fc9de31/264x264.jpg'))),
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Text(
                    userinf.userName,
                    style: TextStyle(
                      fontSize: 3 * SizeConfig.textMultiplier,
                      fontFamily: 'SegoeUIB',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Text(
                    userinf.userType.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SegoeUI',
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        userinf.listClass != null
                            ? userinf.listClass.length.toString()
                            : '0',
                        style: TextStyle(
                          color: Color(0xff181a54),
                          fontSize: 25,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('Classes',
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            fontWeight: FontWeight.w900,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          //  Common information
          Positioned(
            top: 47.5 * SizeConfig.heightMultiplier,
            child: Container(
              height: 11.5 * SizeConfig.heightMultiplier,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width -
                  20 * SizeConfig.widthMultiplier,
              margin: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.widthMultiplier),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    size: 10 * SizeConfig.imageSizeMultiplier,
                  ),
                  SizedBox(
                    width: 10 * SizeConfig.widthMultiplier,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "High School",
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w900,
                          color: Color(0xff181a54),
                        ),
                      ),
                      SizedBox(
                        height: 0.25 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                        height: 2.5 * SizeConfig.heightMultiplier,
                        width: 45 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.5 * SizeConfig.widthMultiplier,
                                color: Colors.blue),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                spreadRadius: 5,
                              )
                            ]),
                        child: TextField(
                          controller: highSchoolController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  bottom: 1.75 * SizeConfig.heightMultiplier),
                              hintText: "Your high school",
                              hintStyle: TextStyle(
                                fontSize: 2 * SizeConfig.textMultiplier,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          //  HighSchool
          Positioned(
            top: 61 * SizeConfig.heightMultiplier,
            child: Container(
              height: 11.5 * SizeConfig.heightMultiplier,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width -
                  20 * SizeConfig.widthMultiplier,
              margin: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.widthMultiplier),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 10 * SizeConfig.imageSizeMultiplier,
                  ),
                  SizedBox(
                    width: 10 * SizeConfig.widthMultiplier,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Facebook",
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'SegoeUI',
                          color: Color(0xff181a54),
                        ),
                      ),
                      SizedBox(
                        height: 0.25 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                        height: 2.5 * SizeConfig.heightMultiplier,
                        width: 45 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.5 * SizeConfig.widthMultiplier,
                                color: Colors.blue),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                spreadRadius: 5,
                              )
                            ]),
                        child: TextField(
                          controller: faceBookController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  bottom: 1.75 * SizeConfig.heightMultiplier),
                              hintText: "Your facebook adress",
                              hintStyle: TextStyle(
                                fontSize: 2 * SizeConfig.textMultiplier,
                                color: Colors.grey,
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          //  Facebook
          Positioned(
            top: 74.5 * SizeConfig.heightMultiplier,
            child: Container(
              height: 11.5 * SizeConfig.heightMultiplier,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width -
                  20 * SizeConfig.widthMultiplier,
              margin: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.widthMultiplier),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone_android,
                    size: 10 * SizeConfig.imageSizeMultiplier,
                  ),
                  SizedBox(
                    width: 10 * SizeConfig.widthMultiplier,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone number",
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'SegoeUI',
                          color: Color(0xff181a54),
                        ),
                      ),
                      SizedBox(
                        height: 0.25 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                        height: 2.5 * SizeConfig.heightMultiplier,
                        width: 45 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.5 * SizeConfig.widthMultiplier,
                                color: Colors.blue),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                spreadRadius: 5,
                              )
                            ]),
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  bottom: 1.75 * SizeConfig.heightMultiplier),
                              hintText: "Your phone number",
                              hintStyle: TextStyle(
                                fontSize: 2 * SizeConfig.textMultiplier,
                                color: Colors.grey,
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          //  Phone Number
          Positioned(
            top: 90 * SizeConfig.heightMultiplier,
            child: Container(
              height: 5 * SizeConfig.heightMultiplier,
              width: MediaQuery.of(context).size.width -
                  60 * SizeConfig.widthMultiplier,
              margin: EdgeInsets.symmetric(
                  horizontal: 30 * SizeConfig.widthMultiplier),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[400],
                  padding: EdgeInsets.symmetric(
                      horizontal: 5 * SizeConfig.widthMultiplier),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  highSchool = highSchoolController.text;
                  faceBook = faceBookController.text;
                  phoneNumber = phoneNumberController.text;
                  userUpdate(highSchool, faceBook, phoneNumber);
                  Navigator.pop(context, 'updated');
                },
                child: Text(
                  "Update",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'SegoeUI',
                    letterSpacing: 1 * SizeConfig.widthMultiplier,
                  ),
                ),
              ),
            ),
          ),
          //  Update Press
        ],
      ),
    );
  }
}
