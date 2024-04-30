import 'package:flutter/material.dart';
import 'package:peertolanguage/home.dart';
//import 'package:peertolanguage/main.dart';
//import 'package:peertolanguage/ChatScreen.dart';
import 'package:peertolanguage/MatchScreen.dart';

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {
              // Azione per aprire i trofei
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MatchScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
