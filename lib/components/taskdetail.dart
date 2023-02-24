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
        body: Column(
          children: [
            Container(
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Text('${detailInfo["desc"]}'),
                    )
                  ],
                )),
            Container(
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
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
                            '${detailInfo["start_time"]}',
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
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
                            '${detailInfo["end_time"]}',
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(20),
              color: Colors.white,
              width: double.infinity,
              height: 200,
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
