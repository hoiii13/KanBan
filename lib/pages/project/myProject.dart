import 'package:flutter/material.dart';
import 'package:kanban/pages/project/const.dart';
import 'package:kanban/pages/project/tasks.dart';

class MyProjectPage extends StatefulWidget {
  const MyProjectPage({super.key});

  @override
  State<MyProjectPage> createState() => _MyProjectPageState();
}

class _MyProjectPageState extends State<MyProjectPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (context, index) {
            List? taskColumn = projectList[index]["params"] as List?;
            String taskColumnText = '';
            int count = 0;
            taskColumn!.forEach((e) => {
                  count++,
                  if (count < taskColumn.length)
                    {taskColumnText += e + ' | '}
                  else
                    {taskColumnText += e}
                });

            return Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: GestureDetector(
                  onTap: () {
                    String name = projectList[index]["name"] as String;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => TasksPage(
                              name: name,
                            )));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0.6,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: Row(
                            children: [
                              Text(
                                '${projectList[index]["name"]}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        projectList[index]["desc"] != ''
                            ? Container(
                                margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '项目描述：${projectList[index]["desc"]}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 175, 169, 169)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                              )
                            : const SizedBox(),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            taskColumnText,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 175, 169, 169),
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
