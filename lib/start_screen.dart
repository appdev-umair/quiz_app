import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.switchScreen, {
    super.key,
  });
  final void Function() switchScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage(
              "assets/images/quiz-logo.png",
            ),
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 221, 159, 255)),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 241, 193, 255),
            ),
            onPressed: switchScreen,
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
