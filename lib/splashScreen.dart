import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute<void>(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.brown,
        alignment: Alignment.center,
        child: Lottie.network(
            "https://assets8.lottiefiles.com/packages/lf20_9uxqqugg.json"),
      ),
    );
  }
}
