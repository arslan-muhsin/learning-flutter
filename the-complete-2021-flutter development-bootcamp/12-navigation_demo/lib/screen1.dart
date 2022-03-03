import 'package:flutter/material.dart';
import 'package:navigation_demo/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Screen 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              color: Colors.blue,
              child: const Text('Go Forwards To Screen 2'),
              onPressed: () {
                Navigator.pushNamed(context, "/second");
              },
            ),
          ),
          Center(
            child: RaisedButton(
              color: Colors.purple,
              child: const Text('Go Home'),
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
            ),
          ),
        ],
      ),
    );
  }
}
