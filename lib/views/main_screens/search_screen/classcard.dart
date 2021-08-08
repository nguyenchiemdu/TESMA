import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/classinf.dart';
import 'package:tesma/models/firebase_database.dart';
import 'package:tesma/models/userinf.dart';

// ignore: must_be_immutable
class ClassCard extends StatefulWidget {
  DocumentSnapshot documentclass;
  DocumentSnapshot documentuser;
  ClassCard({
    Key key,
    @required this.documentclass,
    @required this.documentuser,
  }) : super(key: key);
  @override
  _ClassCardState createState() => new _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  bool _isButtonDisabled = true;
  String studentsText;

  Color backgroudcolorenable(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return canary;
    }
    return canary;
  }

  Color backgroudcolordisabled(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return greyColor;
    }
    return greyColor;
  }

  @override
  void initState() {
    super.initState();
    document = widget.documentclass;
    classinf = ClassInf.fromSnapshot(document);
    document = widget.documentuser;
    userinf = UserInf.fromSnapshot(document);
    setup();
  }

  String uid = FirebaseAuth.instance.currentUser.uid;
  ClassInf classinf;
  UserInf userinf;
  DocumentSnapshot document;
  String startdateText;

  getUserData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    bool ok = false;
    //print(classinf.classid);
    await users.doc(uid).get().then((docsnap) {
      if (docsnap.data()['listClass'] == null) {
        ok = true;
        setState(() {
          _isButtonDisabled = true;
        });
      } else {
        if (!docsnap.data()['listClass'].contains(classinf.classid)) {
          ok = true;
          setState(() {
            _isButtonDisabled = true;
          });
        }
      }
    });
    if (!ok)
      setState(() {
        _isButtonDisabled = false;
      });
    return ok;
  }

  void setup() {
    // Setup scheduleText ---------------------------
    // for (var i = 0; i < 7; i++) {
    //   if (classinf.schedule[i] == true)
    //     scheduleText += (scheduleText == "" ? "" : ".") + listSubject[i];
    // }
    // scheduleText += " - " + classinf.time;

    // // Setup feeText -----------------------------
    // feeText = classinf.fee + "VND/Month";

    // Setup startdateText -----------------------------
    startdateText = "Start " + classinf.startdate;

    // Setup studentsText -----------------------------
    studentsText = " " +
        classinf.numberofstudents.toString() +
        "/" +
        classinf.maxstudents.toString();
  }

  Widget classCard(BuildContext context) {
    //List listSubject = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    //String scheduleText = "";
    //String feeText;

    bool enrollbtn() {
      //print(_isButtonDisabled);
      if (!_isButtonDisabled) return false;
      getUserData();
      if (uid == classinf.hostID) return false;
      if (classinf.numberofstudents == classinf.maxstudents) return false;
      if (classinf.liststudent.contains(uid)) return false;
      return true;
    }

    void _enrollfucn() {
      print(_isButtonDisabled);
      try {
        ClassInfor().enroll(classinf.classid, uid);
        Notif().createNotif(
            'You have successfully enrolled in class: ' + classinf.classname,
            'You have successfully enrolled in class: ' + classinf.classname,
            'class',
            uid,
            DateTime.now());
        setState(() {
          _isButtonDisabled = false;
          classinf.numberofstudents++;
          print(classinf.numberofstudents);
          studentsText = " " +
              classinf.numberofstudents.toString() +
              "/" +
              classinf.maxstudents.toString();
        });
      } catch (error) {
        print(error.toString());
      }
    }

    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: new DecorationImage(
                image: AssetImage(
                  'images/montoan.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            height: 10.5 * SizeConfig.heightMultiplier,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: 5.5 * SizeConfig.widthMultiplier,
                      right: 5.5 * SizeConfig.widthMultiplier,
                      top: 2.5 * SizeConfig.widthMultiplier),
                  child: Text(
                    classinf.classname,
                    style: TextStyle(
                      color: royalBlueColor,
                      fontSize: 24,
                      fontFamily: 'SegoeUIB',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 5.5 * SizeConfig.widthMultiplier,
                    right: 5.5 * SizeConfig.widthMultiplier,
                    bottom: 1 * SizeConfig.widthMultiplier,
                    top: 1 * SizeConfig.widthMultiplier,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Created by ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'SegoeUI',
                        ),
                      ),
                      Text(
                        classinf.teachername,
                        style: TextStyle(
                          color: mediumPink,
                          fontSize: 12,
                          fontFamily: 'SegoeUI',
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(
                //     left: 5.5 * SizeConfig.widthMultiplier,
                //     right: 5.5 * SizeConfig.widthMultiplier,
                //     bottom: 1 * SizeConfig.widthMultiplier,
                //   ),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     scheduleText,
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 12,
                //       fontFamily: 'SegoeUI',
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(
                //     left: 5.5 * SizeConfig.widthMultiplier,
                //     right: 5.5 * SizeConfig.widthMultiplier,
                //     bottom: 1 * SizeConfig.widthMultiplier,
                //   ),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     feeText,
                //     style: TextStyle(
                //       color: mediumPink,
                //       fontSize: 12,
                //       fontFamily: 'SegoeUI',
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 1.5 * SizeConfig.widthMultiplier,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 5.5 * SizeConfig.widthMultiplier,
                          right: 5.5 * SizeConfig.widthMultiplier,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          startdateText,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'SegoeUI',
                          ),
                        ),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.supervised_user_circle),
                          Text(
                            studentsText,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'SegoeUI',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                if (userinf.userType == "student")
                  Container(
                    alignment: Alignment.topLeft,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.fromLTRB(
                        5.5 * SizeConfig.widthMultiplier, 0, 0, 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            enrollbtn()
                                ? backgroudcolorenable
                                : backgroudcolordisabled),
                      ),
                      onPressed: enrollbtn() ? _enrollfucn : null,
                      child: Text(
                        "Enroll",
                        style: TextStyle(
                          color: royalBlueColor,
                          fontSize: 12,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      //height: 25 * SizeConfig.heightMultiplier,
      //width: 77.2 * SizeConfig.widthMultiplier,
      margin: EdgeInsets.only(
        bottom: 1.5 * SizeConfig.heightMultiplier,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return classCard(context);
  }
}
