import 'package:flutter/material.dart';
import 'package:peertolanguage/Element/BottomAppBar.dart';

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profilo'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Azione quando si preme l'icona delle impostazioni
              },
            ),
          ],
        ),
        body: ProfileBody(),
        bottomNavigationBar: CustomBottomAppBar(),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue[500], // Colore del riquadro superiore
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Text(
                    'LVL: 1',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage('assets/images/ashain.png'),
                      ),
                      IconButton(
                        onPressed: () {
                          // Azione quando si preme l'icona della matita
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                const Spacer(), // Spazio flessibile
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Azione quando si preme l'icona diamantini
                      },
                      icon: const Icon(Icons.diamond),
                    ),
                    const Text(
                      'x50',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Ashain',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Sesso: M',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Lingue Madre Lingua:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, // Numero di lingue madre lingua
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.grey[200],
                  child: Center(child: Text('Lingua $index')),
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Altre Lingue:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Numero di altre lingue
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.grey[200],
                  child: Center(child: Text('Lingua $index')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
