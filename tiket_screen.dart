import 'package:flutter/material.dart';

class TiketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Bagian untuk "Sedang Tayang"
            Text(
              'Sedang Tayang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Daftar Film yang Sedang Tayang
            MovieList(
              movies: [
                Movie(
                  title: 'BILA ESOK IBU TIADA',
                  genre: 'Drama, Keluarga',
                  rating: 'R 13+',
                  score: 9.2,
                  imagePath: 'assets/bilaesokibutiada.webp',
                ),
                Movie(
                  title: 'SANTET SEGORO PITU',
                  genre: 'Horror',
                  rating: 'D 17+',
                  score: 9.0,
                  imagePath: 'assets/santetsegoropitu.webp',
                ),
                Movie(
                  title: 'GLADIATOR II',
                  genre: 'Action, Adventure',
                  rating: 'D 17+',
                  score: 9.5,
                  imagePath: 'assets/gladiator2.webp',
                ),
                Movie(
                  title: 'RED ONE',
                  genre: 'Action, Adventure',
                  rating: 'R 13+',
                  score: 9.3,
                  imagePath: 'assets/redone.webp',
                ),
              ],
            ),
            SizedBox(height: 20),
            // Bagian untuk "Akan Datang"
            Text(
              'Akan Datang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Tambahkan konten film yang akan datang di sini
          ],
        ),
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

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: movies.map((movie) {
        return Card(
          child: ListTile(
            leading: Image.asset(movie.imagePath, width: 50, height: 75, fit: BoxFit.cover), // Gambar poster film
            title: Text(movie.title),
            subtitle: Text('${movie.genre}\nRating: ${movie.rating}\nScore: ${movie.score}'),
          ),
        );
      }).toList(),
    );
  }
}
