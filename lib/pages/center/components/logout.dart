import 'package:flutter/material.dart';

import '../../login/login.dart';

Widget logOut(context) {
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
