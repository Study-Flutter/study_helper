import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailServer {
  String signUpHint = '';

  // register with email
  Future<String> emailSignUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      print('Hi there');
      return uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        signUpHint = 'The password is too weak';
      } else if (e.code == 'email-already-in-use') {
        signUpHint = 'The email account is already exist';
      }
      return signUpHint;
    }
  }

  // Send OPT to verify email
  void sendOTP(String email) async {
    EmailAuth.sessionName = 'Study-Helper';
    var res = await EmailAuth.sendOtp(receiverMail: email);
    if (res) {
      print('Send successfully!');
    } else {
      print('Failed to send OTP');
    }
  }

  // Check the OTP code
  bool verifyOTP(String email, String userOTP) {
    var res = EmailAuth.validate(receiverMail: email, userOTP: userOTP);
    return res;
  }

  // Sign in with email
  Future<String> emailSignIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      return uid;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return '';
    }
  }
}
