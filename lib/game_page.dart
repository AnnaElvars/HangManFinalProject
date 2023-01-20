import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'dart:math';
import 'package:english_words/english_words.dart';
import 'main.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

TextEditingController letterController = new TextEditingController();
String enteredLetter = '';
String wordToGuess = 'Burdensome';
List<String> correctAnswers = [
'B', 'U', 'R', 'D', 'E', 'N', 'S', 'O', 'M', 'E'];
List<String> wrongAnswers = [];
String inputLetter = letterController.text.toUpperCase().toString();

void _conclusion(
if inputLetter.contains()

)



class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade300,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Image.asset('images/3.png'),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: letterController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'You get 8 Guesses',
                    hintText: 'Guess A Letter',
                    focusColor: Colors.white,
                  ),
                  onChanged: (newLetter) {
                    enteredLetter = newLetter;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.brown.shade400,
                child: Text('Guess'),
                onPressed: () {},
              ),
            ),
            Expanded(child: Text(letterController.text.toUpperCase()),),
            ),],
        ));
  }
}

void
if letterController .text.toString ==
Text(letterController.text.toUpperCase()),
),

