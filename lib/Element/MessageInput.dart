import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final Function(String, String)
      sendMessage; // Funzione per inviare il messaggio

  const MessageInput({Key? key, required this.sendMessage}) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Scrivi un messaggio...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Ottieni il testo del messaggio dall'input
              String messageText = _controller.text;

              // Ottieni l'orario corrente
              String currentTime = DateTime.now().toString();

              // Invia il messaggio utilizzando la funzione passata dal widget padre
              widget.sendMessage(messageText, currentTime);

              // Svuota il campo di testo dopo l'invio
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
