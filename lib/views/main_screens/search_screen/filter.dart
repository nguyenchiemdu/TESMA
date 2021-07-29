import 'package:flutter/material.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/CheckBoxState.dart';

class Filter extends StatefulWidget {
  Filter({
    Key key,
    @required this.grade,
    @required this.subject,
    @required this.status,
  }) : super(key: key);

  List<CheckBoxState> grade;
  List<CheckBoxState> subject;
  List<CheckBoxState> status;

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
                  ...widget.grade.map(buildSingleCheckbox).toList(),
                  Text("Subject"),
                  ...widget.subject.map(buildSingleCheckbox).toList(),
                  Text("Status"),
                  ...widget.status.map(buildSingleCheckbox).toList(),
                  ElevatedButton(
                    onPressed: () {
                      //ClassInfor().searchClass();
                      Navigator.pop(context, "Filter Successful");
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
