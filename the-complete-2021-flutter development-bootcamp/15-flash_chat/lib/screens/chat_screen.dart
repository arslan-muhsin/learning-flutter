import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final _firebaseStore = FirebaseFirestore.instance;
late User loggedUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        loggedUser = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  void sendMessage() {
    if (messageText != null && messageText!.isNotEmpty) {
      _firebaseStore.collection("messages").add({
        'text': messageText,
        'sender': loggedUser.email,
        'date': FieldValue.serverTimestamp(),
      });
    } else {
      print('Message text cannot be empty.');
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              EasyLoading.show(
                status: 'Session is ending...',
                maskType: EasyLoadingMaskType.black,
              );

              await logout().whenComplete(() {
                EasyLoading.dismiss(animation: true)
                    .whenComplete(() => Navigator.pop(context));
              });
            },
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        setState(() {
                          messageText = value;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextButton(
                      onPressed: () {
                        sendMessage();
                        messageTextController.clear();
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseStore
          .collection('messages')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];

        if (snapshot.hasData) {
          final messages = snapshot.data!.docs;

          for (var message in messages) {
            final isCurrentUser = message.get('sender') == loggedUser.email;
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final messageDate = message.get('date');

            final messageBubble = MessageBubble(
              isCurrentUser: isCurrentUser,
              sender: messageSender,
              message: messageText,
              date: messageDate,
            );

            messageBubbles.add(messageBubble);
          }
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 30.0,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
