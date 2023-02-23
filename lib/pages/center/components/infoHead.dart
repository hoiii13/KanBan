import 'package:flutter/material.dart';

import '../editInfo.dart';

Widget infoHead(context) {
  return Container(
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
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
                style: TextStyle(color: Color.fromARGB(255, 158, 157, 154))),
          )
        ],
      ));
}
