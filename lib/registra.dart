import 'package:flutter/material.dart';

void main() {
  runApp(Registra());
}

class Registra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schermata Grafica',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Schermata Grafica'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: 'Nome Utente'),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'M',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('M'),
                    Radio(
                      value: 'F',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('F'),
                    Radio(
                      value: 'NB',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('NB'),
                  ],
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                      value: 'italiano',
                      child: Text('Italiano'),
                    ),
                    DropdownMenuItem(
                      value: 'inglese',
                      child: Text('Inglese'),
                    ),
                    DropdownMenuItem(
                      value: 'francese',
                      child: Text('Francese'),
                    ),
                    DropdownMenuItem(
                      value: 'spagnolo',
                      child: Text('Spagnolo'),
                    ),
                  ],
                  onChanged: (String? value) {},
                  hint: const Text('Seleziona Lingua'),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'A1',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('A1'),
                    Radio(
                      value: 'A2',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('A2'),
                    Radio(
                      value: 'B1',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('B1'),
                    Radio(
                      value: 'B2',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('B2'),
                    Radio(
                      value: 'ML',
                      groupValue: null,
                      onChanged: null,
                    ),
                    Text('Madrelingua'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
