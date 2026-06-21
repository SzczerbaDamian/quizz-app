import 'package:flutter/material.dart';
import 'package:adv_basics_2/question_screen.dart';
import 'package:adv_basics_2/start_screen.dart';
import 'package:adv_basics_2/data/question.dart';
import 'package:adv_basics_2/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'StartScreen';

  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'ResultsScreen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'QuestionScreen') {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'ResultsScreen') {
      screenWidget = ResultsScreen(choosenAnswers: selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 76, 20, 154),
                Color.fromARGB(255, 107, 18, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
