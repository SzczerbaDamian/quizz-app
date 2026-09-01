import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                ElevatedButton(
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
                ),
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
                        style: TextStyle(
                          color: Color.fromARGB(255, 202, 171, 252),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(
                          color: Color.fromARGB(255, 181, 254, 246),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
