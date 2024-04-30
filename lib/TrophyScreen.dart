import 'package:flutter/material.dart';
import 'package:peertolanguage/Element/BottomAppBar.dart';

void main() {
  runApp(TrophyScreen());
}

class Trophy {
  final String name;
  final String description;
  final IconData icon;
  final bool completed;

  Trophy({
    required this.name,
    required this.description,
    required this.icon,
    required this.completed,
  });
}

class TrophyScreen extends StatelessWidget {
  final List<Trophy> trophies = [
    Trophy(
      name: 'Rompi la timidezza!',
      description: 'Per aver effettuato il tuo primo IceBreaker!',
      icon: Icons.emoji_events,
      completed: false,
    ),
    Trophy(
      name: 'Comunicatore principiante',
      description: 'Invia 50 messaggi in una chat con un Utente',
      icon: Icons.emoji_events,
      completed: false,
    ),
    Trophy(
      name: 'Comunicatore intermedio',
      description: 'Invia 500 messaggi in una chat con un Utente',
      icon: Icons.emoji_events,
      completed: false,
    ),
    Trophy(
      name: 'Comunicatore esperto',
      description: 'Invia 5000 messaggi in una chat con un Utente',
      icon: Icons.emoji_events,
      completed: false,
    ),
    Trophy(
      name: 'Vediamo cosa sai fare!',
      description: 'Per essere stato scelto come PeerToHelper da un Utente',
      icon: Icons.emoji_events,
      completed: false,
    ),
    Trophy(
      name: 'Aiudame a comunicar!',
      description: 'Avvia una chat con un PeerToHelper con un Utente ',
      icon: Icons.emoji_events,
      completed: false,
    ),
    Trophy(
      name: 'E' ' tempo di vedersi!',
      description: 'Effettua una VideoCall con un Utente',
      icon: Icons.emoji_events,
      completed: false,
    ),
    Trophy(
      name: 'La tua prima MaxChat',
      description: 'Porta 1 chat con un Utente a LVL : MAX',
      icon: Icons.emoji_events,
      completed: false,
    ),
    // Add more trophies as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Trofei'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: trophies.length,
                itemBuilder: (BuildContext context, int index) {
                  Trophy trophy = trophies[index];
                  return Card(
                    margin: const EdgeInsets.all(10.0),
                    elevation: 5.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(trophy.icon),
                      ),
                      title: Text(trophy.name),
                      subtitle: Text(
                        trophy.completed ? 'Completato' : trophy.description,
                      ),
                      trailing: trophy.completed ? Icon(Icons.check) : null,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(),
      ),
    );
  }
}
