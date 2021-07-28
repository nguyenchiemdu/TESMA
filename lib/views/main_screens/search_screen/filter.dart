import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/CheckBoxState.dart';
import 'package:tesma/models/firebase_database.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
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

  final List<CheckBoxState> grade = [
    CheckBoxState(title: '10'),
    CheckBoxState(title: '11'),
    CheckBoxState(title: '12'),
  ];

  final List<CheckBoxState> subject = [
    CheckBoxState(title: 'Math'),
    CheckBoxState(title: 'English'),
    CheckBoxState(title: 'Physics'),
    CheckBoxState(title: 'Chemistry'),
    CheckBoxState(title: 'Literature'),
  ];

  final List<CheckBoxState> status = [
    CheckBoxState(title: 'Not start yet'),
    CheckBoxState(title: 'Already started'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text("Grade"),
                  ...grade.map(buildSingleCheckbox).toList(),
                  Text("Subject"),
                  ...subject.map(buildSingleCheckbox).toList(),
                  Text("Status"),
                  ...status.map(buildSingleCheckbox).toList(),
                  ElevatedButton(
                    onPressed: () {
                      ClassInfor().searchClass();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Apply',
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
              ),
            ),
          ),
        );
      });
    });
  }
}
