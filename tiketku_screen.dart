import 'package:flutter/material.dart';

class TiketkuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        TicketCard(
          movieTitle: 'GLADIATOR II',
          genre: 'Action, Adventure',
          rating: 'D 17+',
          score: 9.5,
          cinema: 'AEON MALL JGC CGV',
          showTime: '14:25',
          imagePath: 'assets/gladiator2.webp',
        ),
        SizedBox(height: 10),
        TicketCard(
          movieTitle: 'RED ONE',
          genre: 'Action, Adventure',
          rating: 'R 13+',
          score: 9.3,
          cinema: 'AEON MALL TANJUNG BARAT XXI',
          showTime: '16:00',
          imagePath: 'assets/redone.webp',
        ),
        // Tambahkan kartu tiket lain sesuai kebutuhan
      ],
    );
  }
}

class TicketCard extends StatelessWidget {
  final String movieTitle;
  final String genre;
  final String rating;
  final double score;
  final String cinema;
  final String showTime;
  final String imagePath;

  TicketCard({
    required this.movieTitle,
    required this.genre,
    required this.rating,
    required this.score,
    required this.cinema,
    required this.showTime,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 75, fit: BoxFit.cover), // Gambar poster film
        title: Text(movieTitle),
        subtitle: Text('$genre\nRating: $rating\nScore: $score\nCinema: $cinema\nShowtime: $showTime'),
      ),
    );
  }
}
