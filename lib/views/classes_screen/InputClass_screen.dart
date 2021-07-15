import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tesma/views/classes_screen/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';


class InputClassScreen extends StatefulWidget{
  InputClassScreen(this.rendering);
  @override
  _InputClassScreen createState() {
    return _InputClassScreen();
  }
  Function rendering;
}

class _InputClassScreen extends State<InputClassScreen> {

  final TextEditingController classIDController = TextEditingController();
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController userIDController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateCreateController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController participantsController = TextEditingController();
  final TextEditingController feeController = TextEditingController();

  DateTime startDate;
  DateTime endDate;
  Map<String,dynamic> newClass = {};
  String getStartDate() {
    if (startDate == null) {
      return 'Select Start Date';
    } else {
      //return DateFormat('MM/dd/yyyy').format(date);
      return '${startDate.day}/${startDate.month}/${startDate.year}';
    }
  }
  String getEndDate() {
    if (endDate == null) {
      return 'Select End Date';
    } else {
      //return DateFormat('MM/dd/yyyy').format(date);
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

  @override
  Widget build(BuildContext context) {
    Future<void> classSetup( String classname, String subject, String description, String startdate, String enddate) async {
      CollectionReference classes =
      FirebaseFirestore.instance.collection('classes');
      DateTime createdate = DateTime.now();
      classes.add({
        //'classID': classid,
        'className': classname,
        'createDate': createdate,
        'start' : startdate,
        'end' : enddate,
      }).then((value)  {
        newClass = {
          //'classID': classid,
          'className': classname,
          'createDate': createdate,
          'start' : startdate,
          'end' : enddate,
        };
        widget.rendering(newClass);
        showDialog(
            context: context,
            builder: (context){
              return Dialog(
                child: Container(
                  child: FloatingActionButton(
                    child: Text("OK"),
                    onPressed: (){Navigator.pop(context);Navigator.pop(context);},
                  ),
                ),
              );
            });
      }).onError((error, stackTrace){ print(error.code);});
      return;
    }
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Row(children: [
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
                decoration: new InputDecoration(labelText: "Enter your className"),
                keyboardType: TextInputType.text,
              ),
              Spacer(),
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
                decoration: new InputDecoration(labelText: "Enter your subject"),
                keyboardType: TextInputType.text,
              ),
              Spacer(),
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
                decoration: new InputDecoration(labelText: "Enter your description"),
                keyboardType: TextInputType.text,
              ),
              Spacer(),
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
              ButtonHeaderWidget(title: 'Start date', text: getStartDate(), onClicked: () => pickStartDate(context)),
              Spacer(),
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
              ButtonHeaderWidget(title: 'End date', text: getEndDate(), onClicked: () => pickEndDate(context)),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () async{
                    try {
                      await Firebase.initializeApp();
                      await classSetup(
                          classNameController.text, subjectController.text, descriptionController.text, getStartDate(), getEndDate());
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: const Text('Awesome Snackbar!'),
                      //   ),
                      //
                      // );

                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                    } catch (e) {
                      print(e.toString());
                    }

                  },
                ),
              )
            ],
          )),
    );
  }
}
