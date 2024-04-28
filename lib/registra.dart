import 'package:flutter/material.dart';

void main() {
  runApp(Registra());
}

class Registra extends StatefulWidget {
  @override
  _RegistraState createState() => _RegistraState();
}

class _RegistraState extends State<Registra> {
  @override
  void initState() {
    super.initState();
    _lingueContainers.add(LingueContainer(onPressed: AddLingua));
  }

  final List<LingueContainer> _lingueContainers = [];

  void AddLingua() {
    setState(() {
      _lingueContainers.add(LingueContainer(onPressed: AddLingua));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schermata Grafica',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registrati'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Nome Utente TextField
              const Text(
                'Nome Utente',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              // Password TextField
              const Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // Genere RadioButtons
              const Text(
                'Genere',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Row(
                children: [
                  Radio(value: 'M', groupValue: null, onChanged: null),
                  Text('M'),
                  Radio(value: 'F', groupValue: null, onChanged: null),
                  Text('F'),
                  Radio(value: 'NB', groupValue: null, onChanged: null),
                  Text('NB'),
                ],
              ),
              const SizedBox(height: 20),
              // Lingue DropdownButton
              Column(
                children: _lingueContainers
                    .map((container) => container)
                    .toList(), //children: _lingueContainers,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Funzione per creare il container delle lingue
class LingueContainer extends StatefulWidget {
  final VoidCallback onPressed;

  LingueContainer({required this.onPressed});

  @override
  _LingueContainerState createState() => _LingueContainerState();
}

class _LingueContainerState extends State<LingueContainer> {
  late String _selectedLanguage = 'italiano';
  late String _selectedLevel = 'A1';

  bool plusButtonvisible = true;
  bool minusButtonvisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownButton<String>(
          items: <String>['Italiano', 'Inglese', 'Spagnolo', 'Francese']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value.toLowerCase(),
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedLanguage = value!;
            });
          },
          hint: const Text('Seleziona Lingua'),
          value: _selectedLanguage,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Radio(
              value: 'A1',
              groupValue: _selectedLevel,
              onChanged: (value) {
                setState(() {
                  _selectedLevel = value!;
                });
              },
            ),
            const Text('A1'),
            Radio(
              value: 'A2',
              groupValue: _selectedLevel,
              onChanged: (value) {
                setState(() {
                  _selectedLevel = value!;
                });
              },
            ),
            const Text('A2'),
            Radio(
              value: 'B1',
              groupValue: _selectedLevel,
              onChanged: (value) {
                setState(() {
                  _selectedLevel = value!;
                });
              },
            ),
            const Text('B1'),
            Radio(
              value: 'B2',
              groupValue: _selectedLevel,
              onChanged: (value) {
                setState(() {
                  _selectedLevel = value!;
                });
              },
            ),
            const Text('B2'),
            Radio(
              value: 'ML',
              groupValue: _selectedLevel,
              onChanged: (value) {
                setState(() {
                  _selectedLevel = value!;
                });
              },
            ),
            const Text('ML'),
            // Add other radio buttons for different levels

            Visibility(
              visible: plusButtonvisible,
              child: ElevatedButton(
                onPressed: () {
                  widget.onPressed();
                  setState(() {
                    plusButtonvisible = false;
                    minusButtonvisible = false;
                  });
                },
                child: const Text('+'),
              ),
            ),
            Visibility(
              visible: minusButtonvisible,
              child: ElevatedButton(
                onPressed: () {
                  widget.onPressed();
                  setState(() {
                    plusButtonvisible = false;
                    minusButtonvisible = false;
                  });
                },
                child: const Text('-'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
