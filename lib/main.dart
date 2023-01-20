import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'game_page.dart';
import 'hangman_function.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  runApp(HangMan());
}

class HangMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Play(),
    );
  }
}

class Play extends StatefulWidget {
  const Play({Key? key}) : super(key: key);
  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Center(
          child: Text('Hang Man'),
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'AmaticSC',
          fontSize: 50,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/hangman.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: MaterialButton(
          color: Colors.transparent,
          child: Text(
            'play',
            style: TextStyle(
              fontFamily: 'AmaticSC',
              fontSize: 210,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(8, 6),
                  color: Color.alphaBlend(Colors.brown.shade700, Colors.black),
                ),
              ],
              letterSpacing: 8,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GamePage()));
          },
        ),
      ),
    );
  }
}
