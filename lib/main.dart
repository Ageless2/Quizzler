import 'package:flutter/material.dart';
import 'questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  void alert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "RFLUTTER ALERT",
      desc: "You ",
      buttons: [
        DialogButton(
          child: const Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    questionss.reset();
  }

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
                setState(() {
                  questionss.checkAnswer(true);
                  questionss.checkScorekeeper(alert);
                  questionss.incCounter();
                });
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
                  questionss.checkAnswer(false);
                  questionss.checkScorekeeper(alert);
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
        Row(children: questionss.scoreKeeper)
      ],
    );
  }
}
