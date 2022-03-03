import 'package:flutter/material.dart';
import 'package:quizzler/question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank questionBank = QuestionBank();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  var totalscore = 0;
  var questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                var isCorrect = getAnswer(questionNumber, true);
                generateScore(isCorrect);
                nextQuestion();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                var isCorrect = getAnswer(questionNumber, false);
                generateScore(isCorrect);
                nextQuestion();
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  bool getAnswer(int questionNumber, bool userAnswer) {
    var getQuestionAnswer = questionBank.getQuestionAnswer(questionNumber);
    return getQuestionAnswer == userAnswer ? true : false;
  }

  void generateScore(bool isCorrect) {
    var isGameOver = getGameStatus();

    if (!isGameOver) {
      if (isCorrect) {
        setState(() {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );

          totalscore += 1;
        });
      } else {
        setState(() {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );

          totalscore -= 1;
        });
      }

      var isGameOverNow = getGameStatus();
      if (isGameOverNow) {
        Alert(
          context: context,
          title: "Game Over",
          desc: "Your score:$totalscore",
          buttons: [
            DialogButton(
              child: const Text(
                "RESTART",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
    }
  }

  void nextQuestion() {
    var isGameOver = getGameStatus();

    if (!isGameOver) {
      setState(() {
        questionNumber += 1;
      });
    }
  }

  bool getGameStatus() {
    return scoreKeeper.length == questionBank.getBankLength();
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
