import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              Color circleColor = const Color.fromARGB(255, 109, 185, 248);
              if (data["user_answer"] != data["correct_answer"]) {
                circleColor = const Color.fromARGB(255, 232, 127, 255);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: circleColor,
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data["user_answer"] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 183, 142, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data["correct_answer"] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 130, 152, 249),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
