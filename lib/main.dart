import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/loginMethods/emailLogin.dart';
import 'package:flutter_application_1/splashScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'loginMethods/FacebookLogin/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //email
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => null,
                  child: FaIcon(FontAwesomeIcons.envelope)),
            ),
            //facebook
            ElevatedButton(
              onPressed: () => AuthService().signInWithFacebook(),
              child: FaIcon(FontAwesomeIcons.facebookSquare),
            ),
            //Guest
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => null,
                  child: FaIcon(FontAwesomeIcons.google)),
            )
          ],
        ),
      ),
    );
  }
}
