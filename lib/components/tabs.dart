import 'package:flutter/material.dart';
import 'package:kanban/pages/center/modifyPassword.dart';
import 'package:kanban/pages/login/login.dart';
import 'package:kanban/pages/myCenter.dart';
import 'package:kanban/pages/myMessage.dart';
import 'package:kanban/pages/myProject.dart';
import 'package:kanban/pages/myTask.dart';

import '../pages/center/editInfo.dart';

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

  final info = [
    {"icon": 'Mail_Outline', "name": "123456@qq.com", "tail": "Chevron_Right"},
    {"icon": 'Https', "name": "修改密码", "tail": "Chevron_Right"},
    {"icon": 'Assignment_Ind', "name": "角色:", "tail": "用户"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0.3,
      ),
      body: pageList[currentIndex],
      drawer: _drawerWidget(),
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
        fixedColor: const Color.fromARGB(255, 0, 29, 72),
      ),
    );
  }

  Widget _drawerWidget() {
    return Drawer(
        child: MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
              height: 270.0,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: const Alignment(-1, -1),
                    child: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 191, 64, 100),
                      radius: 40,
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
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const EditInfoPage()));
                              },
                              icon: const Icon(
                                Icons.border_color,
                                size: 16,
                                color: Colors.black,
                              ))
                        ],
                      )),
                  Container(
                    alignment: const Alignment(-1, -1),
                    child: const Text('id: 123',
                        style: TextStyle(
                            color: Color.fromARGB(255, 158, 157, 154))),
                  )
                ],
              )),
          const Divider(color: Colors.black38),
          _buildInfo(),
          logOut()
        ],
      ),
    ));
  }

  Widget _buildInfo() {
    return Column(
      children: [
        ListTile(
            leading: const Icon(
              Icons.mail_outline,
              color: Colors.black,
            ),
            title: const Text(
              '123456789@qq.com',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const EditInfoPage()));
                },
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ))),
        ListTile(
            leading: const Icon(
              Icons.https_outlined,
              color: Colors.black,
            ),
            title: const Text(
              '修改密码',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ModifyPasswordPage()));
                },
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ))),
        ListTile(
            leading: const Icon(
              Icons.assignment_ind_outlined,
              color: Colors.black,
            ),
            title: const Text(
              '角色：',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Container(
              transform: Matrix4.translationValues(-20, 0, 0),
              child: const Text(
                '用户',
                style: TextStyle(fontSize: 15),
              ),
            ))
      ],
    );
  }

  Widget logOut() {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(),
                Container(
                  padding: const EdgeInsets.only(right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const LoginPage()));
                        },
                        icon: const Icon(Icons.login),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const LoginPage()));
                        },
                        child: const Text(
                          '退出',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
