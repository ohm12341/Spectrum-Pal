import 'package:flutter/material.dart';
import 'package:spectrum_pal/games/emoji_connection/level_selection_page.dart';

class EmojiConnectionPage extends StatelessWidget {
  const EmojiConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emoji Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Game Title
            const Text(
              'Emoji Connection',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),

            const SizedBox(height: 50.0),

            // Play Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelSelectionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                backgroundColor: Colors.green,
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('PLAY'),
            ),

            const SizedBox(height: 20.0),

            // Options/Settings Button
            OutlinedButton(
              onPressed: () {
                // TODO: Navigate to Settings Page
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0),
                side: const BorderSide(color: Colors.blue, width: 2.0),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              ),
              child: const Text('OPTIONS'),
            ),

            const SizedBox(height: 20.0),

            // Leaderboard Button
            OutlinedButton(
              onPressed: () {
                // TODO: Navigate to Leaderboard Page
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 15.0),
                side: const BorderSide(color: Colors.orange, width: 2.0),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.orange,
                ),
              ),
              child: const Text('LEADERBOARD'),
            ),
          ],
        ),
      ),
    );
  }
}
