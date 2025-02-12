import 'package:flutter/material.dart';
import 'dart:async';
import './page/login_page.dart';

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
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
          displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.pink),
          titleLarge: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: HomePage(),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Map<String, String>>> _bookReviewsFuture;
  late Timer _timer;
  int _startIndex = 0;

  @override
  void initState() {
    super.initState();
    _bookReviewsFuture = fetchBookReviews();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      setState(() {
        _startIndex = (_startIndex + 2) % 5;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<List<Map<String, String>>> fetchBookReviews() async {
    // Simula la obtención de reseñas de una API
    await Future.delayed(Duration(seconds: 6));
    return [
      {'title': 'Harry Potter', 'review': 'MAtaron a voldermot agarrando el bolsillo', 'imageUrl': 'https://1.bp.blogspot.com/-DsqG9OOPp7M/XvsLsTB_3fI/AAAAAAAASTQ/iu-1KGF___8uHEeg1BoikdOSUfblnKkvwCLcBGAsYHQ/s1600/Novedad%2BBolsillo%2BHarry%2BPotter%2B1.jpg'},
      {'title': 'Harry Potter', 'review': 'MAtaron a voldermot agarrando el bolsillo', 'imageUrl': 'https://1.bp.blogspot.com/-DsqG9OOPp7M/XvsLsTB_3fI/AAAAAAAASTQ/iu-1KGF___8uHEeg1BoikdOSUfblnKkvwCLcBGAsYHQ/s1600/Novedad%2BBolsillo%2BHarry%2BPotter%2B1.jpg'},
      {'title': 'Harry Potter', 'review': 'MAtaron a voldermot agarrando el bolsillo', 'imageUrl': 'https://1.bp.blogspot.com/-DsqG9OOPp7M/XvsLsTB_3fI/AAAAAAAASTQ/iu-1KGF___8uHEeg1BoikdOSUfblnKkvwCLcBGAsYHQ/s1600/Novedad%2BBolsillo%2BHarry%2BPotter%2B1.jpg'},
      {'title': 'Libro 2', 'review': 'Reseña del libro 2...', 'imageUrl': 'https://th.bing.com/th/id/OIP.mip1hp4iAoqM2itOKDX40wHaL5?w=1618&h=2598&rs=1&pid=ImgDetMain'},
      {'title': 'Libro 3', 'review': 'Reseña del libro 3...', 'imageUrl': 'https://pbs.twimg.com/media/FfV9_b4WQAEwu8q.jpg'},
      {'title': 'Libro 4', 'review': 'Reseña del libro 4...', 'imageUrl': 'https://th.bing.com/th/id/OIP.iIWVw1T0rX7ZLR8_vvhYKgHaHY?w=1080&h=1077&rs=1&pid=ImgDetMain'},
      {'title': 'Libro 5', 'review': 'Reseña del libro 5...', 'imageUrl': 'https://imagenes.20minutos.es/files/image_990_v3/uploads/imagenes/2022/01/28/el-maestro-juan-martinez-que-estaba-alli-y-mi-madre-era-de-mariupol-2.jpeg'},
    ];
  }

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
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Image.network(
                  'https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/sites/83825/images/OK0J2jDTXG2oxyBIzEZm_GOcerts_NTstudies.jpg',
                  width: double.infinity,
                  height: 220,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ArticleCard(
                        imageUrl: 'https://th.bing.com/th/id/OIP.tlsC9-RPfXxHCb2xjX2n2gHaKd?rs=1&pid=ImgDetMain',
                        title: 'LOS AVENGERS EL COMIC',
                        summary: 'Primeras palabras del artículo 1...',
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
          Expanded(
            flex: 1,
            child: FutureBuilder<List<Map<String, String>>>(
              future: _bookReviewsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error al cargar las reseñas'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No hay reseñas disponibles'));
                } else {
                  final reviews = snapshot.data!;
                  final displayReviews = [
                    reviews[_startIndex],
                    reviews[(_startIndex + 1) % 5],
                  ];
                  return ListView.builder(
                    itemCount: displayReviews.length,
                    itemBuilder: (context, index) {
                      final review = displayReviews[index];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.network(
                              review['imageUrl']!,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 2 / 3,
                              fit: BoxFit.cover,
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review['title']!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      review['review']!,
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
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
              Image.network(imageUrl, width: 180, height: 120),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      summary,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
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
