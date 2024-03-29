import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> answers = [];
  String activeScreen = "start_screen";

  void switchScreen() {
    setState(() {
      answers.clear();
      activeScreen = "question_screen";
    });
  }

  void addAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "question_screen") {
      screenWidget = QuestionScreen(addAnswer);
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chosenAnswers: answers,
        onReset: switchScreen,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 68, 0, 184),
                Color.fromARGB(255, 95, 0, 139),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
