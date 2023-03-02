import 'package:flutter/material.dart';

class AfterLayOutRoute extends StatefulWidget {
  const AfterLayOutRoute({Key? key}) : super(key: key);

  @override
  _AfterLayoutRouteState createState() => _AfterLayoutRouteState();
}

class _AfterLayoutRouteState extends State<AfterLayOutRoute> {
  String _text = 'flutter 实战';
  Size _size = Size.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                return GestureDetector(
                  child: const Text(
                    'Text1:点击',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () => print('Text1: ${context.size}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
