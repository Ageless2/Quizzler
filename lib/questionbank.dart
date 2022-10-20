// ignore_for_file: unused_field, non_constant_identifier_names, avoid_types_as_parameter_names

import 'question.dart';
import 'package:flutter/material.dart';

//These is a list called questionbank.it contains both questions and its respective
// answers.
class Quizbrain {
  final List<Question> questionBank = [
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

  // This is a List of icons to show whether user got it right or wrong
  //after answering a question.

  final List<Icon> scoreKeeper = [];

  int counter = 0;

  void reset() {
    counter = 0;
    scoreKeeper.clear();
  }

  //Displays next question in the list of questions

  String nextQuestion() {
    return questionBank[counter].questiontext;
  }

  // Returns the current question's answer

  bool correctAnswer() {
    return questionBank[counter].answer;
  }

  // Checks if userpicked answer == correctanswer
  // Then update the scorekeeper

  void checkAnswer(bool userPickedAnswer) {
    if (userPickedAnswer == correctAnswer() &&
        scoreKeeper.length < questionBank.length) {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      if (scoreKeeper.length < questionBank.length) {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    }
  }

  void incCounter() {
    if (counter < questionBank.length - 1) {
      counter++;
    }
  }

  void checkScorekeeper(BuildContext context, Function()? onTap) {
    if (counter >= questionBank.length - 1) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            child: SizedBox(
              height: 180,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: onTap,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Finished',
                      style: TextStyle(
                          fontFamily: 'Jakarta',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'You\'ve reached the end of the quiz',
                      style: TextStyle(
                          fontFamily: 'Jakarta',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 50,
                        width: 300,
                        color: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: const Center(
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                                fontFamily: 'Jakarta',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
