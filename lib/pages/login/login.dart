import 'package:flutter/material.dart';
import 'package:kanban/components/tabs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  var isNameFocus = false;
  var isPasswordFocus = false;

  @override
  void initState() {
    super.initState();
    nameFocus.addListener(() {
      setState(() {
        if (nameFocus.hasFocus) {
          isNameFocus = true;
        } else {
          isNameFocus = false;
        }
      });
    });

    passwordFocus.addListener(() {
      setState(() {
        if (passwordFocus.hasFocus) {
          isPasswordFocus = true;
        } else {
          isPasswordFocus = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.fromLTRB(30, 180, 30, 0),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(-1, -1),
            child: const Text(
              "Login to your",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            alignment: const Alignment(-1, -1),
            child: const Text(
              "Account",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: TextField(
              controller: nameController,
              focusNode: nameFocus,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "用户名",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 3)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 3)),
                  suffixIcon: isNameFocus
                      ? IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            size: 18,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            nameController.clear();
                          },
                        )
                      : const Text('')),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: passwordController,
              focusNode: passwordFocus,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: '密码',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 3)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 3)),
                  suffixIcon: isPasswordFocus
                      ? IconButton(
                          onPressed: () {
                            passwordController.clear();
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 18,
                          ))
                      : const Text('')),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 60)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Tabs()));
              },
              child: const Text(
                '确定',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '还没有账号？',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '新注册一个',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange),
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
