import 'package:flutter/material.dart';
import 'Element/MessageBubble.dart';
import 'Element/MessageInput.dart';

class ChatScreen extends StatelessWidget {
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
            child: ListView(
              reverse: true,
              children: const [
                MessageBubble(
                  message: 'Ciao, come stai?',
                  isMe: true,
                  time: '10:30',
                ),
                MessageBubble(
                  message: 'Sto bene, grazie!',
                  isMe: false,
                  time: '10:31',
                ),
              ],
            ),
          ),
          MessageInput(
            sendMessage: (message, time) {
              print("Messaggio inviato: $message");
              print("Orario di invio: $time");
            },
          ),
        ],
      ),
    );
  }
}
