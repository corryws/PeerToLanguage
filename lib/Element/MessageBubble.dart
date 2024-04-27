import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time; // Aggiunta dell'orario di invio

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.time, // Inclusione dell'orario di invio nel costruttore
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          padding: const EdgeInsets.all(12),
          child: Text(
            message,
            style: TextStyle(color: isMe ? Colors.white : Colors.black),
          ),
        ),
        SizedBox(height: 4), // Spazio tra il messaggio e l'orario
        Text(
          time,
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        SizedBox(height: 0), // Spazio tra l'orario e il pulsante 'translate'
        IconButton(
          icon: Icon(Icons.translate),
          onPressed: () {
            // Aggiungi qui la logica per la traduzione del messaggio
          },
        ),
      ],
    );
  }
}
