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
}
class ClassInfor{
  Future<bool> isNewClass(String classname) async{
    bool ok = false;
    CollectionReference classes = FirebaseFirestore.instance.collection('classes');
    await classes.where('className',isEqualTo: classname).get().then((value){
      if (value.docs.length == 0) ok = true;
    });
    return ok;

  }
}
