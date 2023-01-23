import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:hangman_final_project/main.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

TextEditingController letterController =
    new TextEditingController(); //To Input Characters for Game
String wordToGuess =
    'Burdensome'; //One word and removed English Words package to simplify
//Random randomWord = new Random(); //random Word from EW package - deleted for now
List<String> correctLetters = [
  'B',
  'U',
  'R',
  'D',
  'E',
  'N',
  'S',
  'O',
  'M',
  'E'
]; // List of Characters in WordToGuess

Map correctAnswersMap = correctLetters
    .asMap(); //mapped list to use to show number of characters on screen
List<String> wrongAnswers =
    []; //List to show wrong guesses and to count number of tries
int numberOfTries =
    8; //to use for number of tries to see if game is won or lost
String inputLetter = letterController.text
    .toUpperCase()
    .toString(); //converting input letter to string
List correctAnswers =
    []; //list to show correctly guessed characters in WordToGuess
int wrongTries = wrongAnswers.length; //
int charactersLines = correctLetters.length;

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.brown.shade300,
              child: Expanded(child: imageUpdate()),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Word Would Appear Here',
                  style: TextStyle(
                    fontFamily: 'AmaticSC',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: letterController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'You get 8 Guesses',
                    hintText: 'Guess A Letter',
                    focusColor: Colors.white,
                  ),
                  onChanged: (enteredLetter) {
                    inputLetter = letterController.text.toUpperCase();
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.brown.shade400,
              child: Text('Guess'),
              onPressed: () {
                setState(() {
                  _conclusion();
                });
              },
            ),
          ),
          Center(
            child: Text(
              'The word does not include:',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                wrongAnswers.join(' '),
                style: TextStyle(
                  fontFamily: 'AmaticSC',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _conclusion() {
  //function to determine if input character is correct or not

  if (correctLetters.contains(inputLetter)) {
    correctAnswers.add(inputLetter);
    hasUserWon();
    print('Correct Letter');
  } else {
    if (!wrongAnswers.contains(inputLetter)) {
      wrongAnswers.add(inputLetter); //no doubles
      print('i am lost');
      hasUserLost();
      print(wrongTries);
    }
  }
}

@override
void hasUserWon() {
  //function to determine if user has won
  if (correctAnswers.length == correctLetters.length) {
    print('YOU ARE A WINNER !');
  }
}

@override
void hasUserLost() {
  //function to determine if user has lost
  if (wrongAnswers.length == numberOfTries) {
    print('YOU ARE A LOSER!');
    print('The word was' + wordToGuess);
  }
}

@override //so widgets could stack
class imageUpdate extends StatefulWidget {
  const imageUpdate({Key? key}) : super(key: key);

  @override
  State<imageUpdate> createState() => _imageUpdateState();
}

class _imageUpdateState extends State<imageUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              color: Colors.brown.shade300,
              child: Image.asset('images/$wrongTries.png'),
            ),
          ),
          Center(
            child: Container(
              color: Colors.brown.shade300,
              child: Image.asset('images/1.png'),
            ),
          ),
        ],
      ),
    );
  }
}
