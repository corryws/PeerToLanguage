import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Element/BottomAppBar.dart';
import 'ChatScreen.dart'; // Importa lo screen della chat

void main() {
  runApp(MatchScreen());
}

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<String> matches = [
    "corrado",
    "eros",
    "sap0",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 5.0,
            child: ListTile(
              onTap: () {
                // Naviga alla schermata della chat quando si fa clic sulla corrispondenza
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatScreen(), //matchName: matches[index]
                  ),
                );
              },
              leading: FutureBuilder<Widget>(
                future: _loadImage('assets/images/${matches[index]}.png'),
                builder:
                    (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: snapshot.data,
                    );
                  } else {
                    return CircleAvatar(
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
              trailing: Icon(Icons.grade), // Rimuovi onPressed dall'icona
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }

  Future<Widget> _loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    return Image.memory(bytes);
  }
}
