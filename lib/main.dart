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
                title: 'Pagina 1',
                description:
                    'Le lingue Imparerai imparando e imparando imparerai!',
              ),
              IntroPage(
                title: 'Pagina 2',
                description: 'Trova il tuo HelpPeerToPeer adatto a Te!',
              ),
              IntroPage(
                title: 'Pagina 3',
                description:
                    'Divertitevi a portare quante più Chat a Livello Massimo!',
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
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 10.0,
                  width: (currentPage == index) ? 30.0 : 10.0,
                  decoration: BoxDecoration(
                    color: (currentPage == index) ? Colors.blue : Colors.grey,
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
                child: Text('Next'),
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

  IntroPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
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
