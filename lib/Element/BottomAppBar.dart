import 'package:flutter/material.dart';
import 'package:peertolanguage/home.dart';
import 'package:peertolanguage/MatchScreen.dart';
import 'package:peertolanguage/TrophyScreen.dart';
import 'package:peertolanguage/ProfileScreen.dart';

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF24293E), // Background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrophyScreen()),
              );
            },
            color: const Color(0xFFCCCCCC), // Icon color
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            color: const Color(0xFFCCCCCC), // Icon color
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MatchScreen()),
              );
            },
            color: const Color(0xFFCCCCCC), // Icon color
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            color: const Color(0xFFCCCCCC), // Icon color
          ),
        ],
      ),
    );
  }
}
