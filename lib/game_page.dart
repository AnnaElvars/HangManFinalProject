import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:hangman_final_project/main.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String words = '';
  List<String>? word;
  var wordToGuess = <String>[];
  int nosOfGuesses = 9;
  String alertBoxWord = '';
  int wordsMatched = 0;
  String verdict = '';
  List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  resetGame(bool value) {
    if (value) {
      startGame();
    }
  }

  getPlayerChoice() async {
    bool value = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Play()));
    resetGame(value);
  }

  startGame() {
    Random randomWord = new Random();
    words = nouns[randomWord.nextInt(nouns.length)];
    word = words.toUpperCase().split('');
    alertBoxWord = words.toUpperCase();
    wordToGuess.clear();
    nosOfGuesses = 9;
    wordsMatched = 0;

    for (var i = 0; i < word!.length; i++) {
      wordToGuess.add('_');
    }
    print(word);
    verdict = '';

    setState(() {
      wordToGuess.join();
    });
  }

  checkGameFinished() {
    wordsMatched = 0;
    for (var i = 0; i < word!.length; i++) {
      if (word![i] != wordToGuess[i]) {
        break;
      } else {
        wordsMatched += 1;
      }
    }
  }

  guessedLetter(letter) {
    setState(() {
      if (word!.contains(letter)) {
        verdict = '';
        for (var i = 0; i < word!.length; i++) {
          if (word![i] == letter) {
            wordToGuess.removeAt(i);
            wordToGuess.insert(i, letter);
            checkGameFinished();
            print(wordToGuess);
          }
        }
        if (wordsMatched == words.length) {
          verdict = 'Well Done!';
          Future.delayed(const Duration(milliseconds: 800), () {
            startGame();
          });
        }
      } else {
        if (nosOfGuesses == 1) {
          Future.delayed(const Duration(milliseconds: 400), () {
            getPlayerChoice();
          });
        } else {
          verdict = "Wrong Guess";
          nosOfGuesses -= 1;
        }
      }
    });
  }

  Widget _renderButtons() {
    return Wrap(
      spacing: 2.0,
      alignment: WrapAlignment.center,
      children: alphabet
          .map((letter) => Container(
              margin: EdgeInsets.only(right: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff6c72cb), Color(0xffcb69c1)],
                ),
              ),
              child: ElevatedButton(
                child: Text(letter),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  guessedLetter(letter);
                },
              )))
          .toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 35,
                    ),
                    Text("$nosOfGuesses"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                color: Colors.white,
                height: 200,
                width: 240,
                image: AssetImage(
                  'images/[nosOfGuesses - 1]png',
                ),
              ),
            ),
          ),
          Container(
            height: 90,
            width: double.infinity,
            child: Center(
              child: Text(wordToGuess.join()),
            ),
          ),
          (verdict == "Correctly Guessed")
              ? Text(
                  verdict,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
              : Text(
                  verdict,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: Colors.brown.shade300,
            child: _renderButtons(),
          ),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.brown.shade300,
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/[].png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: BoxConstraints.expand(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text('chosenWord'),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Bottom Content'),
            ),
          ),
        ],
      ),
    ),
  );
}
