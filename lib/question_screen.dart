import 'package:flutter/material.dart';
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
  final QuizQuestion currenQuestion = questions[0];
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currenQuestion.question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            answerText: currenQuestion.answers[0],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currenQuestion.answers[1],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currenQuestion.answers[2],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currenQuestion.answers[3],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
