import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text("Ask Me Anything"),
        ),
        body: const SafeArea(
          child: Ball(),
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  var ballNumber = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => getAnswer(),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset("images/ball$ballNumber.png"),
            ),
          ),
        ),
      ],
    );
  }

  void getAnswer() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }
}
