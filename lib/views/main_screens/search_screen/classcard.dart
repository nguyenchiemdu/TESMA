import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/classinf.dart';

Widget classCard(BuildContext context, DocumentSnapshot document) {
  Color getbackgroudcolor(Set<MaterialState> states) {
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

  final classinf = ClassInf.fromSnapshot(document);

  //List listSubject = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  //String scheduleText = "";
  //String feeText;
  String startdateText;
  String studentsText;

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
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getbackgroudcolor),
                  ),
                  onPressed: () {
                    print("press here");
                  },
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
