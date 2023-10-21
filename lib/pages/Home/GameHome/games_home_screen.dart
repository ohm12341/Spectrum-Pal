import 'package:flutter/material.dart';
import 'package:spectrum_pal/games/emoji_connection/emoji_connection.dart';

class GamesHomeScreen extends StatefulWidget {
  @override
  _GamesHomeScreenState createState() => _GamesHomeScreenState();
}

class _GamesHomeScreenState extends State<GamesHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Games"),
        actions: const [Icon(Icons.person)], // For the profile picture
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Bar
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),

            // Featured Game Carousel
            SizedBox(
              height: 100,
              child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(child: Text('Game ${index + 1}')), // Replace with actual game content
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Game Thumbnails (Shown using GridView for this example)
           Expanded(
  child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: 4,
    itemBuilder: (context, index) {
      if (index == 0) { // Let's say the first game is the "Emoji Connection" game
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmojiConnectionPage(),
              ),
            );
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.emoji_emotions), // Representing the Emoji game
                const Text('Emoji Connection'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (starIndex) => Icon(
                      starIndex <= index ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image), // Replace with actual game thumbnail for other games
            const Text('Game title'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (starIndex) => Icon(
                  starIndex <= index ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      );
    },
  ),
),

            TextButton(
                onPressed: () {},
                child: const Text('Button Text'),
              )

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
