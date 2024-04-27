import 'package:flutter/material.dart';
import 'package:peertolanguage/home.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Rimuove la scritta Debug
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        centerTitle: true,
      ),
      body: Center(
        // Centro il contenuto della schermata
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Assicurati di sostituire 'assets/logo.png' con il percorso del tuo logo
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: const Text('INIZIA'),
            ),
          ],
        ),
      ),
    );
  }
}
