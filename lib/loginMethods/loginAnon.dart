import 'package:firebase_auth/firebase_auth.dart';

class AnonServer {
  // login as guest
  Future<void> loginAnon() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
  }
}
