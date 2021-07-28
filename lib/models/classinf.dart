import 'package:cloud_firestore/cloud_firestore.dart';

class ClassInf {
  String classname;
  String subject;
  String description;
  String startdate;
  String enddate;
  List<bool> schedule;
  DateTime createdate;
  String hostID;

  ClassInf(this.classname, this.subject, this.description, this.startdate,
      this.enddate, this.schedule, this.createdate, this.hostID);

  ClassInf.fromSnapshot(DocumentSnapshot snapshot)
      : classname = snapshot.data()['classname'],
        subject = snapshot.data()['subject'],
        description = snapshot.data()['description'],
        startdate = snapshot.data()['startdate'],
        enddate = snapshot.data()['enddate'],
        schedule = snapshot.data()['schedule'],
        createdate = snapshot.data()['createdate'],
        hostID = snapshot.data()['hostID'];
}
