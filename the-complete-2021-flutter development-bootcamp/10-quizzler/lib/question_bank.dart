import 'package:quizzler/question.dart';

class QuestionBank {
  final List<Question> _questions = [
    Question(
      text: "You can lead a cow down stairs but not up stairs.",
      answer: false,
    ),
    Question(
      text: "Approximately one quarter of human bones are in the feet.",
      answer: true,
    ),
    Question(
      text: "A slug's blood is green.",
      answer: true,
    ),
  ];

  String getQuestionText(int questionNumber) => _questions[questionNumber].text;

  bool getQuestionAnswer(int questionNumber) =>
      _questions[questionNumber].answer;

  int getBankLength() => _questions.length;
}
