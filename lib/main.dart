import 'package:flutter/material.dart';
//
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

// Create Material App Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        // User material 3.
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const XylophoneHome(),
    );
  }
}

// Our Home Widget
class XylophoneHome extends StatelessWidget {
  const XylophoneHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Xylophone',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: const Xylophone(),
    );
  }
}

// Xylophone Widget. Not nessecary to do it like this
class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        XylophoneKey(color: Colors.red, note: 'note1.wav'),
        XylophoneKey(color: Colors.orange, note: 'note2.wav'),
        XylophoneKey(color: Colors.yellow, note: 'note3.wav'),
        XylophoneKey(color: Colors.green, note: 'note4.wav'),
        XylophoneKey(color: Colors.blue, note: 'note5.wav'),
        XylophoneKey(color: Colors.purple, note: 'note6.wav'),
        XylophoneKey(color: Colors.pink, note: 'note7.wav'),
      ],
    );
  }
}

// Xylpohone Key widget builder
// Takes a color and a note to play
class XylophoneKey extends StatelessWidget {
  XylophoneKey({
    super.key,
    required this.color,
    required this.note,
  });

  final Color color;
  final String note;
  // Create an instance of a AudioPlayer
  final AudioPlayer player = AudioPlayer();

  Future<void> playNote(String note) async {
    await player.release();
    await player.play(AssetSource('audio/$note'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              color: color,
            ),
            const Positioned(
              left: 20,
              top: 40,
              child: Icon(
                Icons.circle,
                color: Colors.white70,
                size: 22,
              ),
            ),
            const Positioned(
              right: 20,
              top: 40,
              child: Icon(
                Icons.circle,
                color: Colors.white70,
                size: 22,
              ),
            ),
          ],
        ),
        onTap: () {
          playNote(note);
        },
      ),
    );
  }
}
