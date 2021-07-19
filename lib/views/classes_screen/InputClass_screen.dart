import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/views/classes_screen/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import '../../models/CheckBoxState.dart';
import 'package:tesma/models/firebase_database.dart';

class InputClassScreen extends StatefulWidget {
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
  final TextEditingController dateCreateController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController participantsController = TextEditingController();

  DateTime startDate;
  DateTime endDate;
  Map<String, dynamic> newClass = {};
  String typeUser = '';

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
    Future<void> classsetup2(DocumentReference value2) async {
      // fix teen
      String adminid = FirebaseAuth.instance.currentUser.uid;
      final currentUser = FirebaseFirestore.instance.collection('users');
      await currentUser.doc(adminid).get().then((userSnapShot) {
        print(userSnapShot.data()['listClass'] != null);
        if (userSnapShot.data()['listClass'] != null) {
          List<dynamic> listClass = userSnapShot.data()['listClass'];
          listClass.add(value2.id);
          currentUser.doc(adminid).update({'listClass': listClass});
        } else {
          List<dynamic> listClass;
          listClass.add(value2.id);
          currentUser.doc(adminid).update({'listClass': listClass});
        }
      });
    }

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
      List<bool> day = dayofweek.map((element) => element.value).toList();
      String adminid = FirebaseAuth.instance.currentUser.uid;
      classes.add({
        'className': classname,
        'createDate': createdate,
        'start': startdate,
        'end': enddate,
        'Dayofweek': day,
        'adminID': adminid,
      }).then((value) {
        classsetup2(value);
        newClass = {
          'className': classname,
          'createDate': createdate,
          'start': startdate,
          'end': enddate,
          'Dayofweek': day,
          'adminID': adminid,
        };
        widget.rendering(newClass);
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                //child: Container(
                child: new Column(
                  children: <Widget>[
                    Text("Create class successfully"),
                    FloatingActionButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  // ),
                ),
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
                  padding: const EdgeInsets.all(40.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(children: [
                        Text(
                          "Class name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                      new TextField(
                        controller: classNameController,
                        decoration: new InputDecoration(
                            labelText: "Enter your className"),
                        keyboardType: TextInputType.text,
                      ),
                      Row(children: [
                        Text(
                          "Subject",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                      new TextField(
                        controller: subjectController,
                        decoration: new InputDecoration(
                            labelText: "Enter your subject"),
                        keyboardType: TextInputType.text,
                      ),
                      Row(children: [
                        Text(
                          "Description",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                      new TextField(
                        controller: descriptionController,
                        decoration: new InputDecoration(
                            labelText: "Enter your description"),
                        keyboardType: TextInputType.text,
                      ),
                      Row(children: [
                        Text(
                          "Select Schedule",
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
                      Row(children: [
                        Text(
                          "Start date",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                      ButtonHeaderWidget(
                          title: 'Start date',
                          text: getStartDate(),
                          onClicked: () => pickStartDate(context)),
                      Row(children: [
                        Text(
                          "End date",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SegoeUI',
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                      ButtonHeaderWidget(
                          title: 'End date',
                          text: getEndDate(),
                          onClicked: () => pickEndDate(context)),
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
                    ],
                  ))),
        ],
      ),
    );
  }
}
