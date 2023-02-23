import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kanban/pages/project/const.dart';

class TasksPage extends StatefulWidget {
  final name;
  const TasksPage({super.key, required this.name});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: const TextStyle(fontSize: 18),
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
        body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: taskColumns.length,
              itemBuilder: (context, index) {
                String name = taskColumns[index]["name"] as String;
                bool status = taskColumns[index]["status"] as bool;

                return Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (mounted) {
                                  if (taskColumns[index]["status"] == true) {
                                    taskColumns[index]["status"] = false;
                                  } else {
                                    taskColumns[index]["status"] = true;
                                  }
                                }
                              });
                            },
                            icon: Icon(
                                taskColumns[index]["status"] == true
                                    ? Icons.arrow_drop_down_rounded
                                    : Icons.arrow_right_rounded,
                                size: 30,
                                color: taskColumns[index]["status"] == true
                                    ? const Color.fromARGB(255, 236, 105, 62)
                                    : Colors.black),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                color: taskColumns[index]["status"] == true
                                    ? const Color.fromARGB(255, 236, 105, 62)
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    buildTasksList(status, name)
                    /*  Visibility(
                      visible: taskColumns[index]["status"] == true,
                      child: _buildTasksList(
                          taskColumnList[taskColumns[index]["name"]]!),
                    ) */
                  ],
                );
              }),
        ));
  }

  Widget buildTasksList(bool status, String name) {
    return Visibility(
        visible: status,
        child: Container(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: taskColumnList[name]!.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                taskColumnList[name]![index]["title"],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 51, 51, 51),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.person_outline,
                                    size: 20,
                                    color: Colors.black45,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                        '参与者: ${taskColumnList[name]![index]["actor"]}'),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    size: 20,
                                    color: Colors.black45,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                        '结束时间: ${taskColumnList[name]![index]["end_time"]}'),
                                  )
                                ],
                              ),
                            )
                          ],
                        )));
              }),
        ));
  }
}
