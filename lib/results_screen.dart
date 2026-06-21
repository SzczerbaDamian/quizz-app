import 'package:flutter/material.dart';
import 'package:adv_basics_2/data/question.dart';
import 'package:adv_basics_2/summary_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.choosenAnswers, super.key});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
        'is_answer_correct': choosenAnswers[i] == questions[i].answers[0],
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
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            QuestionSummary(sumarryData),
            SizedBox(height: 30),
            Text('List of answers and questions'),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text('Restart Quiz!')),
          ],
        ),
      ),
    );
  }
}
