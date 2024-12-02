import 'package:flutter/material.dart';
import 'package:ukltixid/bioskop_screen.dart';
import 'package:ukltixid/tiket_screen.dart';
import 'package:ukltixid/tiketku_screen.dart';

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
        title: Text('TIX ID', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 6, 45, 90),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
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
            icon: Icon(Icons.local_activity),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tiketku',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/banner_promo.jpg',
    'assets/banner_promo2.jpg',
    'assets/banner_promo3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Color.fromARGB(255, 6, 45, 90),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person, color: Colors.white),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari di TIX ID',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lokasi: JAKARTA',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(Icons.location_on, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Banner Promosi
          Container(
            height: 150,
            child: PageView.builder(
              itemCount: bannerImages.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bannerImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // Sedang Tayang
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sedang Tayang',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: sedangTayangMovies.map((movie) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: MovieCard(movie: movie),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 6, 45, 90),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Spotlight',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Berita hiburan terhangat untuk Anda!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/spotlight_image.jpg'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '10 TIX ID Weekly Box Office FILM TERLARIS DI BIOSKOP INDONESIA 11-17 November 2024',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text('57'),
                    SizedBox(width: 10),
                    Icon(Icons.comment),
                    SizedBox(width: 5),
                    Text('0'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'TIX Now',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Update terkini dunia hiburan!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 10),
                NewsCard(
                  title: 'Drama Romantis Terbaru "We Live in Time" Dibintangi Andrew Garfield dan Florence Pugh',
                  views: '19',
                  timeAgo: '2 jam lalu',
                  imageUrl: 'assets/we_live_in_time.jpg',
                ),
                SizedBox(height: 10),
                NewsCard(
                  title: 'Tom Cruise Rilis Trailer "Mission: Impossible 8 The Final Reckoning"',
                  views: '1.1K',
                  timeAgo: '3 hari lalu',
                  imageUrl: 'assets/mission_impossible_8.jpg',
                ),
                SizedBox(height: 10),
                NewsCard(
                  title: 'Ariana Grande dan Cynthia Erivo Siap Bintangi Film "WICKED"',
                  views: '792',
                  timeAgo: '4 hari lalu',
                  imageUrl: 'assets/wicked.jpg',
                ),
                SizedBox(height: 10),
                NewsCard(
                  title: 'Sinopsis "Betting With Ghost" Asal Vietnam',
                  views: '54',
                  timeAgo: '5 hari lalu',
                  imageUrl: 'assets/betting_with_ghost.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Movie {
  final String title;
  final String genre;
  final String rating;
  final double score;
  final String imagePath;

  Movie({
    required this.title,
    required this.genre,
    required this.rating,
    required this.score,
    required this.imagePath,
  });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
            child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              movie.imagePath,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rating: ${movie.rating}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Score: ${movie.score}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Beli Tiket'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 6, 45, 90),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String views;
  final String timeAgo;
  final String imageUrl;

  NewsCard({
    required this.title,
    required this.views,
    required this.timeAgo,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.visibility, size: 14),
                          SizedBox(width: 4),
                          Text(views),
                        ],
                      ),
                      Text(timeAgo, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Movie> sedangTayangMovies = [
  Movie(
    title: 'BILA ESOK IBU TIADA',
    genre: 'Drama, Keluarga',
    rating: 'R 13+',
    score: 9.2,
    imagePath: 'assets/bila_esok_ibu_tiada.jpg',
  ),
  Movie(
    title: 'SANTET SEGORO PITU',
    genre: 'Horror',
    rating: 'D 17+',
    score: 9.0,
    imagePath: 'assets/santet_segoro_pitu.jpg',
  ),
  Movie(
    title: 'GLADIATOR II',
    genre: 'Action, Adventure',
    rating: 'D 17+',
    score: 9.5,
    imagePath: 'assets/gladiator_ii.jpg',
  ),
  Movie(
    title: 'RED ONE',
    genre: 'Action, Adventure',
    rating: 'R 13+',
    score: 9.3,
    imagePath: 'assets/red_one.jpg',
  ),
];
