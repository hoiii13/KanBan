import 'package:flutter/material.dart';
import 'package:kanban/pages/center/modifyPassword.dart';
import 'package:kanban/pages/login/login.dart';
import 'package:kanban/pages/myCenter.dart';
import 'package:kanban/pages/myMessage.dart';
import 'package:kanban/pages/project/myProject.dart';
import 'package:kanban/pages/tasks/myTask.dart';

import '../pages/center/components/infoHead.dart';
import '../pages/center/components/logout.dart';
import '../pages/center/components/infoMiddle.dart';
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
  final title = ["我的任务", "我的消息", "我的项目", "个人中心"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 247),
      appBar: AppBar(
        title: Text(title[currentIndex],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: pageList[currentIndex],
      drawer: _drawerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions_rounded), label: '任务'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded), label: '消息'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_rounded), label: '项目'),
          /* BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: '我'), */
        ],
        type: BottomNavigationBarType.shifting,
        iconSize: 28.0,
        unselectedItemColor: Colors.black26,
        fixedColor: Colors.black,
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
          infoHead(context),
          const Divider(color: Colors.black38),
          infoMiddle(context),
          logOut(context)
        ],
      ),
    ));
  }
}
