import 'package:flutter/material.dart';
import 'package:adv_basics_2/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuestionIdentifier(data),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                data['question'] as String,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                data['user_answer'] as String,
                style: TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
              ),
              const SizedBox(height: 5),
              Text(
                data['correct_answer'] as String,
                style: TextStyle(color: Color.fromARGB(255, 181, 254, 246)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
