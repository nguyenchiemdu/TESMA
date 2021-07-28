import 'package:cloud_firestore/cloud_firestore.dart';

class ClassInf {
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

  ClassInf(this.classname, this.subject, this.description, this.startdate,
      this.enddate, this.schedule, this.createdate, this.hostID);

  ClassInf.fromSnapshot(DocumentSnapshot snapshot)
      : classname = snapshot.data()['className'],
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
        hostID = snapshot.data()['hostID'];
}
