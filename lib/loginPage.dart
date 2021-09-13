import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/CreateAccounts/emailSignUp.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/loginMethods/emailLogin.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLogin = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: queryData.size.height * 0.4,
              width: queryData.size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.brown,
              ),
              child: Lottie.asset('asset/loginPage.json'),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  (emailController.text == '' || passwordController.text == '')
                      ? Colors.brown[200]
                      : Colors.brown,
                ),
              ),
              onPressed: () {
                var uid = EmailServer()
                    .emailSignIn(emailController.text, passwordController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => HomePage(
                      uid: uid.toString(),
                    ),
                  ),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: queryData.size.height * 0.16,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => EmailSignUpPage(),
                ),
              ),
              child: Text(
                'Not a member yet?',
                style: TextStyle(color: Colors.brown[200]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
