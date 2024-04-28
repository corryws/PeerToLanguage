import 'package:flutter/material.dart';
import 'Element/MessageBubble.dart';
import 'Element/MessageInput.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State {
// Lista dei messaggi nella chat
  List<Map<String, String>> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat con Eros'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Chat Level: 1',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  width: 250,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageBubble(
                  message: messages[index]['message']!,
                  isMe: messages[index]['isMe'] == 'true',
                  time: messages[index]['time']!,
                );
              },
            ),
          ),
          MessageInput(
            sendMessage: (message, time) {
              print(time);
              setState(() {
                messages.insert(0, {
                  'message': message,
                  'isMe': 'true',
                  'time': time,
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
