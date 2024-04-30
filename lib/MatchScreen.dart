import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa il pacchetto per utilizzare il rootBundle
import 'Element/BottomAppBar.dart';

void main() {
  runApp(MatchScreen());
}

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Le Tue Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PeerToChatScreen(),
    );
  }
}

class PeerToChatScreen extends StatefulWidget {
  @override
  _PeerToChatScreenState createState() => _PeerToChatScreenState();
}

class _PeerToChatScreenState extends State<PeerToChatScreen> {
  //dati fittizzi perché saranno poi in futuro rimpiazzati
  //dai vari utenti collegati al server
  List<String> matches = [
    "corrado",
    "eros",
    "ashain",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le tue Chat'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 5.0,
            child: ListTile(
              leading: FutureBuilder<Widget>(
                future: _loadImage(
                    'assets/images/${matches[index]}.png'), // Carica l'immagine utilizzando il rootBundle
                builder:
                    (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: snapshot.data,
                    );
                  } else {
                    return CircleAvatar(
                      // Fornisci un fallback mentre l'immagine viene caricata
                      backgroundColor: Colors.blue,
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              title: Text(
                'Tu&${matches[index]}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Livello Chat : 1'),
              trailing: IconButton(
                icon: const Icon(Icons.grade),
                onPressed: () {
                  // Action when user likes the match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You liked ${matches[index]}'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }

  Future<Widget> _loadImage(String path) async {
    final ByteData data = await rootBundle
        .load(path); // Carica l'immagine utilizzando il rootBundle
    final Uint8List bytes =
        data.buffer.asUint8List(); // Converte i dati in Uint8List
    return Image.memory(
        bytes); // Restituisci un widget Image con i byte dell'immagine
  }
}
