import 'package:flutter/material.dart';
import 'package:spectrum_pal/SplashScreen/splash_screen.dart';
import 'package:spectrum_pal/pages/Home/GameHome/games_home_screen.dart';
import 'package:spectrum_pal/pages/Home/home_page.dart'; // Assuming you have a home_page.dart file. If not, adjust the import path accordingly.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spectrum Pal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',  // Starting route
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => GamesHomeScreen(),  // Make sure you have a HomePage widget. If the widget has a different name, adjust accordingly.
      },
    );
  }
}
