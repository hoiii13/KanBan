import 'package:flutter/material.dart';

buildEditBottom(context) {
  final titleController = TextEditingController();
  final startTimeController = TextEditingController();
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var screeHeight = MediaQuery.of(context).size.height;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: screeHeight * 0.8,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: titleController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "标题",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 3)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('开始时间'),
                          /* TextField(
                            controller: startTimeController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(),
                          ) */
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      });
}
