import 'package:flutter/material.dart';

class EditInfoPage extends StatefulWidget {
  const EditInfoPage({super.key});

  @override
  State<EditInfoPage> createState() => _EditInfoPageState();
}

class _EditInfoPageState extends State<EditInfoPage> {
  final nameController = TextEditingController();
  final mailController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode mailFocus = FocusNode();

  var isNameFocus = false;
  var isMailFocus = false;

  @override
  void initState() {
    super.initState();
    nameController.text = '昵称123';
    mailController.text = '123456789@qq.com';
    nameFocus.addListener(() {
      setState(() {
        if (nameFocus.hasFocus) {
          isNameFocus = true;
        } else {
          isNameFocus = false;
        }
      });
    });

    mailFocus.addListener(() {
      setState(() {
        if (mailFocus.hasFocus) {
          isMailFocus = true;
        } else {
          isMailFocus = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '编辑个人资料',
          style: TextStyle(fontSize: 16),
        ),
        elevation: 0.3,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(40, 70, 40, 0),
            child: TextField(
              controller: nameController,
              focusNode: nameFocus,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "昵称",
                  hintStyle: const TextStyle(fontSize: 13),
                  suffixIcon: !isNameFocus
                      ? const Text('')
                      : IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            nameController.clear();
                          },
                        ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1))),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 70, 40, 0),
            child: TextField(
              controller: mailController,
              focusNode: mailFocus,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "邮箱",
                  hintStyle: const TextStyle(fontSize: 13),
                  suffixIcon: !isMailFocus
                      ? const Text('')
                      : IconButton(
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            mailController.clear();
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
