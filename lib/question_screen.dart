import 'package:flutter/material.dart';
import 'package:adv_basics_2/answer_button.dart';
import 'package:adv_basics_2/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;

  void answeredQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectedAnswer(selectedAnswer);
      // currentIndex = currentIndex + 1;
      // currentIndex +=1;
      currentIndex++; // increment currentIndex by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answeredQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
