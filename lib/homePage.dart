import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 2;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: queryData.size.width * 0.4,
                    height: queryData.size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(12)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[850],
                            child: Icon(Icons.person),
                          ),
                          title: Text('Richard'),
                          subtitle: Text('LV: 0'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: queryData.size.height * 0.1,
                    width: queryData.size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.brown[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: queryData.size.width * 0.15,
                        ),
                        Text('2021/9/1'),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.people),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: queryData.size.height * 0.1,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                color: Colors.blueGrey[300],
                elevation: 10.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Vocab',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.star),
                        onPressed: null,
                      ),
                    ),
                    Text(
                      'Flutter 富拉特  (n)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: null, child: Text('Back')),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(onPressed: null, child: Text('Next')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentPage,
          selectedIconTheme: IconThemeData(color: Colors.brown[200], size: 40),
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              this._currentPage = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard),
              label: '',
              backgroundColor: Colors.brown,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: '',
              backgroundColor: Colors.brown,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              backgroundColor: Colors.brown,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: '',
              backgroundColor: Colors.brown,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: '',
              backgroundColor: Colors.brown,
            ),
          ],
        ));
  }
}
