import 'package:flutter/material.dart';
import 'package:kanban/pages/myCenter.dart';
import 'package:kanban/pages/myMessage.dart';
import 'package:kanban/pages/myProject.dart';
import 'package:kanban/pages/myTask.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Widget> pageList = const [
    MyTaskPage(),
    MyMessagePage(),
    MyProjectPage(),
    MyCenterPage()
  ];

  int currentIndex = 0;

  /* _TabsState(index) {
    currentIndex = index;
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0.3,
      ),
      body: pageList[currentIndex],
      drawer: Drawer(
          child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                height: 300.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: const Alignment(-1, -1),
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 191, 64, 100),
                        radius: 45,
                        child: Text(
                          '杨',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        alignment: const Alignment(-1, -1),
                        child: Row(
                          children: <Widget>[
                            const Text(
                              '昵称123',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.border_color,
                                  size: 20,
                                  color: Color.fromRGBO(199, 199, 199, 1),
                                ))
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: const Alignment(-1, -1),
                      child: Text('id: 123'),
                    )
                  ],
                )),
            const Divider()
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions), label: '任务'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: '消息'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_rounded), label: '项目'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我'),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 28.0,
        fixedColor: Color.fromARGB(255, 0, 29, 72),
      ),
    );
  }
}
