import 'package:flutter/material.dart';

class BioskopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
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
            NotificationBanner(),
            SizedBox(height: 20),
            BioskopList(),
          ],
        ),
      ),
    );
  }
}

class NotificationBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Tandai bioskop favoritmu!',
            style: TextStyle(fontSize: 16),
          ),
          Icon(Icons.favorite, color: Colors.red),
        ],
      ),
    );
  }
}

class BioskopList extends StatelessWidget {
  final List<Map<String, String>> bioskops = [
    {'name': 'AEON MALL JGC CGV'},
    {'name': 'AEON MALL TANJUNG BARAT XXI'},
    {'name': 'AGORA MALL IMAX'},
    {'name': 'AGORA MALL PREMIERE'},
    {'name': 'AGORA MALL XXI'},
    {'name': 'ARION XXI'},
    {'name': 'ARTHA GADING XXI'},
    {'name': 'BASSURA XXI'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: bioskops.map((bioskop) {
        return ListTile(
          title: Text(bioskop['name']!),
          leading: Icon(Icons.location_city),
          onTap: () {
            // Aksi ketika salah satu bioskop dipilih
          },
        );
      }).toList(),
    );
  }
}
