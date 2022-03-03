import 'package:flutter/material.dart';
import 'package:navigation_demo/screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              color: Colors.red,
              child: const Text('Go Forwards To Screen 1'),
              onPressed: () {
                Navigator.pushNamed(context, "/first");
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
