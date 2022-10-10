import 'package:flutter/material.dart';
import 'questionbank.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(child: Text('Quiz_App')),
      ),
      backgroundColor: Colors.grey.shade900,
      body: const Quiz(),
    ));
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

Quizbrain questionss = Quizbrain();

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionss.nextQuestion(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                setState(
                  () {
                    if (true == questionss.correctAnswer()) {
                      questionss.correct();
                    } else {
                      questionss.wrong();
                    }
                    questionss.incCounter();
                  },
                );
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (false == questionss.correctAnswer()) {
                    questionss.correct();
                  } else {
                    questionss.wrong();
                  }
                  questionss.incCounter();
                });
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Row(children: questionss.displayIcon())
      ],
    );
  }
}
