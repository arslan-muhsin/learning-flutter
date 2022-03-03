import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isCurrentUser;
  final String sender;
  final String message;
  final Timestamp date;

  const MessageBubble({
    Key? key,
    required this.sender,
    required this.message,
    required this.isCurrentUser,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeStampAsDate = date.toDate();
    final formattedDate =
        DateFormat('dd.MM.yyyy HH:mm').format(timeStampAsDate);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text("$sender - $formattedDate",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13.0,
                )),
          ),
          Material(
            color: isCurrentUser ? Colors.blueGrey : Colors.lightBlueAccent,
            elevation: 5.0,
            borderRadius: isCurrentUser
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
