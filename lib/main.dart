import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Club de Lectura',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purpleAccent,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Club'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text(
                'Blog Club de Lectura',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Iniciar Sesión'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/sites/83825/images/OK0J2jDTXG2oxyBIzEZm_GOcerts_NTstudies.jpg',
              width: 280,
              height: 220,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    
                    child: ArticleCard(
                      imageUrl: 'https://th.bing.com/th/id/OIP.roMMM8TZKm51b1bnkLx5kAHaEo?rs=1&pid=ImgDetMain',
                      title: 'Título del Artículo 1',
                      summary: 'Primeras palabras del artículo 1...',
                    ),
                  ),
                  ArticleCard(
                    imageUrl: 'https://th.bing.com/th/id/R.8f1ec31c92956df7f1a6635ac2d002ca?rik=F84heh09zA%2bbJg&riu=http%3a%2f%2fwww.udima.es%2fsites%2fudima.es%2ffiles%2fClub+de+lectura.jpg&ehk=2IQ7OOVSflPQeN9ZkRHIUXlQcS30NiWObs%2b%2b%2bqefPNs%3d&risl=&pid=ImgRaw&r=0',
                    title: 'Título del Artículo 2',
                    summary: 'Primeras palabras del artículo 2...',
                  ),
                  // Agrega más artículos aquí
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String summary;

  const ArticleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.network(imageUrl, width: 180, height: 80),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(summary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Text('Página de inicio de sesión'),
      ),
    );
  }
}
