import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/views/classes_screen/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:tesma/views/regis_screens/select_user_type.dart';
import '../../models/CheckBoxState.dart';
import 'package:tesma/models/firebase_database.dart';

class InputClassScreen extends StatefulWidget {  //ignore: must_be_immutable
  InputClassScreen(this.rendering);

  @override
  _InputClassScreen createState() {
    return _InputClassScreen();
  }

  Function rendering;
}

class _InputClassScreen extends State<InputClassScreen> {
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DateTime startDate;
  DateTime endDate;
  Map<String, dynamic> newClass = {};

  final List<CheckBoxState> dayOfWeek = [
    CheckBoxState(title: 'Monday'),
    CheckBoxState(title: 'Tuesday'),
    CheckBoxState(title: 'Wednesday'),
    CheckBoxState(title: 'Thursday'),
    CheckBoxState(title: 'Friday'),
    CheckBoxState(title: 'Saturday'),
    CheckBoxState(title: 'Sunday'),
  ];

  String getStartDate() {
    if (startDate == null) {
      return 'Select Start Date';
    } else {
      return '${startDate.day}/${startDate.month}/${startDate.year}';
    }
  }

  String getEndDate() {
    if (endDate == null) {
      return 'Select End Date';
    } else {
      return '${endDate.day}/${endDate.month}/${endDate.year}';
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

  Future pickEndDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: endDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => endDate = newDate);
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
        String description,
        String startdate,
        String enddate,
        List<CheckBoxState> dayofweek) async {
      CollectionReference classes =
          FirebaseFirestore.instance.collection('classes');
      DateTime createdate = DateTime.now();
      List<bool> schedule = dayofweek.map((element) => element.value).toList();
      String hostID = FirebaseAuth.instance.currentUser.uid;
      classes.add({
        'className': classname,
        'createDate': createdate,
        'start': startdate,
        'end': enddate,
        'Dayofweek': schedule,
        'hostID': hostID,
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
          'createDate': createdate,
          'start': startdate,
          'end': enddate,
          'Dayofweek': schedule,
          'hostID': hostID,
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.all(4 * SizeConfig.heightMultiplier),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          height: 11.2 * SizeConfig.heightMultiplier,
                        ),
                      ]),
                      new TextField(
                        controller: classNameController,
                        decoration: new InputDecoration(
                            labelText: "Enter your className"),
                        keyboardType: TextInputType.text,
                      ),
                      new TextField(
                        controller: subjectController,
                        decoration: new InputDecoration(
                            labelText: "Enter your subject"),
                        keyboardType: TextInputType.text,
                      ),
                      new TextField(
                        controller: descriptionController,
                        decoration: new InputDecoration(
                            labelText: "Enter your description"),
                        keyboardType: TextInputType.text,
                      ),
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
                      Column(
                        children: [
                          Divider(),
                          ...dayOfWeek.map(buildSingleCheckbox).toList(),
                        ],
                      ),
                      ButtonHeaderWidget(
                          title: 'Start date',
                          text: getStartDate(),
                          onClicked: () => pickStartDate(context)),
                      ButtonHeaderWidget(
                          title: 'End date',
                          text: getEndDate(),
                          onClicked: () => pickEndDate(context)),
                      Container(
                        height: 5 * SizeConfig.heightMultiplier,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await Firebase.initializeApp();
                            bool isNewClass = await ClassInfor().isNewClass(
                                classNameController.text.toString());
                            if (isNewClass) {
                              await classSetup(
                                classNameController.text,
                                subjectController.text,
                                descriptionController.text,
                                getStartDate(),
                                getEndDate(),
                                dayOfWeek,
                              );
                            } else
                              _showToast('Class name has already existed!');
                          } on FirebaseAuthException catch (e) {
                            print(e.code);
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                getbackgroudcolor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                        child: Container(
                          width: 50 * SizeConfig.widthMultiplier,
                          height: 6 * SizeConfig.heightMultiplier,
                          child: Center(
                            child: Text(
                              'Create',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
