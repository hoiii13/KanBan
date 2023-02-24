import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kanban/components/TaskDetail.dart';
import 'package:kanban/pages/project/const.dart';

class TasksPage extends StatefulWidget {
  final name;
  const TasksPage({super.key, required this.name});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  //处理Tabs
  final List<Tab> _tabs = [];
  List<Tab> getTabs() {
    _tabs.clear();
    for (int i = 0; i < taskColumns.length; i++) {
      _tabs.add(getTab(i));
    }
    return _tabs;
  }

  Tab getTab(int num) {
    return Tab(text: "${taskColumns[num]["name"]}");
  }

//处理tabBar对应页面
  List<Widget> _taskLists = [];
  List<Widget> getTaskLists() {
    _taskLists.clear();
    for (int i = 0; i < taskColumns.length; i++) {
      final name = taskColumns[i]["name"] as String;
      _taskLists.add(buildTasksList(name));
    }
    return _taskLists;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (tabController.index.toDouble() == tabController.animation!.value) {
          print("tabController.index = ${tabController.index}");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: DefaultTabController(
            length: taskColumns.length,
            child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 244, 245, 247),
                appBar: AppBar(
                  centerTitle: true,
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
                  actions: [
                    IconButton(
                        constraints:
                            const BoxConstraints(maxHeight: 20, maxWidth: 20),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_outlined,
                          size: 20,
                        ),
                        padding: const EdgeInsets.all(0.0)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 20,
                        ))
                  ],
                  bottom: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3.0,
                      indicatorColor: const Color.fromARGB(255, 236, 105, 62),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      labelColor: const Color.fromARGB(255, 236, 105, 62),
                      unselectedLabelColor: Colors.grey,
                      tabs: getTabs()),
                ),
                body: Listener(
                  child: TabBarView(
                      controller: tabController, children: getTaskLists()),
                ))));
  }

  Widget buildTasksList(String name) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 20, 15),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: taskColumnList[name]!.length,
          itemBuilder: (context, index) {
            DateTime nowTime = DateTime.now();
            final endTime =
                DateTime.parse(taskColumnList[name]![index]["end_time"]);
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => TaskDetailPage(
                            taskInfo: taskColumnList[name]![index])));
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
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
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.person_outline,
                                      size: 20,
                                      color: Colors.black45,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(
                                          '参与者: ${taskColumnList[name]![index]["actor"]}'),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      size: 20,
                                      color: Colors.black45,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        '结束时间: ${taskColumnList[name]![index]["end_time"]}',
                                        style: TextStyle(
                                            color: nowTime
                                                        .millisecondsSinceEpoch >
                                                    endTime
                                                        .millisecondsSinceEpoch
                                                ? const Color.fromARGB(
                                                    255, 236, 105, 62)
                                                : Colors.black45),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )))),
            );
          }),
    );
  }
}
