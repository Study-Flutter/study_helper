import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/loginMethods/emailLogin.dart';
import 'package:flutter_application_1/loginPage.dart';
import 'package:lottie/lottie.dart';

class EmailSignUpPage extends StatefulWidget {
  const EmailSignUpPage({Key? key}) : super(key: key);

  @override
  _EmailSignUpPageState createState() => _EmailSignUpPageState();
}

class _EmailSignUpPageState extends State<EmailSignUpPage> {
  int _currentStep = 0;
  bool _isVerified = false;
  bool _isVisible = false;
  String errorCode = '';
  String uid = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
  }

  Future<void> emailSignUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      uid = userCredential.user!.uid;
      DatabaseServer(uid).updateUser(nameController.text, emailController.text);
      accountReady();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorCode = 'The password is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorCode = 'The email account is already exist';
      }
      setState(() {});
    }
  }

  void accountReady() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Lottie.asset('asset/accountReady.json'),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.brown),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => LoginPage(),
                ),
              ),
              child: Text('Finish!'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: queryData.size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.brown,
              ),
              child: Lottie.asset('asset/startUp.json'),
            ),
            Expanded(
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.brown[300],
                  accentColor: Colors.brown[300],
                  primarySwatch: Colors.brown,
                ),
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => setState(() {
                    _currentStep = step;
                  }),
                  onStepContinue: _currentStep < 2
                      ? () => setState(() {
                            _currentStep += 1;
                          })
                      : () {
                          emailSignUp(
                              emailController.text, passwordController.text);
                        },
                  onStepCancel: _currentStep > 0
                      ? () => setState(() {
                            _currentStep -= 1;
                          })
                      : null,
                  controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text('NEXT'),
                              onPressed: onStepContinue,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              child: Text('Back'),
                              onPressed: onStepCancel,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  steps: [
                    Step(
                      title: Text('Email'),
                      content: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                            ),
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              suffix: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.brown[200],
                                  ),
                                ),
                                child: Text('Send OTP'),
                                onPressed: () =>
                                    EmailServer().sendOTP(emailController.text),
                              ),
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: Text('OTP verification'),
                      content: Column(
                        children: [
                          Text('The OTP message had sent to your email'),
                          TextField(
                            controller: otpController,
                            decoration: InputDecoration(
                              labelText: 'OTP',
                              suffix: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.brown[200],
                                  ),
                                ),
                                child: Text('Verified'),
                                onPressed: () {
                                  _isVerified = EmailServer().verifyOTP(
                                      emailController.text, otpController.text);
                                  setState(() {});
                                },
                              ),
                              helperText: _isVerified ? 'Success' : 'Wrong OTP',
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: Text('Profile'),
                      content: Column(
                        children: [
                          ListTile(
                            title: Text('Name: ${nameController.text}'),
                          ),
                          ListTile(
                            title: Text('Email: ${emailController.text}'),
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'password',
                              suffix: IconButton(
                                onPressed: () => setState(() {
                                  _isVisible = !_isVisible;
                                }),
                                icon: Icon(
                                  _isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              errorText: errorCode == '' ? null : errorCode,
                            ),
                            obscureText: !_isVisible,
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
