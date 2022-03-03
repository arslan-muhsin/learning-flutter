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
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("images/profile-image.jpeg")),
              const Text(
                "Michael Ewan",
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Software Engineer",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  letterSpacing: 3.6,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 20.0,
                child: Divider(
                  height: 1.0,
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "+44 123 235 741",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "michael@mail.com",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20.0,
                          color: Colors.teal.shade900,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
