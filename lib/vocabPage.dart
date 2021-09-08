import 'package:flutter/material.dart';

class VocabPage extends StatefulWidget {
  const VocabPage({Key? key}) : super(key: key);

  @override
  _VocabPageState createState() => _VocabPageState();
}

class _VocabPageState extends State<VocabPage>
    with SingleTickerProviderStateMixin {
  bool isFav = false;
  late AnimationController _controller;
  late Animation colorAnimation;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    _controller.addListener(() {});

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.blueGrey[300],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    trailing: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, _) {
                        return IconButton(
                          onPressed: () {
                            isFav
                                ? _controller.reverse()
                                : _controller.forward();
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: colorAnimation.value as Color,
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'Flutter 富拉特',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.1,
                  )
                ],
              ),
            ),
            Container(
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
