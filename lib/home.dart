import 'package:flutter/material.dart';
import 'Element/BottomAppBar.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Azione per aprire il menu
            },
          ),
          title: Row(
            children: [
              const Spacer(), // Spazio per spingere il testo e l'icona a destra
              const Text('LVL 1'),
              const SizedBox(
                  width: 8), // Spazio tra il livello e l'icona dei diamanti
              Row(
                children: [
                  const Icon(Icons.diamond),
                  const SizedBox(width: 4), // Spazio tra l'icona e il testo
                  const Text('x50'),
                ],
              ),
            ],
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 20, // Numero di elementi nella griglia
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Azione quando l'elemento viene cliccato
              },
              child: GridTile(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.diamond), // Icona dei diamanti
                        const SizedBox(
                            width: 4), // Spazio tra l'icona e il testo
                        const Text(
                            '+100'), // Testo "+100" accanto all'icona dei diamanti
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: CustomBottomAppBar(), // Utilizza il nuovo widget
      ),
    );
  }
}
