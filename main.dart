import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';
import 'bioskop_screen.dart';
import 'tiket_screen.dart';
import 'tiketku_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIX ID',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/register': (context) => RegisterScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/bioskop': (context) => BioskopScreen(),
        '/tiket': (context) => TiketScreen(),
        '/tiketku': (context) => TiketkuScreen(),
      },
    );
  }
}
