import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kanban/components/const.dart';

class TaskDetailPage extends StatefulWidget {
  final taskInfo;
  const TaskDetailPage({super.key, this.taskInfo});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 247),
      appBar: AppBar(
        title: Text(
          widget.taskInfo['title'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        elevation: 0.3,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDesc(detailInfo["desc"] as String),
            buildTimes(detailInfo["start_time"] as String,
                detailInfo["end_time"] as String),
            buildOtherInfo(
              detailInfo["status"] as String,
              detailInfo["actor"] as String,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerFloat, 145, -100),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildEditBottom(context);
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        tooltip: '编辑',
        backgroundColor: Colors.black,
      ),
    );
  }
}

//描述
Widget buildDesc(String desc) {
  return Container(
      constraints: const BoxConstraints(minHeight: 100),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 20,
                width: 3,
                color: const Color.fromARGB(255, 236, 105, 62),
              ),
              const Text(
                "描述",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Text(desc),
          )
        ],
      ));
}

buildEditBottom(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: Container(
            child: Text('1'),
          ),
        );
      });
}

//时间
Widget buildTimes(String startTime, String endTime) {
  return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 20,
                width: 3,
                color: const Color.fromARGB(255, 236, 105, 62),
              ),
              const Text(
                "时间",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              children: [
                const Icon(
                  Icons.schedule,
                  color: Colors.black45,
                  size: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    '开始时间：   ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  startTime,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Row(
              children: [
                const Icon(
                  Icons.alarm_off_outlined,
                  color: Colors.black45,
                  size: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    '结束时间：   ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  endTime,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          )
        ],
      ));
}

Widget buildOtherInfo(String status, String actor) {
  List<Widget> othersList = [];
  List<Widget> getOtherList() {
    othersList.clear();
    for (int i = 0; i < otherAssignees.length; i++) {
      final name = otherAssignees[i];
      othersList.add(avatarOthers(name, i));
    }
    return othersList;
  }

  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(20),
    color: Colors.white,
    width: double.infinity,
    child: Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 20,
              width: 3,
              color: const Color.fromARGB(255, 236, 105, 62),
            ),
            const Text(
              "其他信息",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Container(
            margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              children: [
                Text(
                  "栏目：",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  status,
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80),
                  child: Text(
                    "指派给：",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  actor,
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
          alignment: Alignment.topLeft,
          child: Text(
            'Other Assignees:',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: getOtherList(),
            )),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: Text(
                "进入评论区",
                style: TextStyle(color: Colors.white),
              )),
        )
      ],
    ),
  );
}

Widget avatarOthers(String name, int num) {
  return CircleAvatar(
    radius: 14,
    backgroundColor: Colors.primaries[num],
    child: Text(
      name.substring(0, 1),
      style: const TextStyle(fontSize: 14),
    ),
  );
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  final double offsetX;
  final double offsetY;
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}
