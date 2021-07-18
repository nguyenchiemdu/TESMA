import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfo {
  Future<bool> isNewUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    bool ok = false;
    users.doc(uid).get().then((docsnap) {
      if (docsnap == null) ok = true;
    });
    return ok;
  }
}
