import 'package:flutter/material.dart';
import 'package:peertolanguage/registra.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      theme: ThemeData(
        primaryColor: const Color(0xFF24293E), // bg
        hintColor: const Color(0xFFCCCCCC), // Secondary
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFF4F5FC)), // Text
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF24293E), // Accent
        ),
      ),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: [
              IntroPage(
                title: 'Welcome',
                description:
                    'Benvenuto su LIPA, dove imparerai imparando e imparando imparerai le lingue che hai sempre sognato',
                imagePath:
                    'assets/images/pagina1.png', // Percorso dell'immagine per Pagina 1
              ),
              IntroPage(
                title: 'Find all type of People to learn!',
                description: 'Trova il tuo HelpPeerToPeer adatto a Te!',
                imagePath:
                    'assets/images/pagina2.png', // Percorso dell'immagine per Pagina 2
              ),
              IntroPage(
                title: 'Start to Play with US',
                description:
                    'Divertitevi a portare quante più Chat a Livello Massimo!',
                imagePath:
                    'assets/images/pagina3.png', // Percorso dell'immagine per Pagina 3
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: 10.0,
                  width: (currentPage == index) ? 30.0 : 10.0,
                  decoration: BoxDecoration(
                    color: (currentPage == index)
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).hintColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Passa alla schermata di registrazione
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registra()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .secondary, // Utilizza il colore Accent definito nel tema
                ),
                child: const Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath; // Aggiungi il percorso dell'immagine

  IntroPage(
      {required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,
              height: 300, // Imposta l'altezza dell'immagine
              width: double
                  .infinity, // Imposta la larghezza dell'immagine alla larghezza massima disponibile
              fit: BoxFit
                  .contain //.cover, // Scala l'immagine in modo che si adatti al contenitore
              ),
          const SizedBox(height: 5.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
