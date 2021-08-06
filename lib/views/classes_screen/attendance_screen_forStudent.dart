import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/constants/color.dart';
import 'package:quiver/time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tesma/models/classinf.dart';

final now = new DateTime.now();
List<String> listCalendar = [];

class AttendanceScreenForStudent extends StatefulWidget {
  final ClassInf classinf;
  final String currentUserID;
  const AttendanceScreenForStudent(
      {Key key, @required this.classinf, this.currentUserID})
      : super(key: key);
  @override
  _AttendanceScreenForStudentState createState() =>
      _AttendanceScreenForStudentState();
}

class _AttendanceScreenForStudentState
    extends State<AttendanceScreenForStudent> {
  int currentYear = now.year;
  int currentMonth = now.month;
  int firstDayOfMonth = DateTime.utc(now.year, now.month, 1).weekday;
  String requestedUserName = 'loading...';
  List attendenceList;
  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<String> dayOfWeek = [
    "Mo",
    "Tu",
    "We",
    "Th",
    "Fr",
    "Sa",
    "Su",
  ];

  @override
  void initState() {
    super.initState();
    getUserInfor();
  }

  getUserInfor() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.currentUserID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          requestedUserName = documentSnapshot.data()['userName'];
          print('get userName successfully');
        });
      }
    });
    await FirebaseFirestore.instance
        .collection('classes')
        .doc(widget.classinf.classid)
        .collection('schedule')
        .doc(widget.currentUserID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          attendenceList = documentSnapshot.data()['attendance'];
        });
      }
    });
  }

  Container currentCalendar() {
    listCalendar.clear();
    listCalendar.addAll(dayOfWeek);
    listCalendar.addAll(List.generate(firstDayOfMonth - 1, (index) => ""));
    int indexOfTheStartDay = 7 + firstDayOfMonth - 2;
    String tmpString;
    Map attend = Map<int, bool>();
    if (attendenceList != null) {
      for (int i = 0; i < attendenceList.length; i++) {
        tmpString = attendenceList[i].toString();
        if (currentMonth == int.parse(tmpString.substring(3, 5)) &&
            currentYear == int.parse(tmpString.substring(6, 10))) {
          attend[int.parse(tmpString.substring(0, 2)) + indexOfTheStartDay] =
              true;
        }
      }
    }
    listCalendar.addAll(List.generate(daysInMonth(currentYear, currentMonth),
        (index) => (index + 1).toString()));

    bool checkInRangeOfLearningDays(int aDay) {
      if (aDay <= 0) return true;
      var startDate = new DateTime.utc(
          int.parse(widget.classinf.startdate.substring(0, 4)),
          int.parse(widget.classinf.startdate.substring(5, 7)),
          int.parse(widget.classinf.startdate.substring(8, 10)));
      var considerDate = new DateTime.utc(currentYear, currentMonth, aDay);
      return considerDate.compareTo(startDate) >= 0 &&
              considerDate.compareTo(now) < 0
          ? false
          : true;
    }

    return Container(
      height: 26.5 * SizeConfig.heightMultiplier,
      width: 75 * SizeConfig.widthMultiplier,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 0.5 * SizeConfig.heightMultiplier,
        crossAxisCount: 7,
        childAspectRatio: (75 * SizeConfig.widthMultiplier / 7) /
            (24 * SizeConfig.heightMultiplier / 6),
        children: List.generate(
          listCalendar.length,
          (index) => Container(
            child: Center(
              child: Text(
                listCalendar[index],
                style: TextStyle(
                  color: Color(0xff7243cf),
                  fontFamily: 'SegoeUI',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: attend.containsKey(index)
                  ? lightGreenColor
                  : indexOfTheStartDay >= index ||
                          widget.classinf.schedule[index % 7] == false ||
                          checkInRangeOfLearningDays(
                                  index - indexOfTheStartDay) ==
                              true
                      ? whiteColor
                      : mediumPink,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body: Container(
            height: 61.1 * SizeConfig.heightMultiplier,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 3 * SizeConfig.heightMultiplier,
                  ),
                  height: 6 * SizeConfig.heightMultiplier,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 2 * SizeConfig.widthMultiplier,
                          right: 2 * SizeConfig.widthMultiplier,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '00',
                              style: TextStyle(
                                color: Color(0xffef4874),
                                fontSize: 16,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Absence',
                              style: TextStyle(
                                color: Color(0xff181a54),
                                fontSize: 8,
                                fontFamily: 'SegoeUI',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 2 * SizeConfig.widthMultiplier,
                          right: 2 * SizeConfig.widthMultiplier,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          requestedUserName,
                          style: TextStyle(
                            color: Color(0xff181a54),
                            fontFamily: 'SegoeUIB',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0.25, 1.75),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 3 * SizeConfig.heightMultiplier,
                    right: 9 * SizeConfig.widthMultiplier,
                    left: 9 * SizeConfig.widthMultiplier,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.5 * SizeConfig.widthMultiplier,
                  ),
                  height: 36 * SizeConfig.heightMultiplier,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (currentMonth == 1) {
                                    currentMonth = 12;
                                    currentYear--;
                                  } else {
                                    currentMonth--;
                                  }
                                  firstDayOfMonth =
                                      DateTime.utc(currentYear, currentMonth, 1)
                                          .weekday;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_left,
                                color: Color(0xff45228b),
                                size: 40,
                              ),
                            ),
                            Text(
                              listOfMonths[currentMonth - 1] +
                                  ' ' +
                                  currentYear.toString(),
                              style: TextStyle(
                                color: Color(0xff45228b),
                                fontSize: 24,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (currentMonth == 12) {
                                    currentMonth = 1;
                                    currentYear++;
                                  } else {
                                    currentMonth++;
                                  }
                                  firstDayOfMonth =
                                      DateTime.utc(currentYear, currentMonth, 1)
                                          .weekday;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_right,
                                color: Color(0xff45228b),
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      currentCalendar(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xff7243cf),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5 * SizeConfig.heightMultiplier,
                  ),
                  height: 4.1 * SizeConfig.heightMultiplier,
                  width: 35 * SizeConfig.widthMultiplier,
                  child: InkWell(
                    child: Container(
                      height: 4.1 * SizeConfig.heightMultiplier,
                      width: 35 * SizeConfig.widthMultiplier,
                      alignment: Alignment.center,
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xfff74b46),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
