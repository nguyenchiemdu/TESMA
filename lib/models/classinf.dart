import 'package:cloud_firestore/cloud_firestore.dart';

class ClassInf {
  String classid;
  String classname;
  String subject;
  String description;
  String startdate;
  String enddate;
  List<dynamic> schedule;
  DateTime createdate;
  String hostID;
  int numberofstudents;
  int maxstudents;
  String time;
  String fee;
  String grade;

  ClassInf(this.classname, this.subject, this.description, this.startdate,
      this.enddate, this.schedule, this.createdate, this.hostID);

  ClassInf.fromSnapshot(DocumentSnapshot snapshot)
      : classid = snapshot.id,
        classname = snapshot.data()['className'],
        subject = snapshot.data()['subject'],
        description = snapshot.data()['description'],
        startdate = snapshot.data()['start'],
        enddate = snapshot.data()['enddate'],
        schedule = snapshot.data()['dayofweek'],
        createdate = snapshot.data()['createdate'],
        numberofstudents = snapshot.data()['numberofstudents'],
        maxstudents = snapshot.data()['maxstudents'],
        time = snapshot.data()['time'],
        fee = snapshot.data()['fee'],
        grade = snapshot.data()['grade'],
        hostID = snapshot.data()['hostID'];
}
