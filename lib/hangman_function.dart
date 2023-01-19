import 'package:english_words/english_words.dart';

//class HangmanFunction {
//static const int hanged = 9;
//final List<String> wordList;
//final Set<String> lettersGuessed = new Set<String>();

//Words()(List<String> words) : wordList = new List<String>.from(words);

//void newGame() {
//  new Random();words = nouns[randomWord.nextInt(nouns.length)];
//  word = words.toUpperCase().split('');
//  alertBoxWord = words.toUpperCase();
//  _wrongGuesses = 0;

//  lettersGuessed.clear();

//    _onChange.add(wordForDisplay);
// }

//  void guessLetter(String letter) {
//   lettersGuessed.add(letter);

//  if (_wordToGuess.contains(letter)) {
//    _onRight.add(letter);

//    if (isWordComplete) {
//      _onChange.add(fullWord);
//      _onWin.add(null);
//    }
//    else {
//      _onChange.add(wordForDisplay);
//    }
//  }
//  else {
//    _wrongGuesses++;

//    _onWrong.add(_wrongGuesses);

//    if (_wrongGuesses == hanged) {
//      _onChange.add(fullWord);
//      _onLose.add(null);
//    }
//  }
//}

// int get wrongGuesses => _wrongGuesses;

//List<String> get wordToGuess => _wordToGuess;

//String get fullWord => wordToGuess.join();

// String get wordForDisplay =>
//     wordToGuess.map((String letter) =>
//    lettersGuessed.contains(letter) ? letter : "_").join();

// bool get isWordComplete {
//  for (String letter in _wordToGuess) {
//    if (!lettersGuessed.contains(letter)) {
//     return false;
//   }
// }

//   return true;
//  }
//}
