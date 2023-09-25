import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onReset});
  final List<String> chosenAnswers;
  final void Function() onReset;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].question,
          "correct_answer": questions[i].answers[0],
          "user_answer": chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final int noOfQuestions = questions.length;
    final int noOfCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answerd $noOfCorrectQuestions out of $noOfQuestions questions correctly!",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 221, 159, 255),
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: onReset,
            icon: const Icon(
              Icons.restart_alt,
            ),
            label: const Text('Restart Quiz'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
