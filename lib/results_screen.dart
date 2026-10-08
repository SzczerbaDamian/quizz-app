import 'package:flutter/material.dart';
import 'package:adv_basics_2/data/question.dart';
import 'package:adv_basics_2/summary_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.choosenAnswers,
    required this.restartQuizFunction,
    super.key,
  });

  final List<String> choosenAnswers;
  final void Function() restartQuizFunction;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final sumarryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = sumarryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity, // czemu width a nie height?
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 181, 43, 43),
              ),
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            ),
            QuestionSummary(sumarryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuizFunction,
              style: ButtonStyle(
                iconColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Color.fromARGB(255, 7, 255, 172);
                  } else {
                    return const Color.fromARGB(255, 181, 43, 43);
                  }
                }),
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Color.fromARGB(255, 7, 255, 172);
                  } else {
                    return const Color.fromARGB(255, 167, 181, 43);
                  }
                }),
              ),
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
