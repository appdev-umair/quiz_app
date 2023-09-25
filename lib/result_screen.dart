import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers});
  final List<String> choosenAnswers;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "You answerd X out of Y questions!",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "List of answers and questions",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.restart_alt,
            ),
            label: const Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}
