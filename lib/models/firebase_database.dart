import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfor {
  Future<bool> isNewUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    bool ok = false;
    await users.doc(uid).get().then((docsnap) {
      if (docsnap.data()['userType'] == null) ok = true;
    });
    print(ok);
    return ok;
  }

  Future<DocumentSnapshot> userData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentSnapshot data = await users.doc(uid).get();
    return data;
  }
}

class ClassInfor {
  Future<bool> isNewClass(String classname) async {
    bool ok = false;
    CollectionReference classes =
        FirebaseFirestore.instance.collection('classes');
    await classes.where('className', isEqualTo: classname).get().then((value) {
      if (value.docs.length == 0) ok = true;
    });
    return ok;
  }

  Future<void> enroll(String idClass, String uid) async {
    final classes =
        FirebaseFirestore.instance.collection('classes').doc(idClass);
    await classes.get().then((snapshot) {
      List<dynamic> liststudent = [];
      int numberofstudents = 1;
      if (snapshot.data().containsKey('liststudent')) {
        liststudent = snapshot.data()['liststudent'];
        numberofstudents = snapshot.data()['numberofstudents'];
        if (!liststudent.contains(uid)) {
          liststudent.add(uid);
          numberofstudents++;
        }
        classes.update(
            {'liststudent': liststudent, 'numberofstudents': numberofstudents});
      } else {
        liststudent.add(uid);
        classes.update(
            {'liststudent': liststudent, 'numberofstudents': numberofstudents});
      }
    });
  }
}

class Notif {
  Future<void> createNotif(String title, String content, String navigation,
      String uid, DateTime datecreate) async {
    CollectionReference notifications =
        FirebaseFirestore.instance.collection('notifications');
    await notifications.add({
      'title': title,
      'content': content,
      'uid': uid,
      'navigation': navigation,
      'datecreate': datecreate,
      'status': 'unread',
    });
    return;
  }
}
