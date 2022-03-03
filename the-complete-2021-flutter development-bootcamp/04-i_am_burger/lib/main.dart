import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("I Am Burger"),
        backgroundColor: Colors.red[400],
      ),
      body: const Center(
        child: Image(
          image: AssetImage("images/burger.png"),
        ),
      ),
    ),
  ));
}
