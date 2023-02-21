import 'package:flutter/material.dart';

class ModifyPasswordPage extends StatefulWidget {
  const ModifyPasswordPage({super.key});

  @override
  State<ModifyPasswordPage> createState() => _ModifyPasswordPageState();
}

class _ModifyPasswordPageState extends State<ModifyPasswordPage> {
  final oldController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  FocusNode oldFocusNode = FocusNode();
  FocusNode newFocusNode = FocusNode();
  FocusNode confirmFocusNode = FocusNode();

  var isOldFocus = false;
  var isNewFocus = false;
  var isConfirmFocus = false;

  @override
  void initState() {
    super.initState();

    oldFocusNode.addListener(() {
      setState(() {
        if (oldFocusNode.hasFocus) {
          isOldFocus = true;
        } else {
          isOldFocus = false;
        }
      });
    });
    newFocusNode.addListener(() {
      setState(() {
        if (newFocusNode.hasFocus) {
          isNewFocus = true;
        } else {
          isNewFocus = false;
        }
      });
    });
    confirmFocusNode.addListener(() {
      setState(() {
        if (confirmFocusNode.hasFocus) {
          isConfirmFocus = true;
        } else {
          isConfirmFocus = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    oldFocusNode.dispose();
    newFocusNode.dispose();
    confirmFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '修改密码',
          style: TextStyle(fontSize: 16),
        ),
        elevation: 0.3,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(40, 70, 40, 0),
            child: TextField(
              controller: oldController,
              focusNode: oldFocusNode,
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "旧密码",
                  hintStyle: const TextStyle(fontSize: 13),
                  suffixIcon: !isOldFocus
                      ? const Text('')
                      : IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            oldController.clear();
                          },
                        ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1))),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: TextField(
              controller: newController,
              focusNode: newFocusNode,
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "新密码",
                  hintStyle: const TextStyle(fontSize: 13),
                  suffixIcon: !isNewFocus
                      ? const Text('')
                      : IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            newController.clear();
                          },
                        ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1))),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: TextField(
              controller: confirmController,
              focusNode: confirmFocusNode,
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "确认密码",
                  hintStyle: const TextStyle(fontSize: 13),
                  suffixIcon: !isConfirmFocus
                      ? const Text('')
                      : IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            confirmController.clear();
                          },
                        ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1))),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 60, 40, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: const Text(
                '确定',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
