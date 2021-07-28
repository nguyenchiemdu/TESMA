import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import '../../models/CheckBoxState.dart';
import 'package:tesma/models/firebase_database.dart';

class InputClassScreen extends StatefulWidget { //ignore: must_be_immutable
  InputClassScreen(this.rendering);

  @override
  _InputClassScreen createState() {
    return _InputClassScreen();
  }

  Function rendering;
}

class _InputClassScreen extends State<InputClassScreen> {
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Map<String, dynamic> newClass = {};

  DateTime startDate;
  int numberOfStudents = 0;
  int maxStudent = 15;

  final List<CheckBoxState> dayOfWeek = [
    CheckBoxState(title: 'Monday'),
    CheckBoxState(title: 'Tuesday'),
    CheckBoxState(title: 'Wednesday'),
    CheckBoxState(title: 'Thursday'),
    CheckBoxState(title: 'Friday'),
    CheckBoxState(title: 'Saturday'),
    CheckBoxState(title: 'Sunday'),
  ];

  String valueChooseSubject;
  List listSubject = ["Math", "English", "Literature", "Physics", "Chemistry"];
  String valueChooseGrade;
  List listGrade = ["10", "11", "12"];
  String valueChooseHour;
  List listHour = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09",
    "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21",
    "22", "23"];
  String valueChooseMinute;
  List listMinute = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09",
    "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21",
    "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33",
    "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45",
    "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57",
    "58", "59"];

  String getStartDate() {
    if (startDate == null) {
      return 'Select Start Date';
    } else {
      return '${startDate.day}/${startDate.month}/${startDate.year}';
    }
  }

  Future pickStartDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: startDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => startDate = newDate);
  }

  void _showToast(String context) {
    Fluttertoast.showToast(
      msg: context,
      backgroundColor: redColor,
      textColor: whiteColor,
      gravity: ToastGravity.CENTER,
    );
  }

  Widget buildCheckbox({
    @required CheckBoxState notification,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notification.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          notification.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );

  Widget buildSingleCheckbox(CheckBoxState notification) => buildCheckbox(
        notification: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;
          });
        },
      );

  @override
  Widget build(BuildContext context) {
    Future<void> classSetup(
        String classname,
        String subject,
        String grade,
        String description,
        String startdate,
        String time,
        String location,
        String fee,
        int numberofstudents,
        int maxstudents,
        List<CheckBoxState> dayofweek) async {
      CollectionReference classes =
          FirebaseFirestore.instance.collection('classes');
      DateTime createdate = DateTime.now();
      List<bool> schedule = dayofweek.map((element) => element.value).toList();
      String hostID = FirebaseAuth.instance.currentUser.uid;
      classes.add({
        'className': classname,
        'subject': subject,
        'grade': grade,
        'time': time,
        'createDate': createdate,
        'start': startdate,
        'dayofweek': schedule,
        'location' : location,
        'fee' : fee,
        'hostID': hostID,
        'numberofstudents': numberofstudents,
        'maxstudents' : maxstudents,
      }).then((value) {
        final currentUser =
            FirebaseFirestore.instance.collection('users').doc(hostID);
        currentUser.get().then((userSnapShot) {
          List<dynamic> listClass = [];
          if (userSnapShot.data().containsKey('listClass')) {
            listClass = userSnapShot.data()['listClass'];
            listClass.add(value.id);
            currentUser.update({'listClass': listClass});
          } else {
            listClass.add(value.id);
            currentUser.update({'listClass': listClass});
          }
        });
      }).then((value) {
        newClass = {
          'className': classname,
          'subject': subject,
          'grade': grade,
          'time': time,
          'createDate': createdate,
          'start': startdate,
          'dayofweek': schedule,
          'location' : location,
          'fee' : fee,
          'hostID': hostID,
          'numberofstudents': numberofstudents,
          'maxstudents' : maxstudents,
        };
        widget.rendering(newClass);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Create class successfully"),
                actions: <Widget>[
                  Container(
                      child: Center(
                    child: FloatingActionButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ))
                ],
              );
            });
      }).onError((error, stackTrace) {
        print(error.code);
      });
      return;
    }

    return new Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.all(4 * SizeConfig.heightMultiplier),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Create class',
                            style: TextStyle(
                              color: darkPurpleColor,
                              fontSize: 40,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          height: 10 * SizeConfig.heightMultiplier,
                        ),
                      ]),
                      Container(
                        child: Text(
                          'CLASS NAME',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SegoeUI',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                        height: 5 * SizeConfig.heightMultiplier,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: classNameController,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                          child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      'SUBJECT',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI',
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 10),
                                    child: Text(
                                      'GRADE',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI',
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ]))),
                      Container(
                          padding:
                              EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                          child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: 10, right: 2),
                                    child: DropdownButton(
                                      hint: Text("Select Subject"),
                                      icon: Icon(Icons.arrow_drop_down_sharp),
                                      iconSize: 35,
                                      value: valueChooseSubject,
                                      onChanged: (newValue) {
                                        setState(() {
                                          valueChooseSubject = newValue;
                                        });
                                        },
                                      items: listSubject.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 15, right: 10),
                                      child: DropdownButton(
                                        hint: Text("Select Grade"),
                                        icon: Icon(Icons.arrow_drop_down_sharp),
                                        iconSize: 35,
                                        value: valueChooseGrade,
                                        onChanged: (newValue) {
                                          setState(() {
                                            valueChooseGrade = newValue;
                                          });
                                          },
                                        items: listGrade.map((valueItem) {
                                          return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                ),]))),
                      Row(children: [
                        Text(
                          "SCHEDULE",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: GridView.extent(
                          primary: false,
                            maxCrossAxisExtent: 170,
                          children: <Widget>[
                            Divider(),
                            ...dayOfWeek.map(buildSingleCheckbox).toList(),
                          ],
                        ),
                      ),
                      Row(children: [
                        Text(
                          "TIME",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                      Container(
                        child: Container(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: DropdownButton(
                                    hint: Text(""),
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                    iconSize: 35,
                                    value: valueChooseHour,
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueChooseHour = newValue;
                                      });
                                    },
                                    items: listHour.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ),
                                  height: 5 * SizeConfig.heightMultiplier,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 5 * SizeConfig.widthMultiplier,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: DropdownButton(
                                    hint: Text(" "),
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                    iconSize: 35,
                                    value: valueChooseMinute,
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueChooseMinute = newValue;
                                      });
                                    },
                                    items: listMinute.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ),
                                  height: 5 * SizeConfig.heightMultiplier,
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        height: 5 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                          child: Text(
                            "START DATE",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: Color(0xff000000),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () => pickStartDate(context),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 120),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10)),
                          ),
                          icon: Icon(Icons.date_range_sharp, color: Colors.blue,),
                            label: Text(
                              '$startDate',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ),
                      Container(
                        height: 5 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                        height: 5 * SizeConfig.heightMultiplier,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2),
                                child: Text(
                                  'Amount',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Text(
                                  '$numberOfStudents',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 2),
                                child: Text(
                                  'Maximum quantity',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2, right: 2),
                                child: TextField(
                                  decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 5 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                          child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'LOCATION',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  height: 3 * SizeConfig.heightMultiplier,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 31 * SizeConfig.widthMultiplier,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'FEE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  height: 3 * SizeConfig.heightMultiplier,
                                ),
                              ]))),
                      Container(
                          child: Container(
                              height: 5 * SizeConfig.heightMultiplier,
                              child: Row(children: <Widget>[
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 2, right: 50),
                                    child: TextField(
                                      controller: locationController,
                                      decoration: new InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5, right: 2),
                                    child: TextField(
                                      controller: feeController,
                                      decoration: new InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ]))),
                      Container(
                        height: 2 * SizeConfig.heightMultiplier,
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                        child: Container(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 2),
                                    child: ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrange,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'SegoeUI',
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 2),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          try {
                                            await Firebase.initializeApp();
                                            bool isNewClass = await ClassInfor()
                                                .isNewClass(classNameController
                                                    .text
                                                    .toString());
                                            if (isNewClass) {
                                              await classSetup(
                                                classNameController.text,
                                                valueChooseSubject,
                                                valueChooseGrade,
                                                descriptionController.text,
                                                startDate.toString(),
                                                valueChooseHour +
                                                    ":" +
                                                    valueChooseMinute,
                                                locationController.text,
                                                feeController.text,
                                                numberOfStudents,
                                                maxStudent,
                                                dayOfWeek,
                                              );
                                            } else
                                              _showToast(
                                                  'Class name has already existed!');
                                          } on FirebaseAuthException catch (e) {
                                            print(e.code);
                                          } catch (e) {
                                            print(e.toString());
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.pink,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'Create',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'SegoeUI',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
