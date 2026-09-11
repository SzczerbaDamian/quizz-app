import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    required this.isAnswerCorrect,
    required this.questionIndex,
    super.key,
  });

  final bool isAnswerCorrect;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(30, 30),
        shape: CircleBorder(),
        backgroundColor: (isAnswerCorrect)
            ? const Color.fromARGB(255, 150, 198, 241) // niebieski
            : const Color.fromARGB(255, 249, 133, 241),
      ),
      child: Text(((questionIndex) + 1).toString(), style: TextStyle()),
    );
  }
}
