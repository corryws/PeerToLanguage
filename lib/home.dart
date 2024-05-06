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
      theme: ThemeData(
        // Imposta i colori personalizzati
        primaryColor: const Color(0xFF24293E), // bg
        hintColor: const Color(0xFFCCCCCC), // Secondary
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Color(0xFFF4F5FC)), // Text
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF8ebbff), // Accent
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E), // Un grigio scuro
        appBar: AppBar(
          // Personalizza l'app bar
          backgroundColor: const Color(0xFF24293E), // bg
          elevation: 0, // Rimuovi l'ombra dall'app bar
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Azione per aprire il menu
            },
          ),
          title: const Row(
            children: [
              Spacer(),
              Text(
                'LVL 1',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFF4F5FC), // Text
                ),
              ),
              SizedBox(width: 8),
              Row(
                children: [
                  Icon(
                    Icons.diamond,
                    color: Color(0xFF8ebbff), // Accent
                  ),
                  SizedBox(width: 4),
                  Text(
                    'x50',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8ebbff), // Accent
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 21,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Azione quando l'elemento viene cliccato
              },
              child: Container(
                // Personalizza lo stile degli elementi della griglia
                padding: const EdgeInsets.all(16),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF24293E), // bg
                      child: Icon(
                        size: 50,
                        Icons.person,
                        color: Color(0xFFF4F5FC), // Text
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.diamond,
                          color: Color(0xFF8ebbff), // Accent
                        ),
                        SizedBox(width: 4),
                        Text(
                          '+100',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF8ebbff), // Accent
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: CustomBottomAppBar(),
      ),
    );
  }
}
