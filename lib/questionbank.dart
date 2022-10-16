// ignore_for_file: unused_field

import 'question.dart';
import 'package:flutter/material.dart';

class Quizbrain {
  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Backrub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  List<Icon> _scoreKeeper = [];

  int _counter = 0;
  void correct() {
    if (_counter < _questionBank.length &&
        _scoreKeeper.length <= _questionBank.length - 1) {
      _scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    }
  }

  void wrong() {
    if (_counter < _questionBank.length &&
        _scoreKeeper.length <= _questionBank.length - 1) {
      _scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  void reset() {
    {
      _counter = 0;
      _scoreKeeper = [];
    }
  }

  String nextQuestion() {
    return _questionBank[_counter].questiontext;
  }

  bool correctAnswer() {
    return _questionBank[_counter].answer;
  }

  void checkAnswer(bool userPickedAnswer) {
    if (userPickedAnswer == correctAnswer()) {
      correct();
    } else {
      wrong();
    }
    incCounter();
  }

  void incCounter() {
    if (_counter < _questionBank.length - 1) {
      _counter++;
    } else {
      reset();
    }
  }

  List<Icon> displayIcon() {
    return _scoreKeeper;
  }
}
