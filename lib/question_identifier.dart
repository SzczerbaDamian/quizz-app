import 'package:flutter/material.dart';


class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(30, 30),  
        shape: CircleBorder(),
        backgroundColor: (data['is_answer_correct'] as bool)
          ? const Color.fromARGB(255, 150, 198, 241)  // niebieski
          : const Color.fromARGB(255, 249, 133, 241)
      ),
      child: Text(
        ((data['question_index'] as int) + 1).toString(),
        style: TextStyle(),
      ),
    );
  }
}
