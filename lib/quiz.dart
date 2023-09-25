import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
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
      activeScreen = "question_screen";
    });
  }

  void addAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        answers.clear();
        activeScreen = "start-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "question_screen") {
      screenWidget = QuestionScreen(addAnswer);
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
