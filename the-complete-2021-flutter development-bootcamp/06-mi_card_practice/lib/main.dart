import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                foregroundImage: AssetImage("images/avatar.png"),
                radius: 65.0,
              ),
              const Text(
                "Muhsin ARSLAN",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Fruktur",
                  fontSize: 25.0,
                ),
              ),
              Text(
                "SOFTWARE ENGINEER",
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                  fontFamily: "Lato",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 225.0,
                child: Divider(
                  height: 1.0,
                  color: Colors.blueGrey.shade100,
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      "+90 555 444 33 77",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text(
                      "muhsin@email.com",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
