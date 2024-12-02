import 'package:flutter/material.dart';

class TiketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Sedang Tayang',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Akan Datang',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            SedangTayangTab(),
            AkanDatangTab(),
          ],
        ),
      ),
    );
  }
}

class SedangTayangTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 210 / 297, // Proporsi ukuran A4
        ),
        itemCount: sedangTayangMovies.length,
        itemBuilder: (context, index) {
          final movie = sedangTayangMovies[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}

class AkanDatangTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 210 / 297, // Proporsi ukuran A4
        ),
        itemCount: akanDatangMovies.length,
        itemBuilder: (context, index) {
          final movie = akanDatangMovies[index];
          return MovieCard(movie: movie);
        },
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
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            movie.imagePath,
            width: double.maxFinite,
            height: 196,
            fit: BoxFit.contain,
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
                  movie.genre,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Score: ${movie.score}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(Icons.favorite_border),
                  ],
                ),
              ],
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

final List<Movie> akanDatangMovies = [
  Movie(
    title: 'WICKED',
    genre: 'Genre',
    rating: 'Rating',
    score: 9.0,
    imagePath: 'assets/wicked.jpg',
  ),
  Movie(
    title: 'MOANA 2',
    genre: 'Genre',
    rating: 'Rating',
    score: 8.5,
    imagePath: 'assets/moana2.jpg',
  ),
  // Tambahkan lebih banyak film yang akan datang sesuai kebutuhan
];
