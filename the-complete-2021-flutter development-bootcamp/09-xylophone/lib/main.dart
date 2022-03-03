import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildNoteButton(color: Colors.red, noteNumber: 1),
              buildNoteButton(color: Colors.deepOrange, noteNumber: 2),
              buildNoteButton(color: Colors.yellow, noteNumber: 3),
              buildNoteButton(color: Colors.lightGreen, noteNumber: 4),
              buildNoteButton(color: Colors.green, noteNumber: 5),
              buildNoteButton(color: Colors.blue, noteNumber: 6),
              buildNoteButton(color: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }

  void playNote(int noteNumber) {
    // Integration of sound player
  }

  Widget buildNoteButton(
      {required MaterialColor color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: () {
          playNote(noteNumber);
        },
        child: const SizedBox(width: 100),
      ),
    );
  }
}
