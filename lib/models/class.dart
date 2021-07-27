import 'package:cloud_firestore/cloud_firestore.dart';

class Class {
  String classname;
  String subject;
  String description;
  String startdate;
  String enddate;
  List<bool> schedule;
  DateTime createdate;
  String hostID;

  Class(this.classname, this.subject, this.description, this.startdate,
      this.enddate, this.schedule, this.createdate, this.hostID);

  Class.fromSnapshot(DocumentSnapshot snapshot)
      : classname = snapshot['classname'],
        subject = snapshot['subject'],
        description = snapshot['description'],
        startdate = snapshot['startdate'],
        enddate = snapshot['enddate'],
        schedule = snapshot['schedule'],
        createdate = snapshot['createdate'],
        hostID = snapshot['hostID'];
}
