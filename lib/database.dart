import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServer {
  final String uid;
  DatabaseServer(this.uid);

  CollectionReference user = FirebaseFirestore.instance.collection('userData');

  Future updateUser(String name, String email) async {
    return await user.doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
    });
  }
}
