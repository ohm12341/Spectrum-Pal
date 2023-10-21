// level_selection_page.dart
import 'package:flutter/material.dart';
import 'package:spectrum_pal/games/emoji_connection/in_game_page.dart';

class LevelSelectionPage extends StatelessWidget {
  // For the sake of demonstration, we will have 10 levels.
  final int numberOfLevels = 10;

  const LevelSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level Selection'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 levels in each row
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: numberOfLevels,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InGamePage(level: index + 1)),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.all(20.0),
            ),
            child: Text(
              'Level ${index + 1}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
