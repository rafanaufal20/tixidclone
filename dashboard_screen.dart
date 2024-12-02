import 'package:flutter/material.dart';
import 'bioskop_screen.dart';
import 'tiket_screen.dart';
import 'tiketku_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    BioskopScreen(),
    TiketScreen(),
    TiketkuScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIX ID'),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Aksi untuk pencarian
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Bioskop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tiketku',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Lokasi dan Pencarian
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lokasi: JAKARTA',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.location_on, color: Colors.blue[800]),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari di TIX ID',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Banner Promosi
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/banner_promo.jpg'), // Gambar promo
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // TIX VIP
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'TIX VIP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lebih seru, koin melimpah, dapat hadiah!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Sedang Tayang
            Text(
              'Sedang Tayang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Daftar Film
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  MovieCard(title: 'Bila Esok Ibu Tiada', rating: 9.2),
                  SizedBox(width: 10),
                  MovieCard(title: 'Santet Segoro Pitu', rating: 9.0),
                  SizedBox(width: 10),
                  MovieCard(title: 'Gladiator II', rating: 9.5),
                  SizedBox(width: 10),
                  MovieCard(title: 'Red One', rating: 9.3),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Spotlight
            Text(
              'Spotlight',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Konten Spotlight
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Konten Spotlight',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            // TIX ID Box Office
            Text(
              'TIX ID Box Office',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Konten Box Office',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            // TIX Now
            Text(
              'TIX Now',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Berita TIX Now',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final double rating;

  MovieCard({required this.title, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage('assets/movie_placeholder.jpg'), // Gambar placeholder film
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black.withOpacity(0.7),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black.withOpacity(0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Rating: $rating',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.star, color: Colors.yellow),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
