import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/vocabPage.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 2;
  TextEditingController taskInputController = TextEditingController();
  List<String> todos = List.generate(0, (index) => "${index}");

  @override
  void initState() {
    super.initState();
  }

  void addTask() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text("增加新任務"),
          content: TextField(
            controller: taskInputController,
            decoration: new InputDecoration(labelText: "請輸入任務名稱"),
            keyboardType: TextInputType.text,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  todos.add(taskInputController.text);
                  taskInputController.text = '';
                });
                Navigator.of(context).pop();
              },
              child: Text("新增"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.brown[50],
      resizeToAvoidBottomInset: false,
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
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[850],
                      child: Icon(Icons.person),
                    ),
                    title: Text('Richard'),
                    subtitle: Text('LV: 0'),
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
            Container(
              height: queryData.size.height * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey[600]),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Daliy task',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.task),
                          title: Text('${todos[index]}'),
                          trailing: IconButton(
                            splashRadius: 30,
                            splashColor: Colors.blueGrey[300],
                            onPressed: () => setState(() {
                              todos.remove(todos[index]);
                            }),
                            icon: Icon(Icons.check),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.bottomRight,
                      onPressed: addTask,
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            OpenContainer(
              transitionDuration: Duration(milliseconds: 500),
              transitionType: ContainerTransitionType.fade,
              closedBuilder: (BuildContext _, VoidCallback openCotainer) {
                return Card(
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
                          icon: Icon(Icons.favorite),
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
                          ElevatedButton(
                            onPressed: null,
                            child: Text('Next'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              openBuilder: (BuildContext _, VoidCallback __) {
                return VocabPage();
              },
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
      ),
    );
  }
}
