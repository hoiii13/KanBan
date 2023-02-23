import 'package:flutter/material.dart';

import '../editInfo.dart';
import '../modifyPassword.dart';

Widget infoMiddle(context) {
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
