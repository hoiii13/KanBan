import 'package:flutter/material.dart';

class MyCenterPage extends StatefulWidget {
  const MyCenterPage({super.key});

  @override
  State<MyCenterPage> createState() => _MyCenterPageState();
}

class _MyCenterPageState extends State<MyCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
      ),
    );
  }
}
