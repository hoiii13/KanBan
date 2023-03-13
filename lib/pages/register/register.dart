import 'package:flutter/material.dart';
import 'package:kanban/pages/login/login.dart';

import '../../components/textFeild.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();
  FocusNode confirmFocus = FocusNode();

  var isNameFocus = false;
  var isPwdFocus = false;
  var isConfirmFocus = false;

  bool isShowPwd = false;
  bool isConfirmPwd = false;

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
    pwdFocus.addListener(() {
      setState(() {
        if (pwdFocus.hasFocus) {
          isPwdFocus = true;
        } else {
          isPwdFocus = false;
        }
      });
    });
    confirmFocus.addListener(() {
      setState(() {
        if (confirmFocus.hasFocus) {
          isConfirmFocus = true;
        } else {
          isConfirmFocus = false;
        }
      });
    });
  }

  //用于遮挡密码
  bool _passwordIcon() {
    setState(() {
      isShowPwd = !isShowPwd;
    });
    return isShowPwd;
  }

  void _confirmPwdIcon() {
    setState(() {
      isConfirmPwd = !isConfirmPwd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(30, 130, 30, 0),
        child: Column(
          children: [
            Container(
              alignment: const Alignment(-1, -1),
              child: const Text(
                'Sign up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: const Text(
                  'You have chance to have create new account. If you really want to.',
                  style: TextStyle(fontSize: 13)),
            ),
            buildTextField(nameController, nameFocus, isNameFocus, '用户名'),
            buildPwdTextField(
                pwdController, pwdFocus, isPwdFocus, '密码', isShowPwd, 0),
            buildPwdTextField(confirmController, confirmFocus, isConfirmFocus,
                '确认密码', isConfirmPwd, 1),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 60)),
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {},
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
                  const Text('已经有账号？',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => LoginPage()),
                            (route) => false);
                      },
                      child: const Text(
                        '去登录',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  buildPwdTextField(controller, focus, isFocus, text, isShow, status) {
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
                            if (status == 0) {
                              _passwordIcon();
                            } else {
                              _confirmPwdIcon();
                            }
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
