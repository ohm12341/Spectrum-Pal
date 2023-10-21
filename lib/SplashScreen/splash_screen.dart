// splash_screen.dart

import 'package:flutter/material.dart';
import 'package:spectrum_pal/pages/Home/GameHome/games_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GamesHomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.graphic_eq, size: 50, color: Colors.white), // Replace with actual logo icon or image
            ),
            SizedBox(height: 20),
            Text(
              "Education & Learning app for autistic kids",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            Text(
              "Spectrum Pal: Discover, Play, Thrive.",
              style: TextStyle(fontSize: 16, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}



  
