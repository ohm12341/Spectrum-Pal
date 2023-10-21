// in_game_page.dart
import 'package:flutter/material.dart';

class InGamePage extends StatefulWidget {
  final int level;

  const InGamePage({super.key, required this.level});

  @override
  _InGamePageState createState() => _InGamePageState();
}

class _InGamePageState extends State<InGamePage> {
  // Assuming each level introduces one more pair of emojis to match
  List<String> emojis = [];
  int score = 0;

  // List of possible emoji pairs - this is just a sample. You can add more.
  List<List<String>> emojiPairs = [
    ['🍎', '🍏'],
    ['🌧', '☔'],
    ['🐱', '🐶'],
    ['🍕', '🍔'],
    ['🚗', '🚌'],
    ['🎸', '🎤'],
    ['🍦', '🍧'],
    ['🎓', '📚'],
    ['⚽', '🥅'],
    ['🚀', '🌌']
  ];
  String? draggedEmoji;

  @override
  void initState() {
    super.initState();

    // Generate the emoji list based on the current level
    for (int i = 0; i <= widget.level && i < emojiPairs.length; i++) {
      emojis.addAll(emojiPairs[i]);
    }

    // Shuffle the list to randomize the positions
    emojis.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score: $score'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: emojis.length,
              itemBuilder: (context, index) {
                return Draggable<String>(
                  data: emojis[index],
                  feedback: Card(
                    child: Center(
                      child: Text(
                        emojis[index],
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(),
                  child: Card(
                    child: Center(
                      child: Text(
                        emojis[index],
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: emojis.length,
              itemBuilder: (context, index) {
                return DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return Card(
                      color:
                          candidateData.isEmpty ? Colors.white : Colors.yellow,
                      child: Center(
                        child: Text(
                          emojis[index],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    );
                  },
                  onWillAccept: (data) => data == emojis[index],
                  onAccept: (data) {
                    checkMatch(data, emojis[index]);
                  },
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkMatch(String sourceEmoji, String targetEmoji) {
    bool isCorrectMatch = false;

    for (var pair in emojiPairs) {
      if (pair.contains(sourceEmoji) && pair.contains(targetEmoji)) {
        isCorrectMatch = true;
        setState(() {
          score += 10;
        });
        int debugscore = widget.level * 10;
        print("Score after correct match: $score");
        print("Score after correct match:() $debugscore");
        if (score == widget.level * 10) {
          print("Level complete condition met!");
          showCompletionDialog();
          return;
        }
      }
    }

    if (!isCorrectMatch) {
      setState(() {
        score -= 5;
      });
      print("Score after incorrect match: $score");
    }
  }

  void showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Congratulations!'),
        content: Text('You have completed the level.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              startNextLevel();
            },
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }

  void startNextLevel() {
    if (widget.level < emojiPairs.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => InGamePage(level: widget.level + 1),
        ),
      );
    } else {
      // Game completed! You can navigate to a different page or show another dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Game Completed!'),
            content: const Text('You have completed all the levels!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          );
        },
      );
    }
  }
}
