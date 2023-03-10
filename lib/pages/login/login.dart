import 'package:flutter/material.dart';
import 'package:kanban/layout/tabs.dart';
import 'package:kanban/pages/register/register.dart';

import '../../components/textFeild.dart';

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

  bool isShowPwd = false;

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

  //用于遮挡密码
  void _passwordIcon() {
    setState(() {
      isShowPwd = !isShowPwd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.fromLTRB(30, 160, 30, 0),
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
            buildTextField(nameController, nameFocus, isNameFocus, '用户名'),
            buildPwdTextField(passwordController, passwordFocus,
                isPasswordFocus, '密码', isShowPwd),
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterPage()),
                            (route) => false);
                      },
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
      )),
    );
  }

  buildPwdTextField(controller, focus, isFocus, text, isShow) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: controller,
        focusNode: focus,
        obscureText: !isShow,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 15),
            hintText: text,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.black, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.black, width: 3)),
            suffixIcon: SizedBox(
                width: 60,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isFocus
                        ? IconButton(
                            constraints: const BoxConstraints(
                                maxHeight: 18, maxWidth: 18),
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              controller.clear();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              size: 18,
                              color: Colors.black,
                            ))
                        : const SizedBox(
                            height: 18,
                            width: 18,
                          ),
                    IconButton(
                        constraints:
                            const BoxConstraints(maxHeight: 35, maxWidth: 35),
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        onPressed: () {
                          setState(() {
                            _passwordIcon();
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          size: 18,
                          color: Colors.black,
                        ))
                  ],
                ))),
      ),
    );
  }
}
