import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  int currenQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currenQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    QuizQuestion currenQuestion = questions[currenQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currenQuestion.question,
            style: GoogleFonts.croissantOne(
              color: const Color.fromARGB(255, 221, 159, 255),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currenQuestion.answers.map((answer) {
            return AnswerButton(answerText: answer, onTap: answerQuestion);
          })
        ],
      ),
    );
  }
}
