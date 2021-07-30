import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginMethods/emailLogin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              onPressed: () => null,
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
