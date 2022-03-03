import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  const AddTaskScreen({
    Key? key,
    required this.addTaskCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newTaskTextController = TextEditingController();
    late String newTaskText;

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30.0,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) => newTaskText = value,
            controller: newTaskTextController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          TextButton(
            child: const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              padding: const EdgeInsets.all(15.0),
            ),
            onPressed: () {
              addTaskCallback(Task(name: newTaskText));
              newTaskTextController.clear();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
